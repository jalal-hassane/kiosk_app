// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SaveSpinPrizeResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveSpinPrizeResponse _$SaveSpinPrizeResponseFromJson(
    Map<String, dynamic> json) {
  return SaveSpinPrizeResponse()
    ..status = json['status'] as String?
    ..message = json['message'] as String?
    ..devMessage = json['dev_message'] as String?
    ..payload = json['payload'] == null
        ? null
        : _$PayloadFromJson(json['payload'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SaveSpinPrizeResponseToJson(
        SaveSpinPrizeResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'dev_message': instance.devMessage,
      'payload': instance.payload,
    };

Payload _$PayloadFromJson(Map<String, dynamic> json) {
  return Payload();
}

Map<String, dynamic> _$PayloadToJson(Payload instance) => <String, dynamic>{};
