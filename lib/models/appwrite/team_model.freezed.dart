// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Team _$TeamFromJson(Map<String, dynamic> json) {
  return _Team.fromJson(json);
}

/// @nodoc
mixin _$Team {
  String get id => throw _privateConstructorUsedError;
  String get teamNumber => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  TeamRegion get region => throw _privateConstructorUsedError;
  String? get school => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get website => throw _privateConstructorUsedError;
  String? get logoUrl => throw _privateConstructorUsedError;
  Map<String, dynamic>? get performanceMetrics =>
      throw _privateConstructorUsedError;
  List<String>? get strengths => throw _privateConstructorUsedError;
  List<String>? get weaknesses => throw _privateConstructorUsedError;
  List<String>? get preferredAlliancePartners =>
      throw _privateConstructorUsedError;
  Map<String, double>? get compatibilityScores =>
      throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Team to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Team
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TeamCopyWith<Team> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamCopyWith<$Res> {
  factory $TeamCopyWith(Team value, $Res Function(Team) then) =
      _$TeamCopyWithImpl<$Res, Team>;
  @useResult
  $Res call(
      {String id,
      String teamNumber,
      String name,
      TeamRegion region,
      String? school,
      String? city,
      String? state,
      String? country,
      String? website,
      String? logoUrl,
      Map<String, dynamic>? performanceMetrics,
      List<String>? strengths,
      List<String>? weaknesses,
      List<String>? preferredAlliancePartners,
      Map<String, double>? compatibilityScores,
      String? notes,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$TeamCopyWithImpl<$Res, $Val extends Team>
    implements $TeamCopyWith<$Res> {
  _$TeamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Team
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? teamNumber = null,
    Object? name = null,
    Object? region = null,
    Object? school = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? country = freezed,
    Object? website = freezed,
    Object? logoUrl = freezed,
    Object? performanceMetrics = freezed,
    Object? strengths = freezed,
    Object? weaknesses = freezed,
    Object? preferredAlliancePartners = freezed,
    Object? compatibilityScores = freezed,
    Object? notes = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      teamNumber: null == teamNumber
          ? _value.teamNumber
          : teamNumber // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as TeamRegion,
      school: freezed == school
          ? _value.school
          : school // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      performanceMetrics: freezed == performanceMetrics
          ? _value.performanceMetrics
          : performanceMetrics // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      strengths: freezed == strengths
          ? _value.strengths
          : strengths // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      weaknesses: freezed == weaknesses
          ? _value.weaknesses
          : weaknesses // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      preferredAlliancePartners: freezed == preferredAlliancePartners
          ? _value.preferredAlliancePartners
          : preferredAlliancePartners // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      compatibilityScores: freezed == compatibilityScores
          ? _value.compatibilityScores
          : compatibilityScores // ignore: cast_nullable_to_non_nullable
              as Map<String, double>?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TeamImplCopyWith<$Res> implements $TeamCopyWith<$Res> {
  factory _$$TeamImplCopyWith(
          _$TeamImpl value, $Res Function(_$TeamImpl) then) =
      __$$TeamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String teamNumber,
      String name,
      TeamRegion region,
      String? school,
      String? city,
      String? state,
      String? country,
      String? website,
      String? logoUrl,
      Map<String, dynamic>? performanceMetrics,
      List<String>? strengths,
      List<String>? weaknesses,
      List<String>? preferredAlliancePartners,
      Map<String, double>? compatibilityScores,
      String? notes,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$TeamImplCopyWithImpl<$Res>
    extends _$TeamCopyWithImpl<$Res, _$TeamImpl>
    implements _$$TeamImplCopyWith<$Res> {
  __$$TeamImplCopyWithImpl(_$TeamImpl _value, $Res Function(_$TeamImpl) _then)
      : super(_value, _then);

  /// Create a copy of Team
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? teamNumber = null,
    Object? name = null,
    Object? region = null,
    Object? school = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? country = freezed,
    Object? website = freezed,
    Object? logoUrl = freezed,
    Object? performanceMetrics = freezed,
    Object? strengths = freezed,
    Object? weaknesses = freezed,
    Object? preferredAlliancePartners = freezed,
    Object? compatibilityScores = freezed,
    Object? notes = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$TeamImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      teamNumber: null == teamNumber
          ? _value.teamNumber
          : teamNumber // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as TeamRegion,
      school: freezed == school
          ? _value.school
          : school // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      performanceMetrics: freezed == performanceMetrics
          ? _value._performanceMetrics
          : performanceMetrics // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      strengths: freezed == strengths
          ? _value._strengths
          : strengths // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      weaknesses: freezed == weaknesses
          ? _value._weaknesses
          : weaknesses // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      preferredAlliancePartners: freezed == preferredAlliancePartners
          ? _value._preferredAlliancePartners
          : preferredAlliancePartners // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      compatibilityScores: freezed == compatibilityScores
          ? _value._compatibilityScores
          : compatibilityScores // ignore: cast_nullable_to_non_nullable
              as Map<String, double>?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TeamImpl implements _Team {
  const _$TeamImpl(
      {required this.id,
      required this.teamNumber,
      required this.name,
      required this.region,
      this.school,
      this.city,
      this.state,
      this.country,
      this.website,
      this.logoUrl,
      final Map<String, dynamic>? performanceMetrics,
      final List<String>? strengths,
      final List<String>? weaknesses,
      final List<String>? preferredAlliancePartners,
      final Map<String, double>? compatibilityScores,
      this.notes,
      this.createdAt,
      this.updatedAt})
      : _performanceMetrics = performanceMetrics,
        _strengths = strengths,
        _weaknesses = weaknesses,
        _preferredAlliancePartners = preferredAlliancePartners,
        _compatibilityScores = compatibilityScores;

  factory _$TeamImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeamImplFromJson(json);

  @override
  final String id;
  @override
  final String teamNumber;
  @override
  final String name;
  @override
  final TeamRegion region;
  @override
  final String? school;
  @override
  final String? city;
  @override
  final String? state;
  @override
  final String? country;
  @override
  final String? website;
  @override
  final String? logoUrl;
  final Map<String, dynamic>? _performanceMetrics;
  @override
  Map<String, dynamic>? get performanceMetrics {
    final value = _performanceMetrics;
    if (value == null) return null;
    if (_performanceMetrics is EqualUnmodifiableMapView)
      return _performanceMetrics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<String>? _strengths;
  @override
  List<String>? get strengths {
    final value = _strengths;
    if (value == null) return null;
    if (_strengths is EqualUnmodifiableListView) return _strengths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _weaknesses;
  @override
  List<String>? get weaknesses {
    final value = _weaknesses;
    if (value == null) return null;
    if (_weaknesses is EqualUnmodifiableListView) return _weaknesses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _preferredAlliancePartners;
  @override
  List<String>? get preferredAlliancePartners {
    final value = _preferredAlliancePartners;
    if (value == null) return null;
    if (_preferredAlliancePartners is EqualUnmodifiableListView)
      return _preferredAlliancePartners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, double>? _compatibilityScores;
  @override
  Map<String, double>? get compatibilityScores {
    final value = _compatibilityScores;
    if (value == null) return null;
    if (_compatibilityScores is EqualUnmodifiableMapView)
      return _compatibilityScores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? notes;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Team(id: $id, teamNumber: $teamNumber, name: $name, region: $region, school: $school, city: $city, state: $state, country: $country, website: $website, logoUrl: $logoUrl, performanceMetrics: $performanceMetrics, strengths: $strengths, weaknesses: $weaknesses, preferredAlliancePartners: $preferredAlliancePartners, compatibilityScores: $compatibilityScores, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeamImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.teamNumber, teamNumber) ||
                other.teamNumber == teamNumber) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.school, school) || other.school == school) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            const DeepCollectionEquality()
                .equals(other._performanceMetrics, _performanceMetrics) &&
            const DeepCollectionEquality()
                .equals(other._strengths, _strengths) &&
            const DeepCollectionEquality()
                .equals(other._weaknesses, _weaknesses) &&
            const DeepCollectionEquality().equals(
                other._preferredAlliancePartners, _preferredAlliancePartners) &&
            const DeepCollectionEquality()
                .equals(other._compatibilityScores, _compatibilityScores) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      teamNumber,
      name,
      region,
      school,
      city,
      state,
      country,
      website,
      logoUrl,
      const DeepCollectionEquality().hash(_performanceMetrics),
      const DeepCollectionEquality().hash(_strengths),
      const DeepCollectionEquality().hash(_weaknesses),
      const DeepCollectionEquality().hash(_preferredAlliancePartners),
      const DeepCollectionEquality().hash(_compatibilityScores),
      notes,
      createdAt,
      updatedAt);

  /// Create a copy of Team
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TeamImplCopyWith<_$TeamImpl> get copyWith =>
      __$$TeamImplCopyWithImpl<_$TeamImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeamImplToJson(
      this,
    );
  }
}

abstract class _Team implements Team {
  const factory _Team(
      {required final String id,
      required final String teamNumber,
      required final String name,
      required final TeamRegion region,
      final String? school,
      final String? city,
      final String? state,
      final String? country,
      final String? website,
      final String? logoUrl,
      final Map<String, dynamic>? performanceMetrics,
      final List<String>? strengths,
      final List<String>? weaknesses,
      final List<String>? preferredAlliancePartners,
      final Map<String, double>? compatibilityScores,
      final String? notes,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$TeamImpl;

  factory _Team.fromJson(Map<String, dynamic> json) = _$TeamImpl.fromJson;

  @override
  String get id;
  @override
  String get teamNumber;
  @override
  String get name;
  @override
  TeamRegion get region;
  @override
  String? get school;
  @override
  String? get city;
  @override
  String? get state;
  @override
  String? get country;
  @override
  String? get website;
  @override
  String? get logoUrl;
  @override
  Map<String, dynamic>? get performanceMetrics;
  @override
  List<String>? get strengths;
  @override
  List<String>? get weaknesses;
  @override
  List<String>? get preferredAlliancePartners;
  @override
  Map<String, double>? get compatibilityScores;
  @override
  String? get notes;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Team
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TeamImplCopyWith<_$TeamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
