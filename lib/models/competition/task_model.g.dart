// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      priority: $enumDecode(_$TaskPriorityEnumMap, json['priority']),
      status: $enumDecode(_$TaskStatusEnumMap, json['status']),
      category: $enumDecode(_$TaskCategoryEnumMap, json['category']),
      deadline: DateTime.parse(json['deadline'] as String),
      estimatedHours: (json['estimatedHours'] as num).toInt(),
      assignedTo: json['assignedTo'] as String?,
      dependencies: (json['dependencies'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      metadata: json['metadata'] as Map<String, dynamic>?,
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      notes: json['notes'] as String?,
      isAIPrioritized: json['isAIPrioritized'] as bool? ?? false,
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'priority': _$TaskPriorityEnumMap[instance.priority]!,
      'status': _$TaskStatusEnumMap[instance.status]!,
      'category': _$TaskCategoryEnumMap[instance.category]!,
      'deadline': instance.deadline.toIso8601String(),
      'estimatedHours': instance.estimatedHours,
      'assignedTo': instance.assignedTo,
      'dependencies': instance.dependencies,
      'metadata': instance.metadata,
      'completedAt': instance.completedAt?.toIso8601String(),
      'notes': instance.notes,
      'isAIPrioritized': instance.isAIPrioritized,
    };

const _$TaskPriorityEnumMap = {
  TaskPriority.low: 'low',
  TaskPriority.medium: 'medium',
  TaskPriority.high: 'high',
  TaskPriority.critical: 'critical',
};

const _$TaskStatusEnumMap = {
  TaskStatus.pending: 'pending',
  TaskStatus.inProgress: 'inProgress',
  TaskStatus.completed: 'completed',
  TaskStatus.cancelled: 'cancelled',
};

const _$TaskCategoryEnumMap = {
  TaskCategory.robot: 'robot',
  TaskCategory.logistics: 'logistics',
  TaskCategory.documentation: 'documentation',
  TaskCategory.practice: 'practice',
  TaskCategory.competition: 'competition',
};

_$TaskProgressImpl _$$TaskProgressImplFromJson(Map<String, dynamic> json) =>
    _$TaskProgressImpl(
      taskId: json['taskId'] as String,
      completionPercentage: (json['completionPercentage'] as num).toDouble(),
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
      currentStep: json['currentStep'] as String?,
      completedSteps: (json['completedSteps'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      metrics: json['metrics'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$TaskProgressImplToJson(_$TaskProgressImpl instance) =>
    <String, dynamic>{
      'taskId': instance.taskId,
      'completionPercentage': instance.completionPercentage,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
      'currentStep': instance.currentStep,
      'completedSteps': instance.completedSteps,
      'metrics': instance.metrics,
    };

_$TaskTemplateImpl _$$TaskTemplateImplFromJson(Map<String, dynamic> json) =>
    _$TaskTemplateImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      category: $enumDecode(_$TaskCategoryEnumMap, json['category']),
      estimatedHours: (json['estimatedHours'] as num).toInt(),
      steps: (json['steps'] as List<dynamic>).map((e) => e as String).toList(),
      defaultMetadata: json['defaultMetadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$TaskTemplateImplToJson(_$TaskTemplateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'category': _$TaskCategoryEnumMap[instance.category]!,
      'estimatedHours': instance.estimatedHours,
      'steps': instance.steps,
      'defaultMetadata': instance.defaultMetadata,
    };
