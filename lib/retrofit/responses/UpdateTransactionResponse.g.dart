// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UpdateTransactionResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateTransactionResponse _$UpdateTransactionResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateTransactionResponse()
    ..status = json['status'] as String?
    ..message = json['message'] as String?
    ..devMessage = json['dev_message'] as String?
    ..payload = json['payload'] == null
        ? null
        : _$PayloadFromJson(json['payload'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UpdateTransactionResponseToJson(
        UpdateTransactionResponse instance) =>
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
        : Transaction().fromJson(json['transaction'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PayloadToJson(Payload instance) => <String, dynamic>{
      'transaction': instance.transaction,
    };
