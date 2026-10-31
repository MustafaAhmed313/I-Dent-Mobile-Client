import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:i_dent_client/core/constants/index.dart';
import 'package:i_dent_client/core/errors/faliures.dart';
import 'package:i_dent_client/core/helpers/dio_helper.dart';
import 'package:i_dent_client/features/notifications/data/repositories/dtos/save_device_token.dto.dart';

import 'notification_repository.dart';

class NotificationService implements NotificationRepository {
  final DioHelper dio;
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  NotificationService({required this.dio});

  @override
  Future<void> registerDeviceToken() async {
    final permission = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (permission.authorizationStatus == AuthorizationStatus.denied) {
      return;
    }

    final token = await _messaging.getToken();
    if (token == null) return;

    final status = await _saveDeviceToken(
        dto: SaveDeviceTokenDto(
      userId:
          "ced37e12-d324-4678-b3fc-d4fc229e6345", // Replace with actual user ID
      token: token,
      platform:
          Platform.isIOS ? "ios" : "android", // or "ios" based on the platform
    ));

    _messaging.onTokenRefresh.listen((newToken) {
      _saveDeviceToken(
          dto: SaveDeviceTokenDto(
        userId: "ced37e12-d324-4678-b3fc-d4fc229e6345",
        token: token,
        platform: Platform.isIOS ? "ios" : "android",
      ));
    });
  }

  @override
  Future<void> unregisterDeviceToken() {
    // TODO: implement unregisterDeviceToken
    throw UnimplementedError();
  }

  Future<Either<Failure, String>> _saveDeviceToken(
      {required SaveDeviceTokenDto dto}) async {
    try {
      final response = await dio.patch(endpoint: Endpoints.deviceToken, body: {
        "userId": dto.userId,
        "token": dto.token,
        "platform": dto.platform,
      });

      return right(response["data"].status);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(exception: e));
      }
      return left(ServerFailure(message: e.toString()));
    }
  }
}
