import 'package:json_annotation/json_annotation.dart';
import 'package:kiosk_app/retrofit/responses/CommonResponse.dart';

@JsonSerializable()
class KioskStatusReponse extends CommonResponse {
  @JsonKey(name: "payload")
  Payload? payload;

  String? getDeviceStatus() {
    return payload?.deviceStatus;
  }

  String? getInvoiceId() {
    return payload?.invoiceId;
  }
}

@JsonSerializable()
class Payload {
  @JsonKey(name: "device_status")
  String? deviceStatus;

  @JsonKey(name: "invoice_id")
  String? invoiceId;
}
