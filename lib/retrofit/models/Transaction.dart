import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'Transaction.g.dart';

@JsonSerializable()
class Transaction {
  @JsonKey(name: "public_id")
  String? publicId = "";

  @JsonKey(name: "client_name")
  String? clientName = "";

  @JsonKey(name: "client_mobile")
  String? clientMobile = "";

  @JsonKey(name: "client_email")
  String? clientEmail = "";

  @JsonKey(name: "purchased_amount")
  String? purchasedAmount = "";

  @JsonKey(name: "nb_of_spin")
  String? nbOfSpin = "";
}
