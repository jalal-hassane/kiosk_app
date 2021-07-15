import 'package:json_annotation/json_annotation.dart';
import 'package:kiosk_app/retrofit/numfeed/NumfeedCommonResponse.dart';
import 'package:logger/logger.dart';
import 'package:encrypt/encrypt.dart' as Encrypt;
import 'AppTexts.dart';
import 'AppSettings.dart';

part 'AppSettingsResponse.g.dart';

class AppSettingsResponse extends NumfeedCommonResponse {

  //@JsonKey(name: 'payload')
  Payload? payload;

  @override
  void setPayload(String? payloadString){

  }


  AppSettings? get appSettings{
    return payload?.appSettings;
  }

  AppTexts? get appTexts{
    return payload?.appTexts;
  }

  List<String>? get tutorialsList{
    return payload?.tutorialsList;
  }


  static const TUTORIAL_EXPLORE = "EXPLORE";
  static const TUTORIAL_SHARE = "SHARE";
  static const TUTORIAL_FORTUNE_COOKIE = "FORTUNE_COOKIE";
  static const TUTORIAL_FORTUNE_COOKIE_WITH_TEXT = "FORTUNE_COOKIE_WITH_TEXT";
  static const TUTORIAL_QUOTES = "QUOTES";
  static const TUTORIAL_QUOTES_WITH_TEXT = "QUOTES_WITH_TEXT";
  static const TUTORIAL_HEALTH_TIPS = "HEALTH_TIPS";
  static const TUTORIAL_HEALTH_TIPS_WITH_TEXT = "HEALTH_TIPS_WITH_TEXT";
  static const TUTORIAL_NUMFACTS = "NUMFACTS";
  static const TUTORIAL_NUMFACTS_WITH_TEXT = "NUMFACTS_WITH_TEXT";
  static const TUTORIAL_ODDITIES = "ODDITIES";
  static const TUTORIAL_ODDITIES_WITH_TEXT = "ODDITIES_WITH_TEXT";

  static List<String>? mTutorialsList;

   Payload fromJson(Map<String, dynamic> json) {
     Logger().i("My json is $json");

     final key = Encrypt.Key.fromUtf8('FJbTbUN91xzVdTOFFJbTbUN91xzVdTOF');
     final iv = Encrypt.IV.fromLength(16);
     //final b64key = Encrypt.Key.fromUtf8(Encrypt.base64Url.encode(key.bytes));

     final encryptor = Encrypt.Encrypter(Encrypt.AES(key));

     final encrypted = encryptor.encrypt(json['payload'].toString().toString(), iv: iv);
     final decrypted = encryptor.decrypt(encrypted, iv: iv);
     final decrypted2 = encryptor.decrypt64("9gfDZa5XxnQmaqeds9HFJFzYi6/cCbwCDIqjIyZLVTsGZvTYll5mnHa8uava5ExAxT1x3OC092q/+L/im++DOSvcyywm5MgCJKnNGta1KTmvGhZH2OGy6DX7hoZsTyzoFwSb7iHMwfhaKQbNTxVQ59vxNAqef2kUe1jrw8LgvEXpPAkSgHkPcvCWtzBgC6HH2/J9ET/n/ObIJtsDuGV8oswAdrfjQszFPs89jNUQU/TvocSHQZ4Ww0aGUJH58TCbofRTsjGuIxq5/WjKW0XAeUjonejMKmC9nhk47zFZkEI=", iv: iv);
     Logger().w(decrypted);
     Logger().w(decrypted2);


    return _$PayloadFromJson(json);
  }

  Map<String, dynamic> toJson(Payload instance) {
    return _$PayloadToJson(instance);
  }
}

@JsonSerializable()
class Payload {
  @JsonKey(name: 'app_texts')
  AppTexts? appTexts;

  @JsonKey(name: 'app_settings')
  AppSettings? appSettings;

  @JsonKey(name: 'tutorials_list')
  List<String>? tutorialsList;
}