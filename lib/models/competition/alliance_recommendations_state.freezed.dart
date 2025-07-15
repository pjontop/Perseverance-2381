// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alliance_recommendations_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AllianceRecommendationsState _$AllianceRecommendationsStateFromJson(
    Map<String, dynamic> json) {
  return _AllianceRecommendationsState.fromJson(json);
}

/// @nodoc
mixin _$AllianceRecommendationsState {
  List<Map<String, dynamic>> get recommendations =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this AllianceRecommendationsState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AllianceRecommendationsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AllianceRecommendationsStateCopyWith<AllianceRecommendationsState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllianceRecommendationsStateCopyWith<$Res> {
  factory $AllianceRecommendationsStateCopyWith(
          AllianceRecommendationsState value,
          $Res Function(AllianceRecommendationsState) then) =
      _$AllianceRecommendationsStateCopyWithImpl<$Res,
          AllianceRecommendationsState>;
  @useResult
  $Res call(
      {List<Map<String, dynamic>> recommendations,
      bool isLoading,
      String? error});
}

/// @nodoc
class _$AllianceRecommendationsStateCopyWithImpl<$Res,
        $Val extends AllianceRecommendationsState>
    implements $AllianceRecommendationsStateCopyWith<$Res> {
  _$AllianceRecommendationsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AllianceRecommendationsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recommendations = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      recommendations: null == recommendations
          ? _value.recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AllianceRecommendationsStateImplCopyWith<$Res>
    implements $AllianceRecommendationsStateCopyWith<$Res> {
  factory _$$AllianceRecommendationsStateImplCopyWith(
          _$AllianceRecommendationsStateImpl value,
          $Res Function(_$AllianceRecommendationsStateImpl) then) =
      __$$AllianceRecommendationsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Map<String, dynamic>> recommendations,
      bool isLoading,
      String? error});
}

/// @nodoc
class __$$AllianceRecommendationsStateImplCopyWithImpl<$Res>
    extends _$AllianceRecommendationsStateCopyWithImpl<$Res,
        _$AllianceRecommendationsStateImpl>
    implements _$$AllianceRecommendationsStateImplCopyWith<$Res> {
  __$$AllianceRecommendationsStateImplCopyWithImpl(
      _$AllianceRecommendationsStateImpl _value,
      $Res Function(_$AllianceRecommendationsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AllianceRecommendationsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recommendations = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$AllianceRecommendationsStateImpl(
      recommendations: null == recommendations
          ? _value._recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AllianceRecommendationsStateImpl
    implements _AllianceRecommendationsState {
  const _$AllianceRecommendationsStateImpl(
      {required final List<Map<String, dynamic>> recommendations,
      this.isLoading = false,
      this.error})
      : _recommendations = recommendations;

  factory _$AllianceRecommendationsStateImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AllianceRecommendationsStateImplFromJson(json);

  final List<Map<String, dynamic>> _recommendations;
  @override
  List<Map<String, dynamic>> get recommendations {
    if (_recommendations is EqualUnmodifiableListView) return _recommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendations);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'AllianceRecommendationsState(recommendations: $recommendations, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllianceRecommendationsStateImpl &&
            const DeepCollectionEquality()
                .equals(other._recommendations, _recommendations) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_recommendations), isLoading, error);

  /// Create a copy of AllianceRecommendationsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AllianceRecommendationsStateImplCopyWith<
          _$AllianceRecommendationsStateImpl>
      get copyWith => __$$AllianceRecommendationsStateImplCopyWithImpl<
          _$AllianceRecommendationsStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AllianceRecommendationsStateImplToJson(
      this,
    );
  }
}

abstract class _AllianceRecommendationsState
    implements AllianceRecommendationsState {
  const factory _AllianceRecommendationsState(
      {required final List<Map<String, dynamic>> recommendations,
      final bool isLoading,
      final String? error}) = _$AllianceRecommendationsStateImpl;

  factory _AllianceRecommendationsState.fromJson(Map<String, dynamic> json) =
      _$AllianceRecommendationsStateImpl.fromJson;

  @override
  List<Map<String, dynamic>> get recommendations;
  @override
  bool get isLoading;
  @override
  String? get error;

  /// Create a copy of AllianceRecommendationsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AllianceRecommendationsStateImplCopyWith<
          _$AllianceRecommendationsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
