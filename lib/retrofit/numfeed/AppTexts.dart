import 'package:json_annotation/json_annotation.dart';

part 'AppTexts.g.dart';

@JsonSerializable()
class AppTexts {
  @JsonKey(name: "tutorial_title_1")
  String? tutorialTitle1;

  @JsonKey(name: "tutorial_title_2")
  String? tutorialTitle2;

  @JsonKey(name: "tutorial_description_1")
  String? tutorialDescription1;

  @JsonKey(name: "tutorial_description_2")
  String? tutorialDescription2;

  @JsonKey(name: "app_share_text")
  String? appShareText;

  @JsonKey(name: "fortune_cookie_locked")
  String? fortuneCookieLocked;

  static AppTexts? appTexts;

  AppTexts fromJson(Map<String, dynamic> json) {
    return _$AppTextsFromJson(json);
  }

  Map<String, dynamic> toJson(AppTexts instance) {
    return _$AppTextsToJson(instance);
  }
}
