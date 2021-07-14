import 'package:json_annotation/json_annotation.dart';

import 'SubscribeDto.dart';

part 'AppSettings.g.dart';

@JsonSerializable()
class AppSettings {
  @JsonKey(name: "is_developer")
  bool isDeveloper = false;

  @JsonKey(name: "save_limit_per_day")
  int? saveLimitPerDay;

  @JsonKey(name: "subscribe_dto")
  SubscribeDto? subscribeDto;

  @JsonKey(name: "package_name")
  String? packageName;

  static AppSettings? appSettings;

  AppSettings fromJson(Map<String, dynamic> json) {
    return _$AppSettingsFromJson(json);
  }

  Map<String, dynamic> toJson(AppSettings instance) {
    return _$AppSettingsToJson(instance);
  }
}
