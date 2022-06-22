// To parse this JSON data, do
//
//     final refreshResponse = refreshResponseFromMap(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'refresh_response.freezed.dart';

part 'refresh_response.g.dart';

@freezed
abstract class RefreshResponse with _$RefreshResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RefreshResponse({
    String? accessToken,
    String? refreshToken,
  }) = _RefreshResponse;

  factory RefreshResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshResponseFromJson(json);
}
