import 'package:json_annotation/json_annotation.dart';
import 'package:kiosk_app/retrofit/models/SpinnerItem.dart';
import 'package:kiosk_app/retrofit/responses/CommonResponse.dart';

part 'SpinnerDataResponse.g.dart';

@JsonSerializable()
class SpinnerDataResponse extends CommonResponse {
  Payload? payload;

  List<SpinnerItem>? getSpinnerItems() {
    return payload?.spinnerItems;
  }

  SpinnerDataResponse fromJson(Map<String, dynamic> json) {
    return _$SpinnerDataResponseFromJson(json);
  }

  Map<String, dynamic> toJson1(SpinnerDataResponse instance) {
    return _$SpinnerDataResponseToJson(instance);
  }
}

@JsonSerializable()
class Payload {
  @JsonKey(name: 'spinner_items')
  List<SpinnerItem>? spinnerItems;
}
