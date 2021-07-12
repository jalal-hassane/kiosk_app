// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CommonResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonResponse _$CommonResponseFromJson(Map<String, dynamic> json) {
  return CommonResponse()
    ..status = json['status'] as String?
    ..message = json['message'] as String?
    ..devMessage = json['dev_message'] as String?;
}

Map<String, dynamic> _$CommonResponseToJson(CommonResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'dev_message': instance.devMessage,
    };
