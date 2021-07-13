import 'dart:collection';

import 'package:kiosk_app/Device.dart';
import 'package:kiosk_app/local/LocalStorage.dart';

class CommonRequest {
  HashMap<String, String> headerFields = HashMap();
  HashMap<String, String> bodyFields = HashMap();
  bool shouldInitHeaders = true;


  CommonRequest(this.shouldInitHeaders) {
    if (shouldInitHeaders) {
      headerFields[_DEVICE_ID] =
          Device.mDeviceInfo[Device.device].toString();
      headerFields[AUTH_TOKEN] = LocalStorage().getAuthToken();
      headerFields[TRANSACTION_PUBLIC_ID] =
          LocalStorage().getTransactionId();
    }
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

  static const _DEVICE_ID = "device-id";
  static const AUTH_TOKEN = "auth-token";
  static const TRANSACTION_PUBLIC_ID = "trans-id";

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
}
