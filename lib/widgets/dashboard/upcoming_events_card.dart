import 'package:flutter/material.dart';
import '../../models/event.dart';
import '../../utils/colors.dart';

/// Upcoming Events Card Widget
/// 
/// Displays upcoming events in a Material Design 3 card format.
class UpcomingEventsCard extends StatelessWidget {
  final List<Event> events;
  final VoidCallback? onViewAll;

  const UpcomingEventsCard({
    super.key,
    required this.events,
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
                  Icons.event,
                  color: PerseveranceColors.background,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  'Upcoming Events',
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
                    tooltip: 'View all upcoming events',
                    semanticsLabel: 'View all upcoming events',
                  ),
              ],
            ),
            const SizedBox(height: 16),
            if (events.isEmpty)
              _buildEmptyState(context)
            else
              ...events.take(3).map((event) => _buildEventItem(context, event)),
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
            Icons.event_busy,
            size: 48,
            color: PerseveranceColors.secondaryButtonText.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 12),
          Text(
            'No upcoming events',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: PerseveranceColors.secondaryButtonText.withValues(alpha: 0.7),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventItem(BuildContext context, Event event) {
    final isUrgent = event.daysUntil <= 3 && event.daysUntil >= 0;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isUrgent 
            ? PerseveranceColors.buttonFill.withValues(alpha: 0.1)
            : PerseveranceColors.secondaryText.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isUrgent 
              ? PerseveranceColors.buttonFill.withValues(alpha: 0.3)
              : PerseveranceColors.background.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: event.type.icon == Icons.emoji_events 
                  ? PerseveranceColors.buttonFill 
                  : PerseveranceColors.background,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              event.type.icon,
              color: PerseveranceColors.primaryButtonText,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: PerseveranceColors.primaryButtonText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${event.formattedDate} at ${event.formattedTime}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: PerseveranceColors.secondaryButtonText,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  event.location,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: PerseveranceColors.secondaryButtonText.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isUrgent 
                      ? PerseveranceColors.buttonFill 
                      : PerseveranceColors.background.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  event.status,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: isUrgent 
                        ? PerseveranceColors.primaryButtonText 
                        : PerseveranceColors.background,
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                event.daysUntil == 0 
                    ? 'Today'
                    : event.daysUntil == 1 
                        ? 'Tomorrow'
                        : '${event.daysUntil} days',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: isUrgent 
                      ? PerseveranceColors.buttonFill 
                      : PerseveranceColors.secondaryButtonText,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
} 