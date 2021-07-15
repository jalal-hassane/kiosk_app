// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NumfeedCommonResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NumfeedCommonResponse _$NumfeedCommonResponseFromJson(
    Map<String, dynamic> json) {
  return NumfeedCommonResponse()
    ..status = json['status'] as String?
    ..message = json['message'] as String?
    ..devMessage = json['dev_message'] as String?
    ..payloadData = json['payload'] as String?;
}

Map<String, dynamic> _$NumfeedCommonResponseToJson(
        NumfeedCommonResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'dev_message': instance.devMessage,
      'payload': instance.payloadData,
    };
