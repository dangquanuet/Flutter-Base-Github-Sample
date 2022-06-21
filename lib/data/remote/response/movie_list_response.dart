// To parse this JSON data, do
//
//     final movieListResponse = movieListResponseFromMap(jsonString);

import 'package:app/data/model/movie.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_list_response.freezed.dart';

part 'movie_list_response.g.dart';

@freezed
abstract class MovieListResponse with _$MovieListResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MovieListResponse({
    int? page,
    List<Movie>? results,
    int? totalPages,
    int? totalResults,
  }) = _MovieListResponse;

  factory MovieListResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieListResponseFromJson(json);
}
