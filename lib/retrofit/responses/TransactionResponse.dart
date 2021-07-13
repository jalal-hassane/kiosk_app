import 'package:json_annotation/json_annotation.dart';
import 'package:kiosk_app/retrofit/models/Draw.dart';
import 'package:kiosk_app/retrofit/models/Transaction.dart';
import 'package:kiosk_app/retrofit/responses/CommonResponse.dart';

part 'TransactionResponse.g.dart';

@JsonSerializable()
class TransactionResponse extends CommonResponse {
  @JsonKey(name: "payload")
  Payload? payload;

  Transaction? getTransaction() {
    return payload?.transaction;
  }

  List<Draw>? getDraws() {
    return payload?.draws;
  }

  TransactionResponse fromJson(Map<String, dynamic> json) {
    return _$TransactionResponseFromJson(json);
  }

  Map<String, dynamic> toJson1(TransactionResponse instance) {
    return _$TransactionResponseToJson(instance);
  }
}

@JsonSerializable()
class Payload {
  @JsonKey(name: "transaction")
  Transaction? transaction;

  @JsonKey(name: "draws")
  List<Draw>? draws;
}
