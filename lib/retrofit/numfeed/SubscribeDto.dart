import 'package:json_annotation/json_annotation.dart';

import 'BtnDto.dart';

part 'SubscribeDto.g.dart';

@JsonSerializable()
class SubscribeDto {
  static const SCREEN_1 = "SCREEN_1";
  static const SCREEN_2 = "SCREEN_2";
  static const SCREEN_3 = "SCREEN_3";
  static const SCREEN_4 = "SCREEN_4";

  @JsonKey(name: "header")
  String? header;

  @JsonKey(name: "sub_header")
  String? subHeader;

  @JsonKey(name: "title_1")
  String? title1;

  @JsonKey(name: "title_2")
  String? title2;

  @JsonKey(name: "price")
  String? price;

  @JsonKey(name: "btn_hint")
  String? btnHint;

  @JsonKey(name: "btn_title")
  String? btnTitle;

  @JsonKey(name: "screen_name")
  String? screenName;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "sub_title")
  String? subTitle;

  @JsonKey(name: "bg_color")
  String? bgColor;

  @JsonKey(name: "image")
  String? image;

  @JsonKey(name: "btn_dto")
  BtnDto? btnDto;

  @JsonKey(name: "hint_text")
  String? hintText;

  SubscribeDto fromJson(Map<String, dynamic> json) {
    return _$SubscribeDtoFromJson(json);
  }

  Map<String, dynamic> toJson(SubscribeDto instance) {
    return _$SubscribeDtoToJson(instance);
  }
}
