// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  TaskPriority get priority => throw _privateConstructorUsedError;
  TaskStatus get status => throw _privateConstructorUsedError;
  TaskCategory get category => throw _privateConstructorUsedError;
  DateTime get deadline => throw _privateConstructorUsedError;
  int get estimatedHours => throw _privateConstructorUsedError;
  String? get assignedTo => throw _privateConstructorUsedError;
  List<String>? get dependencies => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  bool get isAIPrioritized => throw _privateConstructorUsedError;

  /// Serializes this Task to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      TaskPriority priority,
      TaskStatus status,
      TaskCategory category,
      DateTime deadline,
      int estimatedHours,
      String? assignedTo,
      List<String>? dependencies,
      Map<String, dynamic>? metadata,
      DateTime? completedAt,
      String? notes,
      bool isAIPrioritized});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? priority = null,
    Object? status = null,
    Object? category = null,
    Object? deadline = null,
    Object? estimatedHours = null,
    Object? assignedTo = freezed,
    Object? dependencies = freezed,
    Object? metadata = freezed,
    Object? completedAt = freezed,
    Object? notes = freezed,
    Object? isAIPrioritized = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as TaskPriority,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TaskCategory,
      deadline: null == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      estimatedHours: null == estimatedHours
          ? _value.estimatedHours
          : estimatedHours // ignore: cast_nullable_to_non_nullable
              as int,
      assignedTo: freezed == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as String?,
      dependencies: freezed == dependencies
          ? _value.dependencies
          : dependencies // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      isAIPrioritized: null == isAIPrioritized
          ? _value.isAIPrioritized
          : isAIPrioritized // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskImplCopyWith(
          _$TaskImpl value, $Res Function(_$TaskImpl) then) =
      __$$TaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      TaskPriority priority,
      TaskStatus status,
      TaskCategory category,
      DateTime deadline,
      int estimatedHours,
      String? assignedTo,
      List<String>? dependencies,
      Map<String, dynamic>? metadata,
      DateTime? completedAt,
      String? notes,
      bool isAIPrioritized});
}

/// @nodoc
class __$$TaskImplCopyWithImpl<$Res>
    extends _$TaskCopyWithImpl<$Res, _$TaskImpl>
    implements _$$TaskImplCopyWith<$Res> {
  __$$TaskImplCopyWithImpl(_$TaskImpl _value, $Res Function(_$TaskImpl) _then)
      : super(_value, _then);

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? priority = null,
    Object? status = null,
    Object? category = null,
    Object? deadline = null,
    Object? estimatedHours = null,
    Object? assignedTo = freezed,
    Object? dependencies = freezed,
    Object? metadata = freezed,
    Object? completedAt = freezed,
    Object? notes = freezed,
    Object? isAIPrioritized = null,
  }) {
    return _then(_$TaskImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as TaskPriority,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TaskCategory,
      deadline: null == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      estimatedHours: null == estimatedHours
          ? _value.estimatedHours
          : estimatedHours // ignore: cast_nullable_to_non_nullable
              as int,
      assignedTo: freezed == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as String?,
      dependencies: freezed == dependencies
          ? _value._dependencies
          : dependencies // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      isAIPrioritized: null == isAIPrioritized
          ? _value.isAIPrioritized
          : isAIPrioritized // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskImpl implements _Task {
  const _$TaskImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.priority,
      required this.status,
      required this.category,
      required this.deadline,
      required this.estimatedHours,
      this.assignedTo,
      final List<String>? dependencies,
      final Map<String, dynamic>? metadata,
      this.completedAt,
      this.notes,
      this.isAIPrioritized = false})
      : _dependencies = dependencies,
        _metadata = metadata;

  factory _$TaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final TaskPriority priority;
  @override
  final TaskStatus status;
  @override
  final TaskCategory category;
  @override
  final DateTime deadline;
  @override
  final int estimatedHours;
  @override
  final String? assignedTo;
  final List<String>? _dependencies;
  @override
  List<String>? get dependencies {
    final value = _dependencies;
    if (value == null) return null;
    if (_dependencies is EqualUnmodifiableListView) return _dependencies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

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
  final DateTime? completedAt;
  @override
  final String? notes;
  @override
  @JsonKey()
  final bool isAIPrioritized;

  @override
  String toString() {
    return 'Task(id: $id, title: $title, description: $description, priority: $priority, status: $status, category: $category, deadline: $deadline, estimatedHours: $estimatedHours, assignedTo: $assignedTo, dependencies: $dependencies, metadata: $metadata, completedAt: $completedAt, notes: $notes, isAIPrioritized: $isAIPrioritized)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            (identical(other.estimatedHours, estimatedHours) ||
                other.estimatedHours == estimatedHours) &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo) &&
            const DeepCollectionEquality()
                .equals(other._dependencies, _dependencies) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.isAIPrioritized, isAIPrioritized) ||
                other.isAIPrioritized == isAIPrioritized));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      priority,
      status,
      category,
      deadline,
      estimatedHours,
      assignedTo,
      const DeepCollectionEquality().hash(_dependencies),
      const DeepCollectionEquality().hash(_metadata),
      completedAt,
      notes,
      isAIPrioritized);

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskImplToJson(
      this,
    );
  }
}

abstract class _Task implements Task {
  const factory _Task(
      {required final String id,
      required final String title,
      required final String description,
      required final TaskPriority priority,
      required final TaskStatus status,
      required final TaskCategory category,
      required final DateTime deadline,
      required final int estimatedHours,
      final String? assignedTo,
      final List<String>? dependencies,
      final Map<String, dynamic>? metadata,
      final DateTime? completedAt,
      final String? notes,
      final bool isAIPrioritized}) = _$TaskImpl;

  factory _Task.fromJson(Map<String, dynamic> json) = _$TaskImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  TaskPriority get priority;
  @override
  TaskStatus get status;
  @override
  TaskCategory get category;
  @override
  DateTime get deadline;
  @override
  int get estimatedHours;
  @override
  String? get assignedTo;
  @override
  List<String>? get dependencies;
  @override
  Map<String, dynamic>? get metadata;
  @override
  DateTime? get completedAt;
  @override
  String? get notes;
  @override
  bool get isAIPrioritized;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TaskProgress _$TaskProgressFromJson(Map<String, dynamic> json) {
  return _TaskProgress.fromJson(json);
}

/// @nodoc
mixin _$TaskProgress {
  String get taskId => throw _privateConstructorUsedError;
  double get completionPercentage => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;
  String? get currentStep => throw _privateConstructorUsedError;
  List<String>? get completedSteps => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metrics => throw _privateConstructorUsedError;

  /// Serializes this TaskProgress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskProgressCopyWith<TaskProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskProgressCopyWith<$Res> {
  factory $TaskProgressCopyWith(
          TaskProgress value, $Res Function(TaskProgress) then) =
      _$TaskProgressCopyWithImpl<$Res, TaskProgress>;
  @useResult
  $Res call(
      {String taskId,
      double completionPercentage,
      DateTime lastUpdated,
      String? currentStep,
      List<String>? completedSteps,
      Map<String, dynamic>? metrics});
}

/// @nodoc
class _$TaskProgressCopyWithImpl<$Res, $Val extends TaskProgress>
    implements $TaskProgressCopyWith<$Res> {
  _$TaskProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
    Object? completionPercentage = null,
    Object? lastUpdated = null,
    Object? currentStep = freezed,
    Object? completedSteps = freezed,
    Object? metrics = freezed,
  }) {
    return _then(_value.copyWith(
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      completionPercentage: null == completionPercentage
          ? _value.completionPercentage
          : completionPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      currentStep: freezed == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as String?,
      completedSteps: freezed == completedSteps
          ? _value.completedSteps
          : completedSteps // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      metrics: freezed == metrics
          ? _value.metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskProgressImplCopyWith<$Res>
    implements $TaskProgressCopyWith<$Res> {
  factory _$$TaskProgressImplCopyWith(
          _$TaskProgressImpl value, $Res Function(_$TaskProgressImpl) then) =
      __$$TaskProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String taskId,
      double completionPercentage,
      DateTime lastUpdated,
      String? currentStep,
      List<String>? completedSteps,
      Map<String, dynamic>? metrics});
}

/// @nodoc
class __$$TaskProgressImplCopyWithImpl<$Res>
    extends _$TaskProgressCopyWithImpl<$Res, _$TaskProgressImpl>
    implements _$$TaskProgressImplCopyWith<$Res> {
  __$$TaskProgressImplCopyWithImpl(
      _$TaskProgressImpl _value, $Res Function(_$TaskProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
    Object? completionPercentage = null,
    Object? lastUpdated = null,
    Object? currentStep = freezed,
    Object? completedSteps = freezed,
    Object? metrics = freezed,
  }) {
    return _then(_$TaskProgressImpl(
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      completionPercentage: null == completionPercentage
          ? _value.completionPercentage
          : completionPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      currentStep: freezed == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as String?,
      completedSteps: freezed == completedSteps
          ? _value._completedSteps
          : completedSteps // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      metrics: freezed == metrics
          ? _value._metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskProgressImpl implements _TaskProgress {
  const _$TaskProgressImpl(
      {required this.taskId,
      required this.completionPercentage,
      required this.lastUpdated,
      this.currentStep,
      final List<String>? completedSteps,
      final Map<String, dynamic>? metrics})
      : _completedSteps = completedSteps,
        _metrics = metrics;

  factory _$TaskProgressImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskProgressImplFromJson(json);

  @override
  final String taskId;
  @override
  final double completionPercentage;
  @override
  final DateTime lastUpdated;
  @override
  final String? currentStep;
  final List<String>? _completedSteps;
  @override
  List<String>? get completedSteps {
    final value = _completedSteps;
    if (value == null) return null;
    if (_completedSteps is EqualUnmodifiableListView) return _completedSteps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, dynamic>? _metrics;
  @override
  Map<String, dynamic>? get metrics {
    final value = _metrics;
    if (value == null) return null;
    if (_metrics is EqualUnmodifiableMapView) return _metrics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'TaskProgress(taskId: $taskId, completionPercentage: $completionPercentage, lastUpdated: $lastUpdated, currentStep: $currentStep, completedSteps: $completedSteps, metrics: $metrics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskProgressImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.completionPercentage, completionPercentage) ||
                other.completionPercentage == completionPercentage) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            const DeepCollectionEquality()
                .equals(other._completedSteps, _completedSteps) &&
            const DeepCollectionEquality().equals(other._metrics, _metrics));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      taskId,
      completionPercentage,
      lastUpdated,
      currentStep,
      const DeepCollectionEquality().hash(_completedSteps),
      const DeepCollectionEquality().hash(_metrics));

  /// Create a copy of TaskProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskProgressImplCopyWith<_$TaskProgressImpl> get copyWith =>
      __$$TaskProgressImplCopyWithImpl<_$TaskProgressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskProgressImplToJson(
      this,
    );
  }
}

abstract class _TaskProgress implements TaskProgress {
  const factory _TaskProgress(
      {required final String taskId,
      required final double completionPercentage,
      required final DateTime lastUpdated,
      final String? currentStep,
      final List<String>? completedSteps,
      final Map<String, dynamic>? metrics}) = _$TaskProgressImpl;

  factory _TaskProgress.fromJson(Map<String, dynamic> json) =
      _$TaskProgressImpl.fromJson;

  @override
  String get taskId;
  @override
  double get completionPercentage;
  @override
  DateTime get lastUpdated;
  @override
  String? get currentStep;
  @override
  List<String>? get completedSteps;
  @override
  Map<String, dynamic>? get metrics;

  /// Create a copy of TaskProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskProgressImplCopyWith<_$TaskProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TaskTemplate _$TaskTemplateFromJson(Map<String, dynamic> json) {
  return _TaskTemplate.fromJson(json);
}

/// @nodoc
mixin _$TaskTemplate {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  TaskCategory get category => throw _privateConstructorUsedError;
  int get estimatedHours => throw _privateConstructorUsedError;
  List<String> get steps => throw _privateConstructorUsedError;
  Map<String, dynamic>? get defaultMetadata =>
      throw _privateConstructorUsedError;

  /// Serializes this TaskTemplate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskTemplate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskTemplateCopyWith<TaskTemplate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskTemplateCopyWith<$Res> {
  factory $TaskTemplateCopyWith(
          TaskTemplate value, $Res Function(TaskTemplate) then) =
      _$TaskTemplateCopyWithImpl<$Res, TaskTemplate>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      TaskCategory category,
      int estimatedHours,
      List<String> steps,
      Map<String, dynamic>? defaultMetadata});
}

/// @nodoc
class _$TaskTemplateCopyWithImpl<$Res, $Val extends TaskTemplate>
    implements $TaskTemplateCopyWith<$Res> {
  _$TaskTemplateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskTemplate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? category = null,
    Object? estimatedHours = null,
    Object? steps = null,
    Object? defaultMetadata = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TaskCategory,
      estimatedHours: null == estimatedHours
          ? _value.estimatedHours
          : estimatedHours // ignore: cast_nullable_to_non_nullable
              as int,
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<String>,
      defaultMetadata: freezed == defaultMetadata
          ? _value.defaultMetadata
          : defaultMetadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskTemplateImplCopyWith<$Res>
    implements $TaskTemplateCopyWith<$Res> {
  factory _$$TaskTemplateImplCopyWith(
          _$TaskTemplateImpl value, $Res Function(_$TaskTemplateImpl) then) =
      __$$TaskTemplateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      TaskCategory category,
      int estimatedHours,
      List<String> steps,
      Map<String, dynamic>? defaultMetadata});
}

/// @nodoc
class __$$TaskTemplateImplCopyWithImpl<$Res>
    extends _$TaskTemplateCopyWithImpl<$Res, _$TaskTemplateImpl>
    implements _$$TaskTemplateImplCopyWith<$Res> {
  __$$TaskTemplateImplCopyWithImpl(
      _$TaskTemplateImpl _value, $Res Function(_$TaskTemplateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskTemplate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? category = null,
    Object? estimatedHours = null,
    Object? steps = null,
    Object? defaultMetadata = freezed,
  }) {
    return _then(_$TaskTemplateImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TaskCategory,
      estimatedHours: null == estimatedHours
          ? _value.estimatedHours
          : estimatedHours // ignore: cast_nullable_to_non_nullable
              as int,
      steps: null == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<String>,
      defaultMetadata: freezed == defaultMetadata
          ? _value._defaultMetadata
          : defaultMetadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskTemplateImpl implements _TaskTemplate {
  const _$TaskTemplateImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.category,
      required this.estimatedHours,
      required final List<String> steps,
      final Map<String, dynamic>? defaultMetadata})
      : _steps = steps,
        _defaultMetadata = defaultMetadata;

  factory _$TaskTemplateImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskTemplateImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final TaskCategory category;
  @override
  final int estimatedHours;
  final List<String> _steps;
  @override
  List<String> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  final Map<String, dynamic>? _defaultMetadata;
  @override
  Map<String, dynamic>? get defaultMetadata {
    final value = _defaultMetadata;
    if (value == null) return null;
    if (_defaultMetadata is EqualUnmodifiableMapView) return _defaultMetadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'TaskTemplate(id: $id, name: $name, description: $description, category: $category, estimatedHours: $estimatedHours, steps: $steps, defaultMetadata: $defaultMetadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskTemplateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.estimatedHours, estimatedHours) ||
                other.estimatedHours == estimatedHours) &&
            const DeepCollectionEquality().equals(other._steps, _steps) &&
            const DeepCollectionEquality()
                .equals(other._defaultMetadata, _defaultMetadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      category,
      estimatedHours,
      const DeepCollectionEquality().hash(_steps),
      const DeepCollectionEquality().hash(_defaultMetadata));

  /// Create a copy of TaskTemplate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskTemplateImplCopyWith<_$TaskTemplateImpl> get copyWith =>
      __$$TaskTemplateImplCopyWithImpl<_$TaskTemplateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskTemplateImplToJson(
      this,
    );
  }
}

abstract class _TaskTemplate implements TaskTemplate {
  const factory _TaskTemplate(
      {required final String id,
      required final String name,
      required final String description,
      required final TaskCategory category,
      required final int estimatedHours,
      required final List<String> steps,
      final Map<String, dynamic>? defaultMetadata}) = _$TaskTemplateImpl;

  factory _TaskTemplate.fromJson(Map<String, dynamic> json) =
      _$TaskTemplateImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  TaskCategory get category;
  @override
  int get estimatedHours;
  @override
  List<String> get steps;
  @override
  Map<String, dynamic>? get defaultMetadata;

  /// Create a copy of TaskTemplate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskTemplateImplCopyWith<_$TaskTemplateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
