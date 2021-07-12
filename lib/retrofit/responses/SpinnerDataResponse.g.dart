// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SpinnerDataResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpinnerDataResponse _$SpinnerDataResponseFromJson(Map<String, dynamic> json) {
  return SpinnerDataResponse()
    ..status = json['status'] as String?
    ..message = json['message'] as String?
    ..devMessage = json['dev_message'] as String?
    ..payload = json['payload'] == null
        ? null
        : _$PayloadFromJson(json['payload'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SpinnerDataResponseToJson(
        SpinnerDataResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'dev_message': instance.devMessage,
      'payload': instance.payload,
    };

Payload _$PayloadFromJson(Map<String, dynamic> json) {
  return Payload()
    ..spinnerItems = (json['spinner_items'] as List<dynamic>?)
        ?.map((e) => SpinnerItem().fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$PayloadToJson(Payload instance) => <String, dynamic>{
      'spinner_items': instance.spinnerItems,
    };
