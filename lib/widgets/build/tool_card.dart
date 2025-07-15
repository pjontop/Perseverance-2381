import 'package:flutter/material.dart';
import '../../models/tool.dart';
import '../../utils/colors.dart';

class ToolCard extends StatelessWidget {
  final Tool tool;
  final VoidCallback? onTap;
  final VoidCallback? onCheckout;
  final VoidCallback? onReturn;
  final VoidCallback? onEdit;

  const ToolCard({
    super.key,
    required this.tool,
    this.onTap,
    this.onCheckout,
    this.onReturn,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with name, status, and action buttons
              Row(
                children: [
                  Icon(
                    _getToolIcon(),
                    size: 20,
                    color: PerseveranceColors.buttonFill,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tool.name,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: PerseveranceColors.buttonFill,
                          ),
                        ),
                        Text(
                          tool.description,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: PerseveranceColors.secondaryText,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: tool.status.color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: tool.status.color,
                        width: 1,
                      ),
                    ),
                    child: Text(
                      tool.status.displayName,
                      style: TextStyle(
                        color: tool.status.color,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 12),
              
              // Checkout information
              if (tool.isCheckedOut) ...[
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.orange.withOpacity(0.3)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            size: 16,
                            color: Colors.orange,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Checked out by: ${tool.checkedOutBy}',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.orange,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 16,
                            color: Colors.orange,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Due back: ${tool.formattedDueDate}',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.orange,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      if (tool.overdueStatus.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          tool.overdueStatus,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: tool.isOverdue ? Colors.red : Colors.orange,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 12),
              ],
              
              // Location and maintenance info
              Row(
                children: [
                  if (tool.location != null) ...[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Location',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: PerseveranceColors.secondaryText,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            tool.location!,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: PerseveranceColors.secondaryText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  if (tool.lastMaintenance != null) ...[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Last Maintenance',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: PerseveranceColors.secondaryText,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            tool.formattedLastMaintenance,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: PerseveranceColors.secondaryText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
              
              // Action buttons
              const SizedBox(height: 12),
              Row(
                children: [
                  if (tool.isAvailable && onCheckout != null)
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: onCheckout,
                        icon: const Icon(Icons.logout, size: 16),
                        label: const Text('Check Out'),
                        style: FilledButton.styleFrom(
                          backgroundColor: PerseveranceColors.buttonFill,
                          foregroundColor: PerseveranceColors.primaryButtonText,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  if (tool.isCheckedOut && onReturn != null)
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: onReturn,
                        icon: const Icon(Icons.undo, size: 16),
                        label: const Text('Return'),
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  if (tool.needsMaintenance)
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: () {
                          // TODO: Navigate to maintenance screen
                        },
                        icon: const Icon(Icons.build, size: 16),
                        label: const Text('Maintenance'),
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  if (onEdit != null) ...[
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: onEdit,
                      icon: const Icon(Icons.edit, size: 20),
                      color: PerseveranceColors.secondaryText,
                      tooltip: 'Edit Tool',
                      semanticLabel: 'Edit Tool',
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getToolIcon() {
    final name = tool.name.toLowerCase();
    if (name.contains('drill')) return Icons.power;
    if (name.contains('screwdriver')) return Icons.build;
    if (name.contains('wrench')) return Icons.build;
    if (name.contains('saw')) return Icons.content_cut;
    if (name.contains('measure')) return Icons.straighten;
    if (name.contains('level')) return Icons.straighten;
    return Icons.build;
  }
} 