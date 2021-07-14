// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SubscribeDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscribeDto _$SubscribeDtoFromJson(Map<String, dynamic> json) {
  return SubscribeDto()
    ..header = json['header'] as String?
    ..subHeader = json['sub_header'] as String?
    ..title1 = json['title_1'] as String?
    ..title2 = json['title_2'] as String?
    ..price = json['price'] as String?
    ..btnHint = json['btn_hint'] as String?
    ..btnTitle = json['btn_title'] as String?
    ..screenName = json['screen_name'] as String?
    ..title = json['title'] as String?
    ..subTitle = json['sub_title'] as String?
    ..bgColor = json['bg_color'] as String?
    ..image = json['image'] as String?
    ..btnDto = json['btn_dto'] == null
        ? null
        : BtnDto().fromJson(json['btn_dto'] as Map<String, dynamic>)
    ..hintText = json['hint_text'] as String?;
}

Map<String, dynamic> _$SubscribeDtoToJson(SubscribeDto instance) =>
    <String, dynamic>{
      'header': instance.header,
      'sub_header': instance.subHeader,
      'title_1': instance.title1,
      'title_2': instance.title2,
      'price': instance.price,
      'btn_hint': instance.btnHint,
      'btn_title': instance.btnTitle,
      'screen_name': instance.screenName,
      'title': instance.title,
      'sub_title': instance.subTitle,
      'bg_color': instance.bgColor,
      'image': instance.image,
      'btn_dto': instance.btnDto,
      'hint_text': instance.hintText,
    };
