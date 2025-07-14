import 'package:flutter/material.dart';
import '../../utils/colors.dart';

/// Team Performance Card Widget
/// 
/// Displays team performance statistics in a Material Design 3 card format.
class TeamPerformanceCard extends StatelessWidget {
  final int wins;
  final int losses;
  final double averageScore;
  final int currentRanking;
  final VoidCallback? onViewDetails;

  const TeamPerformanceCard({
    super.key,
    required this.wins,
    required this.losses,
    required this.averageScore,
    required this.currentRanking,
    this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    final totalMatches = wins + losses;
    final winRate = totalMatches > 0 ? (wins / totalMatches) * 100 : 0;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.emoji_events,
                  color: PerseveranceColors.background,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  'Team Performance',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: PerseveranceColors.primaryButtonText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                if (onViewDetails != null)
                  TextButton(
                    onPressed: onViewDetails,
                    child: Text(
                      'Details',
                      style: TextStyle(
                        color: PerseveranceColors.background,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 20),
            
            // Performance Stats
            Row(
              children: [
                Expanded(
                  child: _buildStatItem(
                    context,
                    label: 'Wins',
                    value: wins.toString(),
                    color: Colors.green,
                    icon: Icons.check_circle,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildStatItem(
                    context,
                    label: 'Losses',
                    value: losses.toString(),
                    color: Colors.red,
                    icon: Icons.cancel,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildStatItem(
                    context,
                    label: 'Win Rate',
                    value: '${winRate.round()}%',
                    color: PerseveranceColors.background,
                    icon: Icons.trending_up,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            
            // Average Score and Ranking
            Row(
              children: [
                Expanded(
                  child: _buildStatItem(
                    context,
                    label: 'Avg Score',
                    value: averageScore.toStringAsFixed(1),
                    color: PerseveranceColors.buttonFill,
                    icon: Icons.score,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildStatItem(
                    context,
                    label: 'Ranking',
                    value: '#$currentRanking',
                    color: PerseveranceColors.secondaryButtonText,
                    icon: Icons.leaderboard,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            
            // Performance Chart Placeholder
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: PerseveranceColors.secondaryText.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: PerseveranceColors.background.withValues(alpha: 0.1),
                  width: 1,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.analytics,
                      size: 32,
                      color: PerseveranceColors.secondaryButtonText.withValues(alpha: 0.5),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Performance Chart',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: PerseveranceColors.secondaryButtonText.withValues(alpha: 0.7),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: 24,
          ),
          const SizedBox(height: 8),
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
} 