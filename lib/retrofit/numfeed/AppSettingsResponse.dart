import 'package:json_annotation/json_annotation.dart';
import 'package:kiosk_app/retrofit/numfeed/NumfeedCommonResponse.dart';

import 'AppTexts.dart';
import 'AppSettings.dart';

part 'AppSettingsResponse.g.dart';

@JsonSerializable()
class AppSettingsResponse extends NumfeedCommonResponse {

  @JsonKey(name: 'payload')
  Payload? payload;

  /*override fun setPayload(payloadString: String?) {
  payload = excludeFieldsGson.fromJson(
  payloadString,
  Payload::class.java
  )
  }*/

  @override
  void setPayload(String? payloadString){

  }

  AppSettings? get appSettings{
    return payload?.appSettings;
  }

  AppTexts? get appTexts{
    return payload?.appTexts;
  }

  List<String>? get tutorialsList{
    return payload?.tutorialsList;
  }


  static const TUTORIAL_EXPLORE = "EXPLORE";
  static const TUTORIAL_SHARE = "SHARE";
  static const TUTORIAL_FORTUNE_COOKIE = "FORTUNE_COOKIE";
  static const TUTORIAL_FORTUNE_COOKIE_WITH_TEXT = "FORTUNE_COOKIE_WITH_TEXT";
  static const TUTORIAL_QUOTES = "QUOTES";
  static const TUTORIAL_QUOTES_WITH_TEXT = "QUOTES_WITH_TEXT";
  static const TUTORIAL_HEALTH_TIPS = "HEALTH_TIPS";
  static const TUTORIAL_HEALTH_TIPS_WITH_TEXT = "HEALTH_TIPS_WITH_TEXT";
  static const TUTORIAL_NUMFACTS = "NUMFACTS";
  static const TUTORIAL_NUMFACTS_WITH_TEXT = "NUMFACTS_WITH_TEXT";
  static const TUTORIAL_ODDITIES = "ODDITIES";
  static const TUTORIAL_ODDITIES_WITH_TEXT = "ODDITIES_WITH_TEXT";

  static List<String>? mTutorialsList;

  AppSettingsResponse fromJson(Map<String, dynamic> json) {
    return _$AppSettingsResponseFromJson(json);
  }

  Map<String, dynamic> toJson(AppSettingsResponse instance) {
    return _$AppSettingsResponseToJson(instance);
  }
}

@JsonSerializable()
class Payload {
  @JsonKey(name: 'app_texts')
  AppTexts? appTexts;

  @JsonKey(name: 'app_settings')
  AppSettings? appSettings;

  @JsonKey(name: 'tutorials_list')
  List<String>? tutorialsList;
}