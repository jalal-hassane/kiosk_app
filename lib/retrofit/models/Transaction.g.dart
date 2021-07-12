// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return Transaction()
    ..publicId = json['public_id'] as String?
    ..clientName = json['client_name'] as String?
    ..clientMobile = json['client_mobile'] as String?
    ..clientEmail = json['client_email'] as String?
    ..purchasedAmount = json['purchased_amount'] as String?
    ..nbOfSpin = json['nb_of_spin'] as String?;
}

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'public_id': instance.publicId,
      'client_name': instance.clientName,
      'client_mobile': instance.clientMobile,
      'client_email': instance.clientEmail,
      'purchased_amount': instance.purchasedAmount,
      'nb_of_spin': instance.nbOfSpin,
    };
