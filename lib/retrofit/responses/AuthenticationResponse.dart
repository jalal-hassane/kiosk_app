import 'package:json_annotation/json_annotation.dart';
import 'package:kiosk_app/retrofit/responses/CommonResponse.dart';

part 'AuthenticationResponse.g.dart';

@JsonSerializable()
class AuthenticationResponse extends CommonResponse {
  Payload? payload;

  String? getAuthToken() {
    return payload?.authToken;
  }
}

@JsonSerializable()
class Payload {
  @JsonKey(name: 'auth_token')
  String? authToken;
}
