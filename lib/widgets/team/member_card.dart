import 'package:flutter/material.dart';
import '../../models/member.dart';
import '../../utils/colors.dart';

class MemberCard extends StatelessWidget {
  final Member member;
  final VoidCallback? onTap;

  const MemberCard({super.key, required this.member, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: PerseveranceColors.buttonFill.withValues(alpha: 0.2),
                child: Text(
                  member.name[0],
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: PerseveranceColors.primaryButtonText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      member.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: PerseveranceColors.primaryButtonText,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      member.roleDisplay,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: PerseveranceColors.secondaryButtonText.withValues(alpha: 0.7),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: member.statusColor,
                        size: 12,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        member.statusText,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: member.statusColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 14,
                        color: PerseveranceColors.secondaryButtonText.withValues(alpha: 0.6),
                      ),
                      const SizedBox(width: 2),
                      Text(
                        '${member.hoursLogged.toStringAsFixed(1)}h',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: PerseveranceColors.secondaryButtonText.withValues(alpha: 0.6),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
} 