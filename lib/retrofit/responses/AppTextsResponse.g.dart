// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppTextsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppTextsResponse _$AppTextsResponseFromJson(Map<String, dynamic> json) {
  return AppTextsResponse()
    ..status = json['status'] as String?
    ..message = json['message'] as String?
    ..devMessage = json['dev_message'] as String?
    ..payload = json['payload'] == null
        ? null
        : _$PayloadFromJson(json['payload'] as Map<String, dynamic>);
}

Map<String, dynamic> _$AppTextsResponseToJson(AppTextsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'dev_message': instance.devMessage,
      'payload': instance.payload,
    };

Payload _$PayloadFromJson(Map<String, dynamic> json) {
  return Payload()
    ..appText = json['app_text'] == null
        ? null
        : Text().fromJson(json['app_text'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PayloadToJson(Payload instance) => <String, dynamic>{
      'app_text': instance.appText,
    };
