// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'movie_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MovieListResponse _$MovieListResponseFromJson(Map<String, dynamic> json) {
  return _MovieListResponse.fromJson(json);
}

/// @nodoc
mixin _$MovieListResponse {
  int? get page => throw _privateConstructorUsedError;
  List<Movie>? get results => throw _privateConstructorUsedError;
  int? get totalPages => throw _privateConstructorUsedError;
  int? get totalResults => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieListResponseCopyWith<MovieListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieListResponseCopyWith<$Res> {
  factory $MovieListResponseCopyWith(
          MovieListResponse value, $Res Function(MovieListResponse) then) =
      _$MovieListResponseCopyWithImpl<$Res>;
  $Res call(
      {int? page, List<Movie>? results, int? totalPages, int? totalResults});
}

/// @nodoc
class _$MovieListResponseCopyWithImpl<$Res>
    implements $MovieListResponseCopyWith<$Res> {
  _$MovieListResponseCopyWithImpl(this._value, this._then);

  final MovieListResponse _value;
  // ignore: unused_field
  final $Res Function(MovieListResponse) _then;

  @override
  $Res call({
    Object? page = freezed,
    Object? results = freezed,
    Object? totalPages = freezed,
    Object? totalResults = freezed,
  }) {
    return _then(_value.copyWith(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      results: results == freezed
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Movie>?,
      totalPages: totalPages == freezed
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      totalResults: totalResults == freezed
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_MovieListResponseCopyWith<$Res>
    implements $MovieListResponseCopyWith<$Res> {
  factory _$$_MovieListResponseCopyWith(_$_MovieListResponse value,
          $Res Function(_$_MovieListResponse) then) =
      __$$_MovieListResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? page, List<Movie>? results, int? totalPages, int? totalResults});
}

/// @nodoc
class __$$_MovieListResponseCopyWithImpl<$Res>
    extends _$MovieListResponseCopyWithImpl<$Res>
    implements _$$_MovieListResponseCopyWith<$Res> {
  __$$_MovieListResponseCopyWithImpl(
      _$_MovieListResponse _value, $Res Function(_$_MovieListResponse) _then)
      : super(_value, (v) => _then(v as _$_MovieListResponse));

  @override
  _$_MovieListResponse get _value => super._value as _$_MovieListResponse;

  @override
  $Res call({
    Object? page = freezed,
    Object? results = freezed,
    Object? totalPages = freezed,
    Object? totalResults = freezed,
  }) {
    return _then(_$_MovieListResponse(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      results: results == freezed
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Movie>?,
      totalPages: totalPages == freezed
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      totalResults: totalResults == freezed
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_MovieListResponse implements _MovieListResponse {
  const _$_MovieListResponse(
      {this.page,
      final List<Movie>? results,
      this.totalPages,
      this.totalResults})
      : _results = results;

  factory _$_MovieListResponse.fromJson(Map<String, dynamic> json) =>
      _$$_MovieListResponseFromJson(json);

  @override
  final int? page;
  final List<Movie>? _results;
  @override
  List<Movie>? get results {
    final value = _results;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? totalPages;
  @override
  final int? totalResults;

  @override
  String toString() {
    return 'MovieListResponse(page: $page, results: $results, totalPages: $totalPages, totalResults: $totalResults)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MovieListResponse &&
            const DeepCollectionEquality().equals(other.page, page) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            const DeepCollectionEquality()
                .equals(other.totalPages, totalPages) &&
            const DeepCollectionEquality()
                .equals(other.totalResults, totalResults));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(page),
      const DeepCollectionEquality().hash(_results),
      const DeepCollectionEquality().hash(totalPages),
      const DeepCollectionEquality().hash(totalResults));

  @JsonKey(ignore: true)
  @override
  _$$_MovieListResponseCopyWith<_$_MovieListResponse> get copyWith =>
      __$$_MovieListResponseCopyWithImpl<_$_MovieListResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MovieListResponseToJson(this);
  }
}

abstract class _MovieListResponse implements MovieListResponse {
  const factory _MovieListResponse(
      {final int? page,
      final List<Movie>? results,
      final int? totalPages,
      final int? totalResults}) = _$_MovieListResponse;

  factory _MovieListResponse.fromJson(Map<String, dynamic> json) =
      _$_MovieListResponse.fromJson;

  @override
  int? get page => throw _privateConstructorUsedError;
  @override
  List<Movie>? get results => throw _privateConstructorUsedError;
  @override
  int? get totalPages => throw _privateConstructorUsedError;
  @override
  int? get totalResults => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_MovieListResponseCopyWith<_$_MovieListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
