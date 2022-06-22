import 'package:freezed_annotation/freezed_annotation.dart';

part 'repos.freezed.dart';

part 'repos.g.dart';

@freezed
abstract class Repos with _$Repos {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Repos({
    String? description,
    int? forksCount,
    String? fullName,
    String? language,
    int? id,
    int? stargazersCount,
    String? updatedAt,
    int? watchersCount,
    String? htmlUrl,
  }) = _Repos;

  factory Repos.fromJson(Map<String, dynamic> json) => _$ReposFromJson(json);
}
