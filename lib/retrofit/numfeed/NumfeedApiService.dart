import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'AppSettingsResponse.dart';


part 'NumfeedApiService.g.dart';

@RestApi(baseUrl: "http://dev.numfeed.com/api/")
abstract class NumfeedApiService {
  factory NumfeedApiService(Dio dio, {String baseUrl}) = _NumfeedApiService;

  static const  GET_APP_SETTINGS = "account/app_settings";

  /*@POST
  fun getAppSettings(
  @Url url: String,
  @HeaderMap headerMap: Map<String, String>,
  ): Call<GetAppSettingsResp>*/

  @FormUrlEncoded()
  @POST(GET_APP_SETTINGS)
  Future<AppSettingsResponse> getAppSettings(
      @DioOptions() Options options,
      );

}
