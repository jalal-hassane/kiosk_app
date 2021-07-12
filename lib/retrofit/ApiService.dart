import 'package:kiosk_app/retrofit/responses/AppTextsResponse.dart';
import 'package:kiosk_app/retrofit/responses/AuthenticationResponse.dart';
import 'package:kiosk_app/retrofit/responses/SaveSelectedDrawsResponse.dart';
import 'package:kiosk_app/retrofit/responses/SaveSpinPrizeResponse.dart';
import 'package:kiosk_app/retrofit/responses/SpinnerDataResponse.dart';
import 'package:kiosk_app/retrofit/responses/TransactionResponse.dart';
import 'package:kiosk_app/retrofit/responses/UpdateTransactionResponse.dart';
import 'package:retrofit/retrofit.dart';

@RestApi(baseUrl: "http://35.188.81.45//api/")
abstract class ApiService {
  factory ApiService() {
    return ApiService();
  }

  static const String API_AUTHENTICATE_DEVICE =
      "device/authenticate"; //Authenticate Device
  static const String API_GET_SPINNER_DATA = "spinner/items"; //Get Spinner Data
  static const String API_SAVE_SPIN_PRIZE = "spinner/set_winner"; //Save Prize
  static const String API_TRANSACTION_UPDATE =
      "transaction/update"; //Update Transaction Info
  static const String API_SAVE_DRAWS =
      "transaction/save-draws"; //Save Selected Draws
  static const String API_VERIFY_TRANSACTION =
      "transaction/verify"; //Save Selected Draws
  static const String API_CHECK_KIOSK_STATUS =
      "device/status"; //Check Kiosk Status
  static const String API_GET_TRANSACTION =
      "transaction/get-transaction"; //Get Transaction
  static const String API_GET_APP_TEXTS = "device/app-text"; //Get APP Text

  @FormUrlEncoded()
  @POST(API_AUTHENTICATE_DEVICE)
  Future<AuthenticationResponse> authenticateDevice(
    @Headers() Map<String, String> headers,
    @Body() Map<String, String> fields,
  );

  @FormUrlEncoded()
  @POST(API_GET_SPINNER_DATA)
  Future<SpinnerDataResponse> getSpinnerData(
    @Headers() Map<String, String> headers,
    @Body() Map<String, String> fields,
  );

  @FormUrlEncoded()
  @POST(API_SAVE_SPIN_PRIZE)
  Future<SaveSpinPrizeResponse> saveSpinPrize(
    @Headers() Map<String, String> headers,
    @Body() Map<String, String> fields,
  );

  @FormUrlEncoded()
  @POST(API_TRANSACTION_UPDATE)
  Future<UpdateTransactionResponse> updateTransaction(
    @Headers() Map<String, String> headers,
    @Body() Map<String, String> fields,
  );

  @FormUrlEncoded()
  @POST(API_SAVE_DRAWS)
  Future<SaveSelectedDrawsResponse> saveDraws(
    @Headers() Map<String, String> headers,
    @Body() Map<String, String> fields,
  );

  @FormUrlEncoded()
  @POST(API_GET_TRANSACTION)
  Future<TransactionResponse> getTransaction(
    @Headers() Map<String, String> headers,
  );

  @FormUrlEncoded()
  @POST(API_GET_APP_TEXTS)
  Future<AppTextsResponse> getAppTexts(
    @Headers() Map<String, String> headers,
  );
}
