// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TransactionResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionResponse _$TransactionResponseFromJson(Map<String, dynamic> json) {
  return TransactionResponse()
    ..status = json['status'] as String?
    ..message = json['message'] as String?
    ..devMessage = json['dev_message'] as String?
    ..payload = json['payload'] == null
        ? null
        : _$PayloadFromJson(json['payload'] as Map<String, dynamic>);
}

Map<String, dynamic> _$TransactionResponseToJson(
        TransactionResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'dev_message': instance.devMessage,
      'payload': instance.payload,
    };

Payload _$PayloadFromJson(Map<String, dynamic> json) {
  return Payload()
    ..transaction = json['transaction'] == null
        ? null
        : Transaction().fromJson(json['transaction'] as Map<String, dynamic>)
    ..draws = (json['draws'] as List<dynamic>?)
        ?.map((e) => Draw().fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$PayloadToJson(Payload instance) => <String, dynamic>{
      'transaction': instance.transaction,
      'draws': instance.draws,
    };
