import 'dart:collection';

import 'package:intl/intl.dart';
import 'package:kiosk_app/Device.dart';
import 'package:kiosk_app/local/LocalStorage.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';


class CommonRequest {
  HashMap<String, String> headerFields = HashMap();
  HashMap<String, String> bodyFields = HashMap();
  bool shouldInitHeaders = true;

  CommonRequest(this.shouldInitHeaders) {
    if (shouldInitHeaders) {
      headerFields[_DEVICE_ID] = Device.mDeviceInfo[Device.device].toString();
      headerFields[AUTH_TOKEN] = LocalStorage().getAuthToken();
      headerFields[TRANSACTION_PUBLIC_ID] = LocalStorage().getTransactionId();
    }
    headerFields[_DEVICE_ID] = "asdasd";
    headerFields[DEVICE_TYPE] = "android";

    headerFields[AUTH_TOKEN] = "";

    headerFields[APP_VERSION] = "109";
    headerFields[ANDROID_ID] = "asdasdasdasdas";

    headerFields[API_TOKEN] = "";
    headerFields[CURRENT_DT] = "";
    headerFields[IS_ROOTED] = "false";
    headerFields[IS_EMULATOR] = "false";

    prepareToken();
  }

  void prepareToken(){
    var formatter = DateFormat("yyyy-MM-dd'T'HH:mm:ss");
    var formattedDate = formatter.format(DateTime.now());
    headerFields[CURRENT_DT] = formattedDate;
    headerFields[API_TOKEN] = generateMd5(API_KEY + formattedDate + "asdasd");
  }
  /*factory CommonRequest({bool shouldInitHeaders = true}) {
    CommonRequest cr = CommonRequest();
    if (shouldInitHeaders) {
      cr.headerFields[_DEVICE_ID] =
          Device.mDeviceInfo[Device.device].toString();
      cr.headerFields[AUTH_TOKEN] = LocalStorage().getAuthToken();
      cr.headerFields[TRANSACTION_PUBLIC_ID] =
          LocalStorage().getTransactionId();
    }
    return cr;
  }*/

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  static const _DEVICE_ID = "device-id";
  static const AUTH_TOKEN = "auth-token";
  static const TRANSACTION_PUBLIC_ID = "trans-id";

  static const DEVICE_TYPE = "device-type";
  static const APP_VERSION = "app-version";
  static const DEVICE_TYPE_ANDROID = "android";
  static const CURRENT_DT = "current-dt";
  static const IS_ROOTED = "is-rooted";
  static const IS_EMULATOR = "is-emulator";
  static const ANDROID_ID = "android-id";
  static const API_TOKEN = "api-token";

  /// authenticate
  static const DEVICE_ID = "device_id";

  /// spinner data and save selected draws
  static const SELECTED_DRAWS = "selected_draws";
  static const NUMBER_OF_SPINS = "nb_of_spins";

  /// save spin prize
  static const SPINNER_ITEM = "spinner_item";

  /// update transaction
  static const NAME = "name";
  static const EMAIL = "email";
  static const MOBILE = "mobile";

  static const API_KEY ="2e8173243c94dd28abb81d276494505ee5e2e32355f11bc425ace596dafd6e4a";
  static const FERNET_KEY = "FJbTbUN91xzVdTOFmKB3ZgL_ZArJNEqhtbapBW9R_r5=";
  static const HEADERS_DATA = "headers-data";
  static const POST_DATA = "post_data";
}
