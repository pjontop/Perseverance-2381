import 'package:flutter/material.dart';
import '../../models/task.dart';
import '../../utils/colors.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onComplete;

  const TaskCard({
    super.key,
    required this.task,
    this.onTap,
    this.onEdit,
    this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(task.id),
      background: _buildSwipeAction(context, Icons.check, Colors.green, 'Complete'),
      secondaryBackground: _buildSwipeAction(context, Icons.edit, PerseveranceColors.buttonFill, 'Edit'),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd && onComplete != null) {
          onComplete!();
          return false;
        } else if (direction == DismissDirection.endToStart && onEdit != null) {
          onEdit!();
          return false;
        }
        return false;
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Container(
                  width: 6,
                  height: 48,
                  decoration: BoxDecoration(
                    color: task.priority.color,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            task.title,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: PerseveranceColors.primaryButtonText,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: task.priority.color.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(8),
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
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: _statusColor(task.status).withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        task.status.displayName,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: _statusColor(task.status),
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      task.category.name[0].toUpperCase() + task.category.name.substring(1),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: PerseveranceColors.secondaryButtonText.withValues(alpha: 0.7),
                        fontWeight: FontWeight.w500,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSwipeAction(BuildContext context, IconData icon, Color color, String label) {
    return Container(
      alignment: icon == Icons.check ? Alignment.centerLeft : Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      color: color.withValues(alpha: 0.15),
      child: Row(
        mainAxisAlignment: icon == Icons.check ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(width: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Color _statusColor(TaskStatus status) {
    switch (status) {
      case TaskStatus.notStarted:
        return Colors.grey;
      case TaskStatus.inProgress:
        return PerseveranceColors.background;
      case TaskStatus.review:
        return PerseveranceColors.buttonFill;
      case TaskStatus.completed:
        return Colors.green;
    }
  }
} 