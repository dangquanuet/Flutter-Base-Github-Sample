import 'dart:io';

import 'package:app/data/local/app_pref.dart';
import 'package:dio/dio.dart';
import 'package:package_info_plus/package_info_plus.dart';

class HeaderInterceptor extends InterceptorsWrapper {
  final String userAgentKey = 'User-Agent';
  final String authHeaderKey = 'Authorization';
  final String bearer = 'Bearer';

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final userAgentValue = await userAgentClientHintsHeader();

    final token = await AppPrefs().getToken();
    if (token?.isNotEmpty == true) {
      options.headers[authHeaderKey] = '$bearer $token';
    }
    options.headers[userAgentKey] = userAgentValue;

    handler.next(options);
  }

  Future<String> userAgentClientHintsHeader() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return '${Platform.operatingSystem} - ${packageInfo.buildNumber}';
  }
}
