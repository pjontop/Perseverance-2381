import 'package:flutter/material.dart';
import '../utils/colors.dart';
import 'scout_screen.dart';
import 'competition_screen.dart';
import 'analytics_screen.dart';

/// Games Screen
/// 
/// A tabbed interface containing Scout, Competition, and Analytics screens
/// for the VEX Robotics Team Perseverance app.
class GamesScreen extends StatefulWidget {
  const GamesScreen({super.key});

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: PerseveranceColors.surface,
            child: TabBar(
              controller: _tabController,
              labelColor: PerseveranceColors.primary,
              unselectedLabelColor: PerseveranceColors.onSurface.withOpacity(0.6),
              indicatorColor: PerseveranceColors.primary,
              indicatorWeight: 3,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
              tabs: const [
                Tab(
                  icon: Icon(Icons.track_changes),
                  text: 'Scout',
                ),
                Tab(
                  icon: Icon(Icons.emoji_events),
                  text: 'Competition',
                ),
                Tab(
                  icon: Icon(Icons.analytics),
                  text: 'Analytics',
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                ScoutScreen(),
                CompetitionScreen(),
                AnalyticsScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 