import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

enum TaskPriority { low, medium, high, critical }
enum TaskStatus { pending, inProgress, completed, cancelled }
enum TaskCategory { robot, logistics, documentation, practice, competition }

@freezed
class Task with _$Task {
  const factory Task({
    required String id,
    required String title,
    required String description,
    required TaskPriority priority,
    required TaskStatus status,
    required TaskCategory category,
    required DateTime deadline,
    required int estimatedHours,
    String? assignedTo,
    List<String>? dependencies,
    Map<String, dynamic>? metadata,
    DateTime? completedAt,
    String? notes,
    @Default(false) bool isAIPrioritized,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}

@freezed
class TaskProgress with _$TaskProgress {
  const factory TaskProgress({
    required String taskId,
    required double completionPercentage,
    required DateTime lastUpdated,
    String? currentStep,
    List<String>? completedSteps,
    Map<String, dynamic>? metrics,
  }) = _TaskProgress;

  factory TaskProgress.fromJson(Map<String, dynamic> json) => _$TaskProgressFromJson(json);
}

@freezed
class TaskTemplate with _$TaskTemplate {
  const factory TaskTemplate({
    required String id,
    required String name,
    required String description,
    required TaskCategory category,
    required int estimatedHours,
    required List<String> steps,
    Map<String, dynamic>? defaultMetadata,
  }) = _TaskTemplate;

  factory TaskTemplate.fromJson(Map<String, dynamic> json) => _$TaskTemplateFromJson(json);
} 