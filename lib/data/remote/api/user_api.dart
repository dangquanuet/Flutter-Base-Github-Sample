import 'package:app/data/remote/builder/app_dio.dart';
import 'package:app/data/remote/response/refresh_response.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'user_api.g.dart';

final userApiProvider = Provider((ref) => UserApi(ref.read(dioProvider)));

@RestApi()
abstract class UserApi {
  factory UserApi(Dio dio) = _UserApi;

  @POST('/refresh')
  Future<RefreshResponse> refreshToken();
}
