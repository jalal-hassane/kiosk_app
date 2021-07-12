import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'Text.g.dart';

@JsonSerializable()
class Text {
  /// landing
  @JsonKey(name: "landing_play_hint")
  String landingPlayHint = "";

  @JsonKey(name: "landing_title")
  String landingTitle = "";

  /// how to play
  @JsonKey(name: "how_to_play_title")
  String howToPlayTitle = "";

  @JsonKey(name: "how_to_play_action")
  String howToPlayAction = "";

  @JsonKey(name: "how_to_play_tutorial_first")
  String howToPlayTutorialFirst = "";

  @JsonKey(name: "how_to_play_tutorial_second")
  String howToPlayTutorialSecond = "";

  @JsonKey(name: "how_to_play_tutorial_third")
  String howToPlayTutorialThird = "";

  @JsonKey(name: "how_to_play_tutorial_fourth")
  String howToPlayTutorialFourth = "";

  /// enter your info

  @JsonKey(name: "enter_your_information_title")
  String enterYourInformationTitle = "";

  @JsonKey(name: "full_name_hint")
  String fullNameHint = "";

  @JsonKey(name: "mobile_number_hint")
  String mobileNumberHint = "";

  @JsonKey(name: "email_address_hint")
  String emailAddressHint = "";

  @JsonKey(name: "mandatory_hint")
  String mandatoryHint = "";

  @JsonKey(name: "enter_your_information_action")
  String enterYourInformationAction = "";

  @JsonKey(name: "alert_name_required_title")
  String alertNameRequiredTitle = "";

  @JsonKey(name: "alert_name_required_message")
  String alertNameRequiredMessage = "";

  @JsonKey(name: "alert_mobile_or_email_required_title")
  String alertMobileOrEmailRequiredTitle = "";

  @JsonKey(name: "alert_mobile_or_email_required_message")
  String alertMobileOrEmailRequiredMessage = "";

  @JsonKey(name: "alert_email_invalid_title")
  String alertEmailInvalidTitle = "";

  @JsonKey(name: "alert_email_invalid_message")
  String alertEmailInvalidMessage = "";

  /// raffle draw

  @JsonKey(name: "raffle_draw_title")
  String raffleDrawTitle = "";

  @JsonKey(name: "your_available_credits")
  String yourAvailableCredits = "";

  @JsonKey(name: "raffle_draw_action")
  String raffleDrawAction = "";

  @JsonKey(name: "raffle_draw_back")
  String raffleDrawBack = "";

  /// spin count

  @JsonKey(name: "spins")
  String spins = "";

  @JsonKey(name: "spin_single")
  String spinSingle = "";

  @JsonKey(name: "spin_wheel_hint")
  String spinWheelHint = "";

  @JsonKey(name: "spin_count_action")
  String spinCountAction = "";

  @JsonKey(name: "spin_count_back")
  String spinCountBack = "";

  /// spinner

  @JsonKey(name: "spinner_title")
  String spinnerTitle = "";

  @JsonKey(name: "remaining_spins")
  String remainingSpins = "";

  @JsonKey(name: "spin_again")
  String spinAgain = "";

  /// spin result

  @JsonKey(name: "spinner_result_hint")
  String spinnerResultHint = "";

  @JsonKey(name: "spinner_result_finish_action")
  String spinnerResultFinishAction = "";

  Text fromJson(Map<String, dynamic> json){
    return _$TextFromJson(json);
  }
  Map<String, dynamic> toJson1(Text instance){
    return _$TextToJson(instance);
  }
}
