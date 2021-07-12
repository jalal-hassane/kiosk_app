// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Draw.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Draw _$DrawFromJson(Map<String, dynamic> json) {
  return Draw()
    ..publicId = json['public_id'] as String?
    ..amount = json['amount'] as String?
    ..currency = json['currency'] as String?
    ..couponText = json['coupon_text'] as String?
    ..location = json['location'] as String?
    ..date = json['date'] as String?;
}

Map<String, dynamic> _$DrawToJson(Draw instance) => <String, dynamic>{
      'public_id': instance.publicId,
      'amount': instance.amount,
      'currency': instance.currency,
      'coupon_text': instance.couponText,
      'location': instance.location,
      'date': instance.date,
    };
