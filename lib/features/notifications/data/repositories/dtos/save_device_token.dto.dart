class SaveDeviceTokenDto {

  String userId;
  String token;
  String platform;

  SaveDeviceTokenDto({
    required this.userId,
    required this.token,
    required this.platform,
  });
}