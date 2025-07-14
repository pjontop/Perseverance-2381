import 'package:flutter/material.dart';
import '../../models/build_log.dart';
import '../../utils/colors.dart';

class BuildLogCard extends StatelessWidget {
  final BuildLog buildLog;
  final VoidCallback? onTap;
  final VoidCallback? onEdit;

  const BuildLogCard({
    super.key,
    required this.buildLog,
    this.onTap,
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
              // Header with title, status, and edit button
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          buildLog.title,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: PerseveranceColors.buttonFill,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: buildLog.status.color.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: buildLog.status.color,
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                buildLog.status.displayName,
                                style: TextStyle(
                                  color: buildLog.status.color,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              buildLog.robotVersion,
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: PerseveranceColors.secondaryText,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (onEdit != null)
                    IconButton(
                      onPressed: onEdit,
                      icon: const Icon(Icons.edit, size: 20),
                      color: PerseveranceColors.secondaryText,
                    ),
                ],
              ),
              
              const SizedBox(height: 12),
              
              // Description
              Text(
                buildLog.description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: PerseveranceColors.secondaryText,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              
              const SizedBox(height: 12),
              
              // Progress bar
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Progress',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: PerseveranceColors.secondaryText,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        buildLog.progressPercentage,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: PerseveranceColors.buttonFill,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  LinearProgressIndicator(
                    value: buildLog.progress,
                    backgroundColor: PerseveranceColors.secondaryText.withOpacity(0.2),
                    valueColor: AlwaysStoppedAnimation<Color>(PerseveranceColors.buttonFill),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ],
              ),
              
              const SizedBox(height: 12),
              
              // Footer with author, date, and tags
              Row(
                children: [
                  Icon(
                    Icons.person_outline,
                    size: 16,
                    color: PerseveranceColors.secondaryText,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    buildLog.author,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: PerseveranceColors.secondaryText,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    buildLog.formattedDate,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: PerseveranceColors.secondaryText,
                    ),
                  ),
                ],
              ),
              
              if (buildLog.tags.isNotEmpty) ...[
                const SizedBox(height: 8),
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: buildLog.tags.map((tag) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: PerseveranceColors.background.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      tag,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: PerseveranceColors.secondaryText,
                        fontSize: 10,
                      ),
                    ),
                  )).toList(),
                ),
              ],
              
              // Performance metrics (if any)
              if (buildLog.performanceMetrics.isNotEmpty) ...[
                const SizedBox(height: 12),
                Text(
                  'Performance Improvements:',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: PerseveranceColors.secondaryText,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Wrap(
                  spacing: 8,
                  children: buildLog.performanceMetrics.entries.map((entry) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.green.withOpacity(0.3)),
                    ),
                    child: Text(
                      '${entry.key}: +${entry.value.toStringAsFixed(1)}%',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.green,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )).toList(),
                ),
              ],
              
              // Photo indicator
              if (buildLog.photoUrls.isNotEmpty) ...[
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(
                      Icons.photo_library,
                      size: 16,
                      color: PerseveranceColors.secondaryText,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${buildLog.photoUrls.length} photo${buildLog.photoUrls.length == 1 ? '' : 's'}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: PerseveranceColors.secondaryText,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
} 