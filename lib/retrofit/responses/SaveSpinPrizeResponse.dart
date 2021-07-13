import 'package:json_annotation/json_annotation.dart';
import 'package:kiosk_app/retrofit/responses/CommonResponse.dart';

part 'SaveSpinPrizeResponse.g.dart';

@JsonSerializable()
class SaveSpinPrizeResponse extends CommonResponse {
  @JsonKey(name: "payload")
  Payload? payload;

  SaveSpinPrizeResponse fromJson(Map<String, dynamic> json) {
    return _$SaveSpinPrizeResponseFromJson(json);
  }

  Map<String, dynamic> toJson1(SaveSpinPrizeResponse instance) {
    return _$SaveSpinPrizeResponseToJson(instance);
  }
}

@JsonSerializable()
class Payload {}
