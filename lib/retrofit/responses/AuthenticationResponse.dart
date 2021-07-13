import 'package:json_annotation/json_annotation.dart';
import 'package:kiosk_app/retrofit/responses/CommonResponse.dart';

part 'AuthenticationResponse.g.dart';

@JsonSerializable()
class AuthenticationResponse extends CommonResponse {
  Payload? payload;

  String? getAuthToken() {
    return payload?.authToken;
  }

  AuthenticationResponse fromJson(Map<String, dynamic> json) {
    return _$AuthenticationResponseFromJson(json);
  }

  Map<String, dynamic> toJson1(AuthenticationResponse instance) {
    return _$AuthenticationResponseToJson(instance);
  }
}

@JsonSerializable()
class Payload {
  @JsonKey(name: 'auth_token')
  String? authToken;
}
