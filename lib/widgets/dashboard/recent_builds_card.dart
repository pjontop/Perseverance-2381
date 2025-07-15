import 'package:flutter/material.dart';
import '../../models/build_log.dart';
import '../../utils/colors.dart';

/// Recent Builds Card Widget
/// 
/// Displays recent build log entries in a Material Design 3 card format.
class RecentBuildsCard extends StatelessWidget {
  final List<BuildLog> builds;
  final VoidCallback? onViewAll;

  const RecentBuildsCard({
    super.key,
    required this.builds,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.engineering,
                  color: PerseveranceColors.background,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  'Recent Build Progress',
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
                    tooltip: 'View all recent builds',
                    semanticsLabel: 'View all recent builds',
                  ),
              ],
            ),
            const SizedBox(height: 16),
            if (builds.isEmpty)
              _buildEmptyState(context)
            else
              ...builds.take(3).map((build) => _buildBuildItem(context, build)),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Icon(
            Icons.engineering_outlined,
            size: 48,
            color: PerseveranceColors.secondaryButtonText.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 12),
          Text(
            'No recent builds',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: PerseveranceColors.secondaryButtonText.withValues(alpha: 0.7),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBuildItem(BuildContext context, BuildLog build) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: PerseveranceColors.secondaryText.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: PerseveranceColors.background.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: build.status.color.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.engineering,
                  color: build.status.color,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      build.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: PerseveranceColors.primaryButtonText,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      build.formattedDate,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: PerseveranceColors.secondaryButtonText,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: build.status.color.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  build.status.displayName,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: build.status.color,
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Progress',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: PerseveranceColors.secondaryButtonText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    LinearProgressIndicator(
                      value: build.progress,
                      backgroundColor: build.status.color.withValues(alpha: 0.2),
                      valueColor: AlwaysStoppedAnimation<Color>(build.status.color),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Text(
                build.progressPercentage,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: build.status.color,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.person,
                size: 16,
                color: PerseveranceColors.secondaryButtonText.withValues(alpha: 0.6),
              ),
              const SizedBox(width: 4),
              Text(
                build.author,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: PerseveranceColors.secondaryButtonText.withValues(alpha: 0.6),
                  fontWeight: FontWeight.w400,
                ),
              ),
              if (build.tags.isNotEmpty) ...[
                const SizedBox(width: 16),
                Icon(
                  Icons.label,
                  size: 16,
                  color: PerseveranceColors.secondaryButtonText.withValues(alpha: 0.6),
                ),
                const SizedBox(width: 4),
                Text(
                  build.tags.first,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: PerseveranceColors.secondaryButtonText.withValues(alpha: 0.6),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
} 