// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppSettingsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppSettingsResponse _$AppSettingsResponseFromJson(Map<String, dynamic> json) {
  return AppSettingsResponse()
    ..status = json['status'] as String?
    ..message = json['message'] as String?
    ..devMessage = json['dev_message'] as String?;
}

Map<String, dynamic> _$AppSettingsResponseToJson(
        AppSettingsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'dev_message': instance.devMessage,
    };

Payload _$PayloadFromJson(Map<String, dynamic> json) {
  return Payload()
    ..appTexts = json['app_texts'] == null
        ? null
        : AppTexts().fromJson(json['app_texts'] as Map<String, dynamic>)
    ..appSettings = json['app_settings'] == null
        ? null
        : AppSettings().fromJson(json['app_settings'] as Map<String, dynamic>)
    ..tutorialsList = (json['tutorials_list'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList();
}

Map<String, dynamic> _$PayloadToJson(Payload instance) => <String, dynamic>{
      'app_texts': instance.appTexts,
      'app_settings': instance.appSettings,
      'tutorials_list': instance.tutorialsList,
    };
