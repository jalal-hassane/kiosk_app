// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppSettings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) {
  return AppSettings()
    ..isDeveloper = json['is_developer'] as bool
    ..saveLimitPerDay = json['save_limit_per_day'] as int?
    ..subscribeDto = json['subscribe_dto'] == null
        ? null
        : SubscribeDto().fromJson(json['subscribe_dto'] as Map<String, dynamic>)
    ..packageName = json['package_name'] as String?;
}

Map<String, dynamic> _$AppSettingsToJson(AppSettings instance) =>
    <String, dynamic>{
      'is_developer': instance.isDeveloper,
      'save_limit_per_day': instance.saveLimitPerDay,
      'subscribe_dto': instance.subscribeDto,
      'package_name': instance.packageName,
    };
