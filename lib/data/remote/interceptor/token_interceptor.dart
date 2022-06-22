import 'dart:io';

import 'package:app/data/remote/api/user_api.dart';
import 'package:app/data/remote/builder/app_dio.dart';
import 'package:dio/dio.dart';

class TokenInterceptor extends Interceptor {
  final Dio currentDio;
  final String auth = 'Authorization';
  final String bearer = 'Bearer';

  TokenInterceptor({required this.currentDio});

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response != null &&
        err.response?.statusCode == HttpStatus.unauthorized) {
      // TODO Please refactor when token api ready
      // Lock all of request to request new token
      currentDio.lock();
      // request new token & save it
      final token = await requestToken();
      // unlock when token refreshed
      currentDio.unlock();

      // Re-call request
      final request = err.requestOptions;
      try {
        // Check header has Authentication
        if (request.headers.containsKey(auth)) {
          // Update the last value
          request.headers.update(
              auth,
              (value) => (value.toString().contains(bearer) == true)
                  ? '$bearer $token'
                  : token);
        }

        final response = await currentDio.request(
          request.path,
          data: request.data,
          queryParameters: request.queryParameters,
          cancelToken: request.cancelToken,
          options: Options(
              method: request.method,
              sendTimeout: request.sendTimeout,
              extra: request.extra,
              headers: request.headers,
              responseType: request.responseType,
              contentType: request.contentType,
              receiveDataWhenStatusError: request.receiveDataWhenStatusError,
              followRedirects: request.followRedirects,
              maxRedirects: request.maxRedirects,
              requestEncoder: request.requestEncoder,
              responseDecoder: request.responseDecoder,
              listFormat: request.listFormat),
          onReceiveProgress: request.onReceiveProgress,
        );

        handler.resolve(response);
      } on DioError catch (e) {
        handler.next(e);
      }
    }

    super.onError(err, handler);
  }

  Future<String> requestToken() async {
    final dio = AppDio.getInstance();
    try {
      final userApi = UserApi(dio);
      final refreshResponse = await userApi.refreshToken();
      return Future.value(refreshResponse.refreshToken);
    } on Exception catch (e) {
      return Future.error(e);
    }
  }
}
