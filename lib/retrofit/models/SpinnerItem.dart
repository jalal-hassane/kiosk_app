import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'SpinnerItem.g.dart';

@JsonSerializable()
class SpinnerItem {
  @JsonKey(name:'public_id')
  String? publicId;

  String? value;

  @JsonKey(name:'image_path')
  String? image_path;

  get isAllowed {
    return !value!.contains('iPhone');
  }

  SpinnerItem fromJson(Map<String, dynamic> json){
    return _$SpinnerItemFromJson(json);
  }
  Map<String, dynamic> toJson1(SpinnerItem instance){
    return _$SpinnerItemToJson(instance);
  }
  /*factory SpinnerItem.fromJson(Map<String, dynamic> json) => _$SpinnerItem(json);
  Map<String, dynamic> toJson() => _$SpinnerItem(this);*/
}
