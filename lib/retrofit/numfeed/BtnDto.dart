import 'package:json_annotation/json_annotation.dart';

part 'BtnDto.g.dart';

@JsonSerializable()
class BtnDto {
  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "sub_title")
  String? subTitle;

  @JsonKey(name: "bg_color")
  String? bgColor;

  @JsonKey(name: "font_color")
  String? fontColor;

  BtnDto fromJson(Map<String, dynamic> json) {
    return _$BtnDtoFromJson(json);
  }

  Map<String, dynamic> toJson(BtnDto instance) {
    return _$BtnDtoToJson(instance);
  }
}
