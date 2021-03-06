import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'CommonResponse.g.dart';

@JsonSerializable()
class CommonResponse {
  String? status;

  String? message;

  @JsonKey(name: 'dev_message')
  String? devMessage;

  String getMessage() {
    String m = message!;
    if (devMessage != null) {
      m += ", dev_message: $devMessage";
    }
    return m;
  }

  get isSuccess {
    return status == STATUS_SUCCESS;
  }

  static const STATUS_SUCCESS = "SUCCESS";
  static const STATUS_FAIL = "FAIL";
  static const ERROR_INVALID_AUTH_TOKEN =
      "INVALID_AUTH_TOKEN"; //wrong auth_token so redirect to login
  static const ERROR_INVALID_DEVICE_ID =
      "INVALID_DEVICE_ID"; //invalid device_id need to re-authenticate
  static const ERROR_INVALID_TRANSACTION_ID =
      "INVALID_TRANSACTION_ID"; //invalid device_id need to re-authenticate
  static const ERROR_INVALID_DEVICE_AUTH =
      "INVALID_DEVICE_AUTH"; //invalid auth-token need to re-authenticate
  static const ERROR_LOCKED_KIOSK =
      "LOCKED_KIOSK"; //invalid auth-token need to re-authenticate

}
