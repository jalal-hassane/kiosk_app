import 'package:json_annotation/json_annotation.dart';
import 'package:kiosk_app/retrofit/models/Transaction.dart';
import 'package:kiosk_app/retrofit/responses/CommonResponse.dart';

part 'SaveSelectedDrawsResponse.g.dart';

@JsonSerializable()
class SaveSelectedDrawsResponse extends CommonResponse {
  static const ERROR_CANNOT_SELECT_DRAWS = "CANNOT_SELECT_DRAWS";

  @JsonKey(name: "payload")
  Payload? payload;

  Transaction? getTransaction() {
    return payload?.transaction;
  }

  SaveSelectedDrawsResponse fromJson(Map<String, dynamic> json) {
    return _$SaveSelectedDrawsResponseFromJson(json);
  }

  Map<String, dynamic> toJson1(SaveSelectedDrawsResponse instance) {
    return _$SaveSelectedDrawsResponseToJson(instance);
  }
}

@JsonSerializable()
class Payload {
  @JsonKey(name: "transaction")
  Transaction? transaction;
}
