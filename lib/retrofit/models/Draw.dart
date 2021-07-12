import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'Draw.g.dart';

@JsonSerializable()
class Draw {
  @JsonKey(name: "public_id")
  String? publicId = "";

  @JsonKey(name: "amount")
  String? amount = "";

  @JsonKey(name: "currency")
  String? currency = "";

  @JsonKey(name: "coupon_text")
  String? couponText = "";

  @JsonKey(name: "location")
  String? location = "";

  @JsonKey(name: "date")
  String? date = "";
}
