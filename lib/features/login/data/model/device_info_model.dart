class DeviceInfoModel {
  late String isResumeUpdate;
  late String message;
  late String error;
  late String messageType;

  DeviceInfoModel(
      {required this.isResumeUpdate,
      required this.message,
      required this.error,
      required this.messageType});

  DeviceInfoModel.fromJson(Map<String, dynamic> json) {
    isResumeUpdate = json['isResumeUpdate'];
    message = json['Message'];
    error = json['error'];
    messageType = json['messageType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isResumeUpdate'] = isResumeUpdate;
    data['Message'] = message;
    data['error'] = error;
    data['messageType'] = messageType;
    return data;
  }
}
