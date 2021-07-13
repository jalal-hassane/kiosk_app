import 'package:kiosk_app/retrofit/requests/CommonRequest.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static final LocalStorage _instance = LocalStorage._privateConstructor();

  factory LocalStorage() {
    return _instance;
  }

  SharedPreferences? _prefs;

  LocalStorage._privateConstructor() {
    SharedPreferences.getInstance().then((prefs) {
      _prefs = prefs;
    });
  }

  String getAuthToken() {
    return _prefs?.getString(CommonRequest.AUTH_TOKEN) ?? "";
  }

  String getTransactionId() {
    return _prefs?.getString(CommonRequest.TRANSACTION_PUBLIC_ID) ?? "";
  }
}
