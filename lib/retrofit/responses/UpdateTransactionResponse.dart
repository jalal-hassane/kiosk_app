import 'package:json_annotation/json_annotation.dart';
import 'package:kiosk_app/retrofit/models/Transaction.dart';
import 'package:kiosk_app/retrofit/responses/CommonResponse.dart';

part 'UpdateTransactionResponse.g.dart';

@JsonSerializable()
class UpdateTransactionResponse extends CommonResponse {
  @JsonKey(name: "payload")
  Payload? payload;

  get _transaction {
    return payload?.transaction;
  }

  Transaction? getTransaction() {
    return payload?.transaction;
  }
}

@JsonSerializable()
class Payload {
  @JsonKey(name: "transaction")
  Transaction? transaction;
}
