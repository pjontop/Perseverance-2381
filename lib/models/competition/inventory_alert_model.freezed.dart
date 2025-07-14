// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_alert_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InventoryAlert _$InventoryAlertFromJson(Map<String, dynamic> json) {
  return _InventoryAlert.fromJson(json);
}

/// @nodoc
mixin _$InventoryAlert {
  String get id => throw _privateConstructorUsedError;
  String get itemId => throw _privateConstructorUsedError;
  String get itemName => throw _privateConstructorUsedError;
  AlertType get alertType => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  Priority get priority => throw _privateConstructorUsedError;
  String get suggestedAction => throw _privateConstructorUsedError;
  DateTime? get deadline => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  bool get isAIGenerated => throw _privateConstructorUsedError;

  /// Serializes this InventoryAlert to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InventoryAlert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InventoryAlertCopyWith<InventoryAlert> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryAlertCopyWith<$Res> {
  factory $InventoryAlertCopyWith(
          InventoryAlert value, $Res Function(InventoryAlert) then) =
      _$InventoryAlertCopyWithImpl<$Res, InventoryAlert>;
  @useResult
  $Res call(
      {String id,
      String itemId,
      String itemName,
      AlertType alertType,
      String message,
      Priority priority,
      String suggestedAction,
      DateTime? deadline,
      Map<String, dynamic>? metadata,
      bool isAIGenerated});
}

/// @nodoc
class _$InventoryAlertCopyWithImpl<$Res, $Val extends InventoryAlert>
    implements $InventoryAlertCopyWith<$Res> {
  _$InventoryAlertCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InventoryAlert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemId = null,
    Object? itemName = null,
    Object? alertType = null,
    Object? message = null,
    Object? priority = null,
    Object? suggestedAction = null,
    Object? deadline = freezed,
    Object? metadata = freezed,
    Object? isAIGenerated = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      alertType: null == alertType
          ? _value.alertType
          : alertType // ignore: cast_nullable_to_non_nullable
              as AlertType,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as Priority,
      suggestedAction: null == suggestedAction
          ? _value.suggestedAction
          : suggestedAction // ignore: cast_nullable_to_non_nullable
              as String,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      isAIGenerated: null == isAIGenerated
          ? _value.isAIGenerated
          : isAIGenerated // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InventoryAlertImplCopyWith<$Res>
    implements $InventoryAlertCopyWith<$Res> {
  factory _$$InventoryAlertImplCopyWith(_$InventoryAlertImpl value,
          $Res Function(_$InventoryAlertImpl) then) =
      __$$InventoryAlertImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String itemId,
      String itemName,
      AlertType alertType,
      String message,
      Priority priority,
      String suggestedAction,
      DateTime? deadline,
      Map<String, dynamic>? metadata,
      bool isAIGenerated});
}

/// @nodoc
class __$$InventoryAlertImplCopyWithImpl<$Res>
    extends _$InventoryAlertCopyWithImpl<$Res, _$InventoryAlertImpl>
    implements _$$InventoryAlertImplCopyWith<$Res> {
  __$$InventoryAlertImplCopyWithImpl(
      _$InventoryAlertImpl _value, $Res Function(_$InventoryAlertImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryAlert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemId = null,
    Object? itemName = null,
    Object? alertType = null,
    Object? message = null,
    Object? priority = null,
    Object? suggestedAction = null,
    Object? deadline = freezed,
    Object? metadata = freezed,
    Object? isAIGenerated = null,
  }) {
    return _then(_$InventoryAlertImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      alertType: null == alertType
          ? _value.alertType
          : alertType // ignore: cast_nullable_to_non_nullable
              as AlertType,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as Priority,
      suggestedAction: null == suggestedAction
          ? _value.suggestedAction
          : suggestedAction // ignore: cast_nullable_to_non_nullable
              as String,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      isAIGenerated: null == isAIGenerated
          ? _value.isAIGenerated
          : isAIGenerated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InventoryAlertImpl implements _InventoryAlert {
  const _$InventoryAlertImpl(
      {required this.id,
      required this.itemId,
      required this.itemName,
      required this.alertType,
      required this.message,
      required this.priority,
      required this.suggestedAction,
      this.deadline,
      final Map<String, dynamic>? metadata,
      this.isAIGenerated = false})
      : _metadata = metadata;

  factory _$InventoryAlertImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryAlertImplFromJson(json);

  @override
  final String id;
  @override
  final String itemId;
  @override
  final String itemName;
  @override
  final AlertType alertType;
  @override
  final String message;
  @override
  final Priority priority;
  @override
  final String suggestedAction;
  @override
  final DateTime? deadline;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey()
  final bool isAIGenerated;

  @override
  String toString() {
    return 'InventoryAlert(id: $id, itemId: $itemId, itemName: $itemName, alertType: $alertType, message: $message, priority: $priority, suggestedAction: $suggestedAction, deadline: $deadline, metadata: $metadata, isAIGenerated: $isAIGenerated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryAlertImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.alertType, alertType) ||
                other.alertType == alertType) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.suggestedAction, suggestedAction) ||
                other.suggestedAction == suggestedAction) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.isAIGenerated, isAIGenerated) ||
                other.isAIGenerated == isAIGenerated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      itemId,
      itemName,
      alertType,
      message,
      priority,
      suggestedAction,
      deadline,
      const DeepCollectionEquality().hash(_metadata),
      isAIGenerated);

  /// Create a copy of InventoryAlert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryAlertImplCopyWith<_$InventoryAlertImpl> get copyWith =>
      __$$InventoryAlertImplCopyWithImpl<_$InventoryAlertImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryAlertImplToJson(
      this,
    );
  }
}

abstract class _InventoryAlert implements InventoryAlert {
  const factory _InventoryAlert(
      {required final String id,
      required final String itemId,
      required final String itemName,
      required final AlertType alertType,
      required final String message,
      required final Priority priority,
      required final String suggestedAction,
      final DateTime? deadline,
      final Map<String, dynamic>? metadata,
      final bool isAIGenerated}) = _$InventoryAlertImpl;

  factory _InventoryAlert.fromJson(Map<String, dynamic> json) =
      _$InventoryAlertImpl.fromJson;

  @override
  String get id;
  @override
  String get itemId;
  @override
  String get itemName;
  @override
  AlertType get alertType;
  @override
  String get message;
  @override
  Priority get priority;
  @override
  String get suggestedAction;
  @override
  DateTime? get deadline;
  @override
  Map<String, dynamic>? get metadata;
  @override
  bool get isAIGenerated;

  /// Create a copy of InventoryAlert
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InventoryAlertImplCopyWith<_$InventoryAlertImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InventoryPrediction _$InventoryPredictionFromJson(Map<String, dynamic> json) {
  return _InventoryPrediction.fromJson(json);
}

/// @nodoc
mixin _$InventoryPrediction {
  String get itemId => throw _privateConstructorUsedError;
  String get itemName => throw _privateConstructorUsedError;
  DateTime get predictedShortageDate => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;
  String get reasoning => throw _privateConstructorUsedError;
  List<String> get recommendedActions => throw _privateConstructorUsedError;
  Map<String, dynamic>? get usagePatterns => throw _privateConstructorUsedError;
  bool get isAIGenerated => throw _privateConstructorUsedError;

  /// Serializes this InventoryPrediction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InventoryPrediction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InventoryPredictionCopyWith<InventoryPrediction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryPredictionCopyWith<$Res> {
  factory $InventoryPredictionCopyWith(
          InventoryPrediction value, $Res Function(InventoryPrediction) then) =
      _$InventoryPredictionCopyWithImpl<$Res, InventoryPrediction>;
  @useResult
  $Res call(
      {String itemId,
      String itemName,
      DateTime predictedShortageDate,
      double confidence,
      String reasoning,
      List<String> recommendedActions,
      Map<String, dynamic>? usagePatterns,
      bool isAIGenerated});
}

/// @nodoc
class _$InventoryPredictionCopyWithImpl<$Res, $Val extends InventoryPrediction>
    implements $InventoryPredictionCopyWith<$Res> {
  _$InventoryPredictionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InventoryPrediction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? itemName = null,
    Object? predictedShortageDate = null,
    Object? confidence = null,
    Object? reasoning = null,
    Object? recommendedActions = null,
    Object? usagePatterns = freezed,
    Object? isAIGenerated = null,
  }) {
    return _then(_value.copyWith(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      predictedShortageDate: null == predictedShortageDate
          ? _value.predictedShortageDate
          : predictedShortageDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      reasoning: null == reasoning
          ? _value.reasoning
          : reasoning // ignore: cast_nullable_to_non_nullable
              as String,
      recommendedActions: null == recommendedActions
          ? _value.recommendedActions
          : recommendedActions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      usagePatterns: freezed == usagePatterns
          ? _value.usagePatterns
          : usagePatterns // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      isAIGenerated: null == isAIGenerated
          ? _value.isAIGenerated
          : isAIGenerated // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InventoryPredictionImplCopyWith<$Res>
    implements $InventoryPredictionCopyWith<$Res> {
  factory _$$InventoryPredictionImplCopyWith(_$InventoryPredictionImpl value,
          $Res Function(_$InventoryPredictionImpl) then) =
      __$$InventoryPredictionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String itemId,
      String itemName,
      DateTime predictedShortageDate,
      double confidence,
      String reasoning,
      List<String> recommendedActions,
      Map<String, dynamic>? usagePatterns,
      bool isAIGenerated});
}

/// @nodoc
class __$$InventoryPredictionImplCopyWithImpl<$Res>
    extends _$InventoryPredictionCopyWithImpl<$Res, _$InventoryPredictionImpl>
    implements _$$InventoryPredictionImplCopyWith<$Res> {
  __$$InventoryPredictionImplCopyWithImpl(_$InventoryPredictionImpl _value,
      $Res Function(_$InventoryPredictionImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryPrediction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? itemName = null,
    Object? predictedShortageDate = null,
    Object? confidence = null,
    Object? reasoning = null,
    Object? recommendedActions = null,
    Object? usagePatterns = freezed,
    Object? isAIGenerated = null,
  }) {
    return _then(_$InventoryPredictionImpl(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      predictedShortageDate: null == predictedShortageDate
          ? _value.predictedShortageDate
          : predictedShortageDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      reasoning: null == reasoning
          ? _value.reasoning
          : reasoning // ignore: cast_nullable_to_non_nullable
              as String,
      recommendedActions: null == recommendedActions
          ? _value._recommendedActions
          : recommendedActions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      usagePatterns: freezed == usagePatterns
          ? _value._usagePatterns
          : usagePatterns // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      isAIGenerated: null == isAIGenerated
          ? _value.isAIGenerated
          : isAIGenerated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InventoryPredictionImpl implements _InventoryPrediction {
  const _$InventoryPredictionImpl(
      {required this.itemId,
      required this.itemName,
      required this.predictedShortageDate,
      required this.confidence,
      required this.reasoning,
      required final List<String> recommendedActions,
      final Map<String, dynamic>? usagePatterns,
      this.isAIGenerated = false})
      : _recommendedActions = recommendedActions,
        _usagePatterns = usagePatterns;

  factory _$InventoryPredictionImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryPredictionImplFromJson(json);

  @override
  final String itemId;
  @override
  final String itemName;
  @override
  final DateTime predictedShortageDate;
  @override
  final double confidence;
  @override
  final String reasoning;
  final List<String> _recommendedActions;
  @override
  List<String> get recommendedActions {
    if (_recommendedActions is EqualUnmodifiableListView)
      return _recommendedActions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendedActions);
  }

  final Map<String, dynamic>? _usagePatterns;
  @override
  Map<String, dynamic>? get usagePatterns {
    final value = _usagePatterns;
    if (value == null) return null;
    if (_usagePatterns is EqualUnmodifiableMapView) return _usagePatterns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey()
  final bool isAIGenerated;

  @override
  String toString() {
    return 'InventoryPrediction(itemId: $itemId, itemName: $itemName, predictedShortageDate: $predictedShortageDate, confidence: $confidence, reasoning: $reasoning, recommendedActions: $recommendedActions, usagePatterns: $usagePatterns, isAIGenerated: $isAIGenerated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryPredictionImpl &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.predictedShortageDate, predictedShortageDate) ||
                other.predictedShortageDate == predictedShortageDate) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.reasoning, reasoning) ||
                other.reasoning == reasoning) &&
            const DeepCollectionEquality()
                .equals(other._recommendedActions, _recommendedActions) &&
            const DeepCollectionEquality()
                .equals(other._usagePatterns, _usagePatterns) &&
            (identical(other.isAIGenerated, isAIGenerated) ||
                other.isAIGenerated == isAIGenerated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      itemId,
      itemName,
      predictedShortageDate,
      confidence,
      reasoning,
      const DeepCollectionEquality().hash(_recommendedActions),
      const DeepCollectionEquality().hash(_usagePatterns),
      isAIGenerated);

  /// Create a copy of InventoryPrediction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryPredictionImplCopyWith<_$InventoryPredictionImpl> get copyWith =>
      __$$InventoryPredictionImplCopyWithImpl<_$InventoryPredictionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryPredictionImplToJson(
      this,
    );
  }
}

abstract class _InventoryPrediction implements InventoryPrediction {
  const factory _InventoryPrediction(
      {required final String itemId,
      required final String itemName,
      required final DateTime predictedShortageDate,
      required final double confidence,
      required final String reasoning,
      required final List<String> recommendedActions,
      final Map<String, dynamic>? usagePatterns,
      final bool isAIGenerated}) = _$InventoryPredictionImpl;

  factory _InventoryPrediction.fromJson(Map<String, dynamic> json) =
      _$InventoryPredictionImpl.fromJson;

  @override
  String get itemId;
  @override
  String get itemName;
  @override
  DateTime get predictedShortageDate;
  @override
  double get confidence;
  @override
  String get reasoning;
  @override
  List<String> get recommendedActions;
  @override
  Map<String, dynamic>? get usagePatterns;
  @override
  bool get isAIGenerated;

  /// Create a copy of InventoryPrediction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InventoryPredictionImplCopyWith<_$InventoryPredictionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
