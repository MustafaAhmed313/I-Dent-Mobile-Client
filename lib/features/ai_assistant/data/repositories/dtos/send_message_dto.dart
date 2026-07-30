class SendMessageDto {

  String sessionId;
  String userId;
  String message;

  SendMessageDto({
    required this.message,
    required this.sessionId,
    required this.userId,
  });
}