import 'package:json_annotation/json_annotation.dart';
import 'package:kiosk_app/retrofit/responses/CommonResponse.dart';

part 'SaveSpinPrizeResponse.g.dart';

@JsonSerializable()
class SaveSpinPrizeResponse extends CommonResponse {
  @JsonKey(name: "payload")
  Payload? payload;
}

@JsonSerializable()
class Payload {}
