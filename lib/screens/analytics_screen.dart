import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import '../utils/colors.dart';
import '../services/haptic_service.dart';
import '../widgets/analytics/performance_trends_widget.dart';
import '../widgets/analytics/team_productivity_widget.dart';
import '../widgets/analytics/competition_intelligence_widget.dart';
import '../widgets/analytics/resource_utilization_widget.dart';
import 'settings_screen.dart';

class AnalyticsScreen extends ConsumerStatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  ConsumerState<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends ConsumerState<AnalyticsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  String _selectedPeriod = 'Last 30 Days';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      HapticService.navigation();
    });
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
          'Analytics',
          style: TextStyle(
            color: PerseveranceColors.buttonFill,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: PerseveranceColors.background,
        elevation: 0,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              HapticService.settingsChange();
              setState(() {
                _selectedPeriod = value;
              });
            },
            icon: Icon(
              Icons.filter_list,
              color: PerseveranceColors.buttonFill,
            ),
            itemBuilder: (context) => [
              'Last 7 Days',
              'Last 30 Days',
              'Last 3 Months',
              'This Season',
              'All Time',
            ].map((period) => PopupMenuItem(
              value: period,
              child: Text(period),
            )).toList(),
          ),
          IconButton(
            icon: Icon(
              Icons.settings,
              color: PerseveranceColors.buttonFill,
            ),
            onPressed: () {
              HapticService.lightTap();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: PerseveranceColors.buttonFill,
          labelColor: PerseveranceColors.buttonFill,
          unselectedLabelColor: PerseveranceColors.secondaryText,
          tabs: const [
            Tab(icon: Icon(Icons.trending_up), text: 'Performance'),
            Tab(icon: Icon(Icons.people), text: 'Team'),
            Tab(icon: Icon(Icons.psychology), text: 'Intelligence'),
            Tab(icon: Icon(Icons.inventory), text: 'Resources'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          PerformanceTrendsWidget(),
          TeamProductivityWidget(),
          CompetitionIntelligenceWidget(),
          ResourceUtilizationWidget(),
        ],
      ),
    );
  }
} 