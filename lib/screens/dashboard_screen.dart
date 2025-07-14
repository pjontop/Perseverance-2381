import 'package:flutter/material.dart';
import '../models/event.dart';
import '../models/task.dart';
import '../models/build_log.dart';
import '../utils/colors.dart';
import '../widgets/dashboard/upcoming_events_card.dart';
import '../widgets/dashboard/recent_builds_card.dart';
import '../widgets/dashboard/tasks_summary_card.dart';
import '../widgets/dashboard/team_performance_card.dart';

/// Dashboard Screen
/// 
/// The main dashboard screen for the VEX Robotics Team Perseverance app.
/// Shows team overview, quick stats, and recent activities.
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PerseveranceColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              
              // Welcome Header
              _buildWelcomeHeader(context),
              const SizedBox(height: 32),
              
              // Upcoming Events Card
              UpcomingEventsCard(
                events: _getPlaceholderEvents(),
                onViewAll: () {
                  // TODO: Navigate to events screen
                },
              ),
              const SizedBox(height: 24),
              
              // Recent Build Progress Card
              RecentBuildsCard(
                builds: _getPlaceholderBuilds(),
                onViewAll: () {
                  // TODO: Navigate to builds screen
                },
              ),
              const SizedBox(height: 24),
              
              // Active Tasks Summary Card
              TasksSummaryCard(
                tasks: _getPlaceholderTasks(),
                onViewAll: () {
                  // TODO: Navigate to tasks screen
                },
              ),
              const SizedBox(height: 24),
              
              // Team Performance Quick Stats Card
              TeamPerformanceCard(
                wins: 12,
                losses: 3,
                averageScore: 85.5,
                currentRanking: 5,
                onViewDetails: () {
                  // TODO: Navigate to performance details
                },
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

  /// Returns placeholder events data
  List<Event> _getPlaceholderEvents() {
    final now = DateTime.now();
    return [
      Event(
        id: '1',
        title: 'VEX State Championship',
        description: 'State level competition for VEX Robotics',
        dateTime: now.add(const Duration(days: 2)),
        location: 'Convention Center, Downtown',
        type: EventType.competition,
      ),
      Event(
        id: '2',
        title: 'Team Strategy Meeting',
        description: 'Weekly team meeting to discuss competition strategy',
        dateTime: now.add(const Duration(days: 1)),
        location: 'School Robotics Lab',
        type: EventType.meeting,
      ),
      Event(
        id: '3',
        title: 'Robot Testing Session',
        description: 'Testing and debugging robot systems',
        dateTime: now.add(const Duration(days: 3)),
        location: 'School Gymnasium',
        type: EventType.practice,
      ),
      Event(
        id: '4',
        title: 'Programming Workshop',
        description: 'Advanced programming techniques for VEX',
        dateTime: now.add(const Duration(days: 7)),
        location: 'Computer Lab',
        type: EventType.workshop,
      ),
    ];
  }

  /// Returns placeholder build logs data
  List<BuildLog> _getPlaceholderBuilds() {
    final now = DateTime.now();
    return [
      BuildLog(
        id: '1',
        title: 'Drive Train Assembly',
        description: 'Completed assembly of the main drive train system',
        date: now.subtract(const Duration(days: 1)),
        status: BuildStatus.completed,
        progress: 1.0,
        author: 'Mike Rodriguez',
        tags: ['Mechanical', 'Drive Train'],
        robotVersion: 'V1',
      ),
      BuildLog(
        id: '2',
        title: 'Lift Mechanism',
        description: 'Working on the lift mechanism for game objects',
        date: now.subtract(const Duration(hours: 6)),
        status: BuildStatus.inProgress,
        progress: 0.75,
        author: 'Sarah Chen',
        tags: ['Mechanical', 'Lift'],
        robotVersion: 'V2',
      ),
      BuildLog(
        id: '3',
        title: 'Autonomous Programming',
        description: 'Developing autonomous routines for competition',
        date: now.subtract(const Duration(hours: 2)),
        status: BuildStatus.testing,
        progress: 0.6,
        author: 'Alex Johnson',
        tags: ['Programming', 'Autonomous'],
        robotVersion: 'V3',
      ),
      BuildLog(
        id: '4',
        title: 'Sensor Integration',
        description: 'Integrating various sensors for better robot control',
        date: now,
        status: BuildStatus.inProgress,
        progress: 0.3,
        author: 'Emma Wilson',
        tags: ['Electronics', 'Sensors'],
        robotVersion: 'V3',
      ),
    ];
  }

  /// Returns placeholder tasks data
  List<Task> _getPlaceholderTasks() {
    final now = DateTime.now();
    return [
      Task(
        id: '1',
        title: 'Complete Robot Testing',
        description: 'Test all robot systems before competition',
        dueDate: now.add(const Duration(days: 1)),
        priority: TaskPriority.high,
        status: TaskStatus.inProgress,
        assignedTo: 'Mike Rodriguez',
        category: TaskCategory.build,
      ),
      Task(
        id: '2',
        title: 'Update Competition Strategy',
        description: 'Review and update team strategy based on recent matches',
        dueDate: now.add(const Duration(days: 2)),
        priority: TaskPriority.medium,
        status: TaskStatus.notStarted,
        assignedTo: 'Sarah Chen',
        category: TaskCategory.documentation,
      ),
      Task(
        id: '3',
        title: 'Prepare Competition Materials',
        description: 'Gather all necessary materials for the upcoming competition',
        dueDate: now.add(const Duration(days: 1)),
        priority: TaskPriority.high,
        status: TaskStatus.notStarted,
        assignedTo: 'Alex Johnson',
        category: TaskCategory.other,
      ),
      Task(
        id: '4',
        title: 'Review Match Videos',
        description: 'Analyze recent match videos for improvement opportunities',
        dueDate: now.subtract(const Duration(days: 1)),
        priority: TaskPriority.low,
        status: TaskStatus.completed,
        assignedTo: 'Emma Wilson',
        completedAt: now.subtract(const Duration(hours: 2)),
        category: TaskCategory.documentation,
      ),
      Task(
        id: '5',
        title: 'Update Team Website',
        description: 'Update team website with latest achievements',
        dueDate: now.subtract(const Duration(days: 2)),
        priority: TaskPriority.medium,
        status: TaskStatus.notStarted,
        assignedTo: 'Alex Johnson',
        category: TaskCategory.documentation,
      ),
    ];
  }
} 