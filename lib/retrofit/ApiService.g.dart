// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ApiService.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiService implements ApiService {
  _ApiService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://35.188.81.45//api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<AuthenticationResponse> authenticateDevice(options, fields) async {
    const _extra = <String, String>{};
    final queryParameters = <String, String>{};
    final _data = <String, String>{};
    _data.addAll(fields);
    final newOptions = newRequestOptions(options);
    newOptions.extra.addAll(_extra);
    newOptions.headers.addAll(_dio.options.headers);
    newOptions.headers.addAll(<String, String>{});
    print("fields $fields");

    print("options ${options.headers}");
    final _result = await _dio.fetch<Map<String, String>>(newOptions.copyWith(
        method: 'POST',
        contentType: 'application/x-www-form-urlencoded',
        baseUrl: baseUrl ?? _dio.options.baseUrl,
        queryParameters: queryParameters,
        path: 'device/authenticate')
      ..data = _data);
    print("options ${options.headers}");
    final value = AuthenticationResponse().fromJson(_result.data!);
    return value;
  }

  @override
  Future<SpinnerDataResponse> getSpinnerData(options, fields) async {
    const _extra = <String, String>{};
    final queryParameters = <String, String>{};
    final _data = <String, String>{};
    _data.addAll(fields);
    final newOptions = newRequestOptions(options);
    newOptions.extra.addAll(_extra);
    newOptions.headers.addAll(_dio.options.headers);
    newOptions.headers.addAll(<String, String>{});
    final _result = await _dio.fetch<Map<String, String>>(newOptions.copyWith(
        method: 'POST',
        contentType: 'application/x-www-form-urlencoded',
        baseUrl: baseUrl ?? _dio.options.baseUrl,
        queryParameters: queryParameters,
        path: 'spinner/items')
      ..data = _data);
    final value = SpinnerDataResponse().fromJson(_result.data!);
    return value;
  }

  @override
  Future<SaveSpinPrizeResponse> saveSpinPrize(options, fields) async {
    const _extra = <String, String>{};
    final queryParameters = <String, String>{};
    final _data = <String, String>{};
    _data.addAll(fields);
    final newOptions = newRequestOptions(options);
    newOptions.extra.addAll(_extra);
    newOptions.headers.addAll(_dio.options.headers);
    newOptions.headers.addAll(<String, String>{});
    final _result = await _dio.fetch<Map<String, String>>(newOptions.copyWith(
        method: 'POST',
        contentType: 'application/x-www-form-urlencoded',
        baseUrl: baseUrl ?? _dio.options.baseUrl,
        queryParameters: queryParameters,
        path: 'spinner/set_winner')
      ..data = _data);
    final value = SaveSpinPrizeResponse().fromJson(_result.data!);
    return value;
  }

  @override
  Future<UpdateTransactionResponse> updateTransaction(options, fields) async {
    const _extra = <String, String>{};
    final queryParameters = <String, String>{};
    final _data = <String, String>{};
    _data.addAll(fields);
    final newOptions = newRequestOptions(options);
    newOptions.extra.addAll(_extra);
    newOptions.headers.addAll(_dio.options.headers);
    newOptions.headers.addAll(<String, String>{});
    final _result = await _dio.fetch<Map<String, String>>(newOptions.copyWith(
        method: 'POST',
        contentType: 'application/x-www-form-urlencoded',
        baseUrl: baseUrl ?? _dio.options.baseUrl,
        queryParameters: queryParameters,
        path: 'transaction/update')
      ..data = _data);
    final value = UpdateTransactionResponse().fromJson(_result.data!);
    return value;
  }

  @override
  Future<SaveSelectedDrawsResponse> saveDraws(options, fields) async {
    const _extra = <String, String>{};
    final queryParameters = <String, String>{};
    final _data = <String, String>{};
    _data.addAll(fields);
    final newOptions = newRequestOptions(options);
    newOptions.extra.addAll(_extra);
    newOptions.headers.addAll(_dio.options.headers);
    newOptions.headers.addAll(<String, String>{});
    final _result = await _dio.fetch<Map<String, String>>(newOptions.copyWith(
        method: 'POST',
        contentType: 'application/x-www-form-urlencoded',
        baseUrl: baseUrl ?? _dio.options.baseUrl,
        queryParameters: queryParameters,
        path: 'transaction/save-draws')
      ..data = _data);
    final value = SaveSelectedDrawsResponse().fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> getTransaction(options) async {
    const _extra = <String, String>{};
    final queryParameters = <String, String>{};
    final _data = <String, String>{};
    final newOptions = newRequestOptions(options);
    newOptions.extra.addAll(_extra);
    newOptions.headers.addAll(_dio.options.headers);
    newOptions.headers.addAll(<String, String>{});
    final _result = await _dio.fetch<Map<String, String>>(newOptions.copyWith(
        method: 'POST',
        contentType: 'application/x-www-form-urlencoded',
        baseUrl: baseUrl ?? _dio.options.baseUrl,
        queryParameters: queryParameters,
        path: 'transaction/get-transaction')
      ..data = _data);
    final value = TransactionResponse().fromJson(_result.data!);
    return value;
  }

  @override
  Future<AppTextsResponse> getAppTexts(options) async {
    const _extra = <String, String>{};
    final queryParameters = <String, String>{};
    final _data = <String, String>{};
    final newOptions = newRequestOptions(options);
    newOptions.extra.addAll(_extra);
    newOptions.headers.addAll(_dio.options.headers);
    newOptions.headers.addAll(<String, String>{});
    final _result = await _dio.fetch<Map<String, String>>(newOptions.copyWith(
        method: 'POST',
        contentType: 'application/x-www-form-urlencoded',
        baseUrl: baseUrl ?? _dio.options.baseUrl,
        queryParameters: queryParameters,
        path: 'device/app-text')
      ..data = _data);
    final value = AppTextsResponse().fromJson(_result.data!);
    return value;
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
    if (T != String &&
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
