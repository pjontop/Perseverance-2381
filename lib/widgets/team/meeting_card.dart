import 'package:flutter/material.dart';
import '../../models/meeting.dart';
import '../../utils/colors.dart';

class MeetingCard extends StatelessWidget {
  final Meeting meeting;
  final VoidCallback? onTap;

  const MeetingCard({super.key, required this.meeting, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: PerseveranceColors.buttonFill.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  meeting.typeIcon,
                  color: PerseveranceColors.primaryButtonText,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      meeting.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: PerseveranceColors.primaryButtonText,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 14,
                          color: PerseveranceColors.secondaryButtonText.withValues(alpha: 0.6),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${meeting.formattedDate} at ${meeting.formattedTime}',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: PerseveranceColors.secondaryButtonText.withValues(alpha: 0.6),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Icon(
                          Icons.location_on,
                          size: 14,
                          color: PerseveranceColors.secondaryButtonText.withValues(alpha: 0.6),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          meeting.location,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: PerseveranceColors.secondaryButtonText.withValues(alpha: 0.6),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.groups,
                          size: 14,
                          color: PerseveranceColors.secondaryButtonText.withValues(alpha: 0.6),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${meeting.attendees.length} Attendee${meeting.attendees.length == 1 ? '' : 's'}',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: PerseveranceColors.secondaryButtonText.withValues(alpha: 0.6),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: PerseveranceColors.buttonFill.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            meeting.typeDisplay,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: PerseveranceColors.buttonFill,
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 