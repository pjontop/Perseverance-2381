import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as appwrite_models;
import '../models/event.dart';
import '../models/task.dart';
import '../models/build_log.dart';
import '../utils/colors.dart';
import '../widgets/dashboard/upcoming_events_card.dart';
import '../widgets/dashboard/recent_builds_card.dart';
import '../widgets/dashboard/tasks_summary_card.dart';
import '../widgets/dashboard/team_performance_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/app_providers.dart';
import '../providers/app_providers.dart';
import 'competition_screen.dart';
import 'build_screen.dart';
import 'team_screen.dart';
import 'analytics_screen.dart';

/// Dashboard Screen
/// 
/// The main dashboard screen for the VEX Robotics Team Perseverance app.
/// Shows team overview, quick stats, and recent activities.
class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final teamId = (authState.valueOrNull?.teamId ?? '');
    final eventsAsync = ref.watch(teamEventsProvider(teamId));
    final buildsAsync = ref.watch(teamBuildLogsProvider(teamId));
    final tasksAsync = ref.watch(teamTasksProvider(teamId));
    final statsAsync = ref.watch(_teamStatsProvider(teamId));

    return Scaffold(
      backgroundColor: PerseveranceColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              _buildWelcomeHeader(context),
              const SizedBox(height: 32),
              // Upcoming Events Card
              AsyncValueWidget(
                value: eventsAsync,
                builder: (events) => UpcomingEventsCard(
                  events: events,
                  onViewAll: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CompetitionScreen()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              // Recent Build Progress Card
              AsyncValueWidget(
                value: buildsAsync,
                builder: (builds) => RecentBuildsCard(
                  builds: builds,
                  onViewAll: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BuildScreen()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              // Active Tasks Summary Card
              AsyncValueWidget(
                value: tasksAsync,
                builder: (tasks) => TasksSummaryCard(
                  tasks: tasks,
                  onViewAll: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TeamScreen()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              // Team Performance Quick Stats Card
              AsyncValueWidget(
                value: statsAsync,
                builder: (stats) => TeamPerformanceCard(
                  wins: stats['wins'],
                  losses: stats['losses'],
                  averageScore: stats['averageScore'],
                  currentRanking: stats['currentRanking'],
                  onViewDetails: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AnalyticsScreen()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the welcome header section
  Widget _buildWelcomeHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome back,',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: PerseveranceColors.secondaryText,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Team Perseverance!',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            color: PerseveranceColors.buttonFill,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Here\'s what\'s happening with your team today',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: PerseveranceColors.secondaryText.withValues(alpha: 0.8),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  // This method is not used in the current implementation
  // Team data is loaded through providers instead
}

// Providers for each collection with correct types
final teamEventsProvider = (String teamId) => FutureProvider<List<Event>>((ref) async {
  final db = ref.watch(databaseServiceProvider);
  return (await db.listDocuments(collectionId: 'events', queries: [Query.equal('teamId', teamId)])).map<Event>((e) => Event.fromJson(e)).toList();
});

final teamBuildLogsProvider = (String teamId) => FutureProvider<List<BuildLog>>((ref) async {
  final db = ref.watch(databaseServiceProvider);
  return (await db.listDocuments(collectionId: 'buildLogs')).map<BuildLog>((b) => BuildLog.fromJson(b)).toList();
});

final teamTasksProvider = (String teamId) => FutureProvider<List<Task>>((ref) async {
  final db = ref.watch(databaseServiceProvider);
  return (await db.listDocuments(collectionId: 'tasks')).map<Task>((t) => Task.fromJson(t)).toList();
});

// Helper: Provider for team stats
final _teamStatsProvider = (String teamId) => FutureProvider<Map<String, dynamic>>((ref) async {
  final db = ref.watch(databaseServiceProvider);
  final matches = await db.listDocuments(
    collectionId: 'matches',
    queries: [Query.equal('teamIds', teamId)],
  );
  int wins = 0;
  int losses = 0;
  double totalScore = 0;
  int matchCount = matches.length;
  for (final match in matches) {
    final scores = match['scores'] ?? {};
    final allianceColor = match['allianceColor'];
    final teamScore = scores[allianceColor] ?? 0;
    final opponentColor = allianceColor == 'red' ? 'blue' : 'red';
    final opponentScore = scores[opponentColor] ?? 0;
    if (teamScore > opponentScore) {
      wins++;
    } else if (teamScore < opponentScore) {
      losses++;
    }
    totalScore += teamScore.toDouble();
  }
  final averageScore = matchCount > 0 ? totalScore / matchCount : 0;
  // Ranking logic can be more complex; for now, just use win count as a proxy
  final currentRanking = wins + 1;
  return {
    'wins': wins,
    'losses': losses,
    'averageScore': averageScore,
    'currentRanking': currentRanking,
  };
});

// AsyncValueWidget for loading/error/data
class AsyncValueWidget<T> extends StatelessWidget {
  final AsyncValue<T> value;
  final Widget Function(T data) builder;
  const AsyncValueWidget({required this.value, required this.builder, super.key});
  @override
  Widget build(BuildContext context) {
    return value.when(
      data: builder,
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
    );
  }
} 