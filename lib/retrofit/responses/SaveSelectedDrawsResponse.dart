import 'package:json_annotation/json_annotation.dart';
import 'package:kiosk_app/retrofit/models/Transaction.dart';
import 'package:kiosk_app/retrofit/responses/CommonResponse.dart';

@JsonSerializable()
class SaveSelectedDrawsResponse extends CommonResponse {
  static const ERROR_CANNOT_SELECT_DRAWS = "CANNOT_SELECT_DRAWS";

  @JsonKey(name: "payload")
  Payload? payload;

  Transaction? getTransaction() {
    return payload?.transaction;
  }
}

@JsonSerializable()
class Payload {
  @JsonKey(name: "transaction")
  Transaction? transaction;
}
