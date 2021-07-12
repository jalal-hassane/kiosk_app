import 'package:json_annotation/json_annotation.dart';
import 'package:kiosk_app/retrofit/models/Text.dart';
import 'package:kiosk_app/retrofit/responses/CommonResponse.dart';

part 'AppTextsResponse.g.dart';

@JsonSerializable()
class AppTextsResponse extends CommonResponse{
  @JsonKey(name:"payload")
  Payload? payload;



  Text? getAppText(){
  return payload?.appText;
  }
}

@JsonSerializable()
class Payload {
  @JsonKey(name: "app_text")
  Text? appText;
}