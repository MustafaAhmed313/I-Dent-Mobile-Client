export 'message_model.dart';

enum MessageRole {
 user,
 model, 
}

class MessageModel {
  MessageRole role;
  String content;

  MessageModel({
    required this.role,
    required this.content
  });
}
