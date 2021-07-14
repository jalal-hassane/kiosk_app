// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppTexts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppTexts _$AppTextsFromJson(Map<String, dynamic> json) {
  return AppTexts()
    ..tutorialTitle1 = json['tutorial_title_1'] as String?
    ..tutorialTitle2 = json['tutorial_title_2'] as String?
    ..tutorialDescription1 = json['tutorial_description_1'] as String?
    ..tutorialDescription2 = json['tutorial_description_2'] as String?
    ..appShareText = json['app_share_text'] as String?
    ..fortuneCookieLocked = json['fortune_cookie_locked'] as String?;
}

Map<String, dynamic> _$AppTextsToJson(AppTexts instance) => <String, dynamic>{
      'tutorial_title_1': instance.tutorialTitle1,
      'tutorial_title_2': instance.tutorialTitle2,
      'tutorial_description_1': instance.tutorialDescription1,
      'tutorial_description_2': instance.tutorialDescription2,
      'app_share_text': instance.appShareText,
      'fortune_cookie_locked': instance.fortuneCookieLocked,
    };
