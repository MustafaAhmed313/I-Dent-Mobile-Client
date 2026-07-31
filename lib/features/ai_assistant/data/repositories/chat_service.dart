import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:i_dent_client/core/index.dart';
import 'package:i_dent_client/features/ai_assistant/data/repositories/chat_repository.dart';
import 'package:i_dent_client/features/ai_assistant/data/repositories/dtos/get_session_dto.dart';
import 'package:i_dent_client/features/index.dart';
import 'dtos/index.dart';

class ChatService implements ChatRepository {
  final DioHelper _dio;

  ChatService({
    required DioHelper dio,
  }) : _dio = dio;

  @override
  Stream<String> sendMessage({required SendMessageDto dto}) async* {
    final client = http.Client();

    final request = http.Request(
      'POST',
      Uri.parse('http://192.168.1.20:3000/llm/chat'),
    );

    request.headers['Content-Type'] = 'application/json';
    request.body = jsonEncode({
      'session_id': dto.sessionId,
      'message': dto.message,
      'user_id': dto.userId,
    });

    try {
      final streamedResponse = await client.send(request);

      await for (final line in streamedResponse.stream
          .transform(utf8.decoder)
          .transform(const LineSplitter())) {
        if (line.startsWith('data:')) {
          final jsonString = line.replaceFirst('data: ', '').trim();
          if (jsonString == '[DONE]') {
            break;
          }
          final data = jsonDecode(jsonString);
          final token = data['token'];
          if (token != null) {
            yield token.toString();
          }
        }
      }
    } catch (e) {
      print('Error: $e');
      rethrow;
    } finally {
      client.close();
    }
  }

  @override
  Future<Either<Failure, SessionModel>> createSession({required CreateSessionDto dto}) async {
    try {
      final response = await _dio.post(endpoint: Endpoints.sessions, body: {
        "user_id": dto.userId,
        "title": dto.title,
      });

      return right(SessionModel.fromJson(response["data"]));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(exception: e));
      }
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SessionModel>>> getRecentSessions() async {
    try {
      final response = await _dio.get(endpoint: Endpoints.sessions);

      List<SessionModel> sessions = [];
      for (final session in response["data"]["chats"]) {
        sessions.add(SessionModel.fromJson(session));
      }
      
      return right(sessions);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(exception: e));
      }
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MessageModel>>> getSession({required GetSessionDto dto}) async {
    try {
      final response = await _dio.get(endpoint: "${Endpoints.sessions}/${dto.sessionId}", params: {
        "userId": dto.userId
      });

      List<MessageModel> history = [];
      for (final message in response['data']['history']) {
        history.add(MessageModel.fromJson(message));
      }

      return right(history);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(exception: e));
      }
      return left(ServerFailure(message: e.toString()));
    }
  }

}
