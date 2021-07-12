// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SpinnerItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpinnerItem _$SpinnerItemFromJson(Map<String, dynamic> json) {
  return SpinnerItem()
    ..publicId = json['public_id'] as String?
    ..value = json['value'] as String?
    ..image_path = json['image_path'] as String?;
}

Map<String, dynamic> _$SpinnerItemToJson(SpinnerItem instance) =>
    <String, dynamic>{
      'public_id': instance.publicId,
      'value': instance.value,
      'image_path': instance.image_path,
    };
