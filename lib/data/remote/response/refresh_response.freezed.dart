// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'refresh_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RefreshResponse _$RefreshResponseFromJson(Map<String, dynamic> json) {
  return _RefreshResponse.fromJson(json);
}

/// @nodoc
mixin _$RefreshResponse {
  String? get accessToken => throw _privateConstructorUsedError;
  String? get refreshToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RefreshResponseCopyWith<RefreshResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshResponseCopyWith<$Res> {
  factory $RefreshResponseCopyWith(
          RefreshResponse value, $Res Function(RefreshResponse) then) =
      _$RefreshResponseCopyWithImpl<$Res>;
  $Res call({String? accessToken, String? refreshToken});
}

/// @nodoc
class _$RefreshResponseCopyWithImpl<$Res>
    implements $RefreshResponseCopyWith<$Res> {
  _$RefreshResponseCopyWithImpl(this._value, this._then);

  final RefreshResponse _value;
  // ignore: unused_field
  final $Res Function(RefreshResponse) _then;

  @override
  $Res call({
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_value.copyWith(
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_RefreshResponseCopyWith<$Res>
    implements $RefreshResponseCopyWith<$Res> {
  factory _$$_RefreshResponseCopyWith(
          _$_RefreshResponse value, $Res Function(_$_RefreshResponse) then) =
      __$$_RefreshResponseCopyWithImpl<$Res>;
  @override
  $Res call({String? accessToken, String? refreshToken});
}

/// @nodoc
class __$$_RefreshResponseCopyWithImpl<$Res>
    extends _$RefreshResponseCopyWithImpl<$Res>
    implements _$$_RefreshResponseCopyWith<$Res> {
  __$$_RefreshResponseCopyWithImpl(
      _$_RefreshResponse _value, $Res Function(_$_RefreshResponse) _then)
      : super(_value, (v) => _then(v as _$_RefreshResponse));

  @override
  _$_RefreshResponse get _value => super._value as _$_RefreshResponse;

  @override
  $Res call({
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_$_RefreshResponse(
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_RefreshResponse implements _RefreshResponse {
  const _$_RefreshResponse({this.accessToken, this.refreshToken});

  factory _$_RefreshResponse.fromJson(Map<String, dynamic> json) =>
      _$$_RefreshResponseFromJson(json);

  @override
  final String? accessToken;
  @override
  final String? refreshToken;

  @override
  String toString() {
    return 'RefreshResponse(accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RefreshResponse &&
            const DeepCollectionEquality()
                .equals(other.accessToken, accessToken) &&
            const DeepCollectionEquality()
                .equals(other.refreshToken, refreshToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(accessToken),
      const DeepCollectionEquality().hash(refreshToken));

  @JsonKey(ignore: true)
  @override
  _$$_RefreshResponseCopyWith<_$_RefreshResponse> get copyWith =>
      __$$_RefreshResponseCopyWithImpl<_$_RefreshResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RefreshResponseToJson(
      this,
    );
  }
}

abstract class _RefreshResponse implements RefreshResponse {
  const factory _RefreshResponse(
      {final String? accessToken,
      final String? refreshToken}) = _$_RefreshResponse;

  factory _RefreshResponse.fromJson(Map<String, dynamic> json) =
      _$_RefreshResponse.fromJson;

  @override
  String? get accessToken;
  @override
  String? get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$$_RefreshResponseCopyWith<_$_RefreshResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
