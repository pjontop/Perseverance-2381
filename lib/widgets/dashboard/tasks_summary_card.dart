import 'package:flutter/material.dart';
import '../../models/task.dart';
import '../../utils/colors.dart';

/// Tasks Summary Card Widget
/// 
/// Displays task summary and quick task list in a Material Design 3 card format.
class TasksSummaryCard extends StatelessWidget {
  final List<Task> tasks;
  final VoidCallback? onViewAll;

  const TasksSummaryCard({
    super.key,
    required this.tasks,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    final totalTasks = tasks.length;
    final completedTasks = tasks.where((task) => task.status == TaskStatus.completed).length;
    final overdueTasks = tasks.where((task) => task.isOverdue).length;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.task,
                  color: PerseveranceColors.background,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  'Active Tasks',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: PerseveranceColors.primaryButtonText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                if (onViewAll != null)
                  FilledButton(
                    onPressed: onViewAll,
                    child: const Text('View All'),
                    style: FilledButton.styleFrom(
                      backgroundColor: PerseveranceColors.buttonFill,
                      foregroundColor: PerseveranceColors.primaryButtonText,
                    ),
                    autofocus: true,
                    // Add tooltip and semantics label
                    tooltip: 'View all tasks',
                    semanticsLabel: 'View all tasks',
                  ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Task Summary Stats
            Row(
              children: [
                Expanded(
                  child: _buildStatItem(
                    context,
                    label: 'Total',
                    value: totalTasks.toString(),
                    color: PerseveranceColors.background,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildStatItem(
                    context,
                    label: 'Completed',
                    value: completedTasks.toString(),
                    color: Colors.green,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildStatItem(
                    context,
                    label: 'Overdue',
                    value: overdueTasks.toString(),
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            
            // Progress Bar
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Progress',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: PerseveranceColors.secondaryButtonText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '${totalTasks > 0 ? ((completedTasks / totalTasks) * 100).round() : 0}%',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: PerseveranceColors.background,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: totalTasks > 0 ? completedTasks / totalTasks : 0,
                  backgroundColor: PerseveranceColors.background.withValues(alpha: 0.2),
                  valueColor: AlwaysStoppedAnimation<Color>(PerseveranceColors.background),
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            ),
            const SizedBox(height: 20),
            
            // Quick Task List
            Text(
              'Priority Tasks',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: PerseveranceColors.primaryButtonText,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            if (tasks.isEmpty)
              _buildEmptyState(context)
            else
              ...tasks
                  .where((task) => task.status != TaskStatus.completed)
                  .take(3)
                  .map((task) => _buildTaskItem(context, task)),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context, {
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: color.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Icon(
            Icons.task_alt,
            size: 48,
            color: PerseveranceColors.secondaryButtonText.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 12),
          Text(
            'No active tasks',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: PerseveranceColors.secondaryButtonText.withValues(alpha: 0.7),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskItem(BuildContext context, Task task) {
    final isOverdue = task.isOverdue;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isOverdue 
            ? Colors.red.withValues(alpha: 0.1)
            : PerseveranceColors.secondaryText.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isOverdue 
              ? Colors.red.withValues(alpha: 0.3)
              : PerseveranceColors.background.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 40,
            decoration: BoxDecoration(
              color: task.priority.color,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: PerseveranceColors.primaryButtonText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 14,
                      color: PerseveranceColors.secondaryButtonText.withValues(alpha: 0.6),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      task.assignedTo,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: PerseveranceColors.secondaryButtonText.withValues(alpha: 0.6),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Icon(
                      Icons.calendar_today,
                      size: 14,
                      color: PerseveranceColors.secondaryButtonText.withValues(alpha: 0.6),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      task.formattedDueDate,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: PerseveranceColors.secondaryButtonText.withValues(alpha: 0.6),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: task.priority.color.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              task.priority.displayName,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: task.priority.color,
                fontWeight: FontWeight.w600,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
} 