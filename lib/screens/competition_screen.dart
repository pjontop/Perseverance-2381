import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/colors.dart';
import '../widgets/competition/event_calendar_widget.dart';
import '../widgets/competition/checklist_widget.dart';
import '../widgets/competition/live_dashboard_widget.dart';
import '../widgets/competition/post_competition_widget.dart';
import '../widgets/custom_button.dart';

class CompetitionScreen extends ConsumerStatefulWidget {
  const CompetitionScreen({super.key});

  @override
  ConsumerState<CompetitionScreen> createState() => _CompetitionScreenState();
}

class _CompetitionScreenState extends ConsumerState<CompetitionScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Competition',
          style: TextStyle(
            color: PerseveranceColors.buttonFill,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: PerseveranceColors.background,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: PerseveranceColors.buttonFill,
          labelColor: PerseveranceColors.buttonFill,
          unselectedLabelColor: PerseveranceColors.secondaryText,
          tabs: const [
            Tab(icon: Icon(Icons.calendar_today), text: 'Events'),
            Tab(icon: Icon(Icons.checklist), text: 'Checklists'),
            Tab(icon: Icon(Icons.dashboard), text: 'Live'),
            Tab(icon: Icon(Icons.analytics), text: 'Analysis'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          EventCalendarWidget(),
          ChecklistWidget(),
          LiveDashboardWidget(),
          PostCompetitionWidget(),
        ],
      ),
    );
  }
} 