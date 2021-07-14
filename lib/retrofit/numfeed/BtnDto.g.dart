// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BtnDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BtnDto _$BtnDtoFromJson(Map<String, dynamic> json) {
  return BtnDto()
    ..title = json['title'] as String?
    ..subTitle = json['sub_title'] as String?
    ..bgColor = json['bg_color'] as String?
    ..fontColor = json['font_color'] as String?;
}

Map<String, dynamic> _$BtnDtoToJson(BtnDto instance) => <String, dynamic>{
      'title': instance.title,
      'sub_title': instance.subTitle,
      'bg_color': instance.bgColor,
      'font_color': instance.fontColor,
    };
