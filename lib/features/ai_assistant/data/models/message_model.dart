import 'package:i_dent_client/core/helpers/dio_helper.dart';

enum MessageRole {
  user,
  model,
}

class MessageModel {
  MessageRole role;
  String content;

  MessageModel({required this.role, required this.content});

  factory MessageModel.fromJson(Json json) {
    return MessageModel(
        role: json['role'] == "user" ? MessageRole.user : MessageRole.model,
        content: json['content']);
  }
}
