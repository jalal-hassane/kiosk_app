// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AuthenticationResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationResponse _$AuthenticationResponseFromJson(
    Map<String, dynamic> json) {
  return AuthenticationResponse()
    ..status = json['status'] as String?
    ..message = json['message'] as String?
    ..devMessage = json['dev_message'] as String?
    ..payload = json['payload'] == null
        ? null
        : _$PayloadFromJson(json['payload'] as Map<String, dynamic>);
}

Map<String, dynamic> _$AuthenticationResponseToJson(
        AuthenticationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'dev_message': instance.devMessage,
      'payload': instance.payload,
    };

Payload _$PayloadFromJson(Map<String, dynamic> json) {
  return Payload()..authToken = json['auth_token'] as String?;
}

Map<String, dynamic> _$PayloadToJson(Payload instance) => <String, dynamic>{
      'auth_token': instance.authToken,
    };
