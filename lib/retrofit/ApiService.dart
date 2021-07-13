import 'package:kiosk_app/retrofit/responses/AppTextsResponse.dart';
import 'package:kiosk_app/retrofit/responses/AuthenticationResponse.dart';
import 'package:kiosk_app/retrofit/responses/SaveSelectedDrawsResponse.dart';
import 'package:kiosk_app/retrofit/responses/SaveSpinPrizeResponse.dart';
import 'package:kiosk_app/retrofit/responses/SpinnerDataResponse.dart';
import 'package:kiosk_app/retrofit/responses/TransactionResponse.dart';
import 'package:kiosk_app/retrofit/responses/UpdateTransactionResponse.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'ApiService.g.dart';

//class Service{}

@RestApi(baseUrl: "http://35.188.81.45//api/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  //Service getApi();

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
  @DioOptions() Options options,
      @Body() Map<String, String> fields,);

  @FormUrlEncoded()
  @POST(API_GET_SPINNER_DATA)
  Future<SpinnerDataResponse> getSpinnerData(
      @DioOptions() Options options,
      @Body() Map<String, String> fields,);

  @FormUrlEncoded()
  @POST(API_SAVE_SPIN_PRIZE)
  Future<SaveSpinPrizeResponse> saveSpinPrize(
      @DioOptions() Options options,
      @Body() Map<String, String> fields,);

  @FormUrlEncoded()
  @POST(API_TRANSACTION_UPDATE)
  Future<UpdateTransactionResponse> updateTransaction(
      @DioOptions() Options options,
      @Body() Map<String, String> fields,);

  @FormUrlEncoded()
  @POST(API_SAVE_DRAWS)
  Future<SaveSelectedDrawsResponse> saveDraws(
      @DioOptions() Options options,
      @Body() Map<String, String> fields,);

  @FormUrlEncoded()
  @POST(API_GET_TRANSACTION)
  Future<TransactionResponse> getTransaction(
      @DioOptions() Options options,);

  @FormUrlEncoded()
  @POST(API_GET_APP_TEXTS)
  Future<AppTextsResponse> getAppTexts(@DioOptions() Options options,);

}

/*
class Api implements ApiService {

  //Api();

  @override
  Service getApi() => Service();


  Future<AuthenticationResponse> a(Map<String, String> headers,
      Map<String, String> fields){
    return authenticateDevice(headers, fields);
  }
  @override
  Future<AuthenticationResponse> authenticateDevice(Map<String, String> headers,
      Map<String, String> fields) {
    return Api().authenticateDevice(headers, fields);
  }

  @override
  Future<AppTextsResponse> getAppTexts(Map<String, String> headers) {
    return ApiService().getAppTexts(headers);
  }

  @override
  Future<SpinnerDataResponse> getSpinnerData(Map<String, String> headers,
      Map<String, String> fields) {
    return Api().getSpinnerData(headers,fields);
  }

  @override
  Future<TransactionResponse> getTransaction(Map<String, String> headers) {
    return Api().getTransaction(headers);
  }

  @override
  Future<SaveSelectedDrawsResponse> saveDraws(Map<String, String> headers,
      Map<String, String> fields) {
    return Api().saveDraws(headers,fields);
  }

  @override
  Future<SaveSpinPrizeResponse> saveSpinPrize(Map<String, String> headers,
      Map<String, String> fields) {
    return Api().saveSpinPrize(headers,fields);
  }

  @override
  Future<UpdateTransactionResponse> updateTransaction(
      Map<String, String> headers, Map<String, String> fields) {
    return Api().updateTransaction(headers,fields);
  }

}
*/
