import 'package:i_dent_client/core/helpers/dio_helper.dart';

class SessionModel {
  String id;
  String userId;
  String title;
  DateTime createdAt;
  DateTime updatedAt;

  SessionModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.updatedAt,
    required this.createdAt,
  });

  factory SessionModel.fromJson(Json json) {
    return SessionModel(
      id: json['id'] as String,
      title: json['title'] as String,
      userId: json['user_id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }
}