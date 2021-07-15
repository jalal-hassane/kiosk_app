// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NumfeedApiService.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************
final logger = Logger();
class _NumfeedApiService implements NumfeedApiService {
  _NumfeedApiService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://dev.numfeed.com/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<AppSettingsResponse> getAppSettings(options) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final newOptions = newRequestOptions(options);
    newOptions.extra.addAll(_extra);
    newOptions.headers.addAll(_dio.options.headers);
    newOptions.headers.addAll(<String, dynamic>{});
    final _result = await _dio.fetch<Map<String, dynamic>>(newOptions.copyWith(
        method: 'POST',
        contentType: 'application/x-www-form-urlencoded',
        baseUrl: baseUrl ?? _dio.options.baseUrl,
        queryParameters: queryParameters,
        path: 'account/app_settings')
      ..data = _data);


    logger.e(_result.data!);
    logger.v("My payload: "+_result.data!['payload']);

    final key = Encrypt.Key.fromUtf8('FJbTbUN91xzVdTOFFJbTbUN91xzVdTOF');
    final iv = Encrypt.IV.fromLength(16);
    //final b64key = Encrypt.Key.fromUtf8(Encrypt.base64Url.encode(key.bytes));

    final encryptor = Encrypt.Encrypter(Encrypt.AES(key));

    //final encrypted = encryptor.encrypt(commonReq.headerFields.toString(), iv: iv);
    //final decrypted = encryptor.decrypt64(_result.data!.toString(), iv: iv);
    //logger.w(decrypted);
    final response = AppSettingsResponse();

    final value = AppSettingsResponse().fromJson(_result.data!);
    response.payload = value;
    return response;
  }

  RequestOptions newRequestOptions(Options? options) {
    if (options is RequestOptions) {
      return options as RequestOptions;
    }
    if (options == null) {
      return RequestOptions(path: '');
    }
    return RequestOptions(
      method: options.method,
      sendTimeout: options.sendTimeout,
      receiveTimeout: options.receiveTimeout,
      extra: options.extra,
      headers: options.headers,
      responseType: options.responseType,
      contentType: options.contentType.toString(),
      validateStatus: options.validateStatus,
      receiveDataWhenStatusError: options.receiveDataWhenStatusError,
      followRedirects: options.followRedirects,
      maxRedirects: options.maxRedirects,
      requestEncoder: options.requestEncoder,
      responseDecoder: options.responseDecoder,
      path: '',
    );
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
