import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import '../utils/colors.dart';
import '../models/appwrite/team_model.dart';
import '../models/appwrite/match_model.dart';
import '../widgets/scout/live_match_widget.dart';
import '../widgets/scout/team_database_widget.dart';
import '../widgets/scout/alliance_recommendations_widget.dart';

class ScoutScreen extends StatefulWidget {
  const ScoutScreen({super.key});

  @override
  State<ScoutScreen> createState() => _ScoutScreenState();
}

class _ScoutScreenState extends State<ScoutScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  Timer? _matchTimer;
  int _matchTimeSeconds = 0;
  bool _isMatchRunning = false;
  String _searchQuery = '';
  TeamRegion? _selectedRegion;
  MatchPhase _currentPhase = MatchPhase.autonomous;
  AllianceColor _allianceColor = AllianceColor.red;

  // Match scoring data
  final Map<String, int> _scores = {
    'autonomous': 0,
    'driverControlled': 0,
    'endgame': 0,
  };

  final Map<String, dynamic> _matchData = {
    'autonomous': {},
    'driverControlled': {},
    'endgame': {},
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _matchTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Scout',
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
            Tab(icon: Icon(Icons.sports_esports), text: 'Live Match'),
            Tab(icon: Icon(Icons.search), text: 'Team Database'),
            Tab(icon: Icon(Icons.group), text: 'Alliances'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          const LiveMatchWidget(),
          const TeamDatabaseWidget(),
          const AllianceRecommendationsWidget(),
        ],
      ),
    );
  }

  Widget _buildLiveMatchTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Match Timer and Controls
          _buildMatchTimer(),
          const SizedBox(height: 24),
          
          // Alliance Selection
          _buildAllianceSelection(),
          const SizedBox(height: 24),
          
          // Phase Selection
          _buildPhaseSelection(),
          const SizedBox(height: 24),
          
          // Scoring Interface
          _buildScoringInterface(),
          const SizedBox(height: 24),
          
          // Quick Actions
          _buildQuickActions(),
          const SizedBox(height: 24),
          
          // Notes Section
          _buildNotesSection(),
        ],
      ),
    );
  }

  Widget _buildMatchTimer() {
    final minutes = _matchTimeSeconds ~/ 60;
    final seconds = _matchTimeSeconds % 60;
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Match Timer',
              style: TextStyle(
                color: PerseveranceColors.buttonFill,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
              style: TextStyle(
                color: PerseveranceColors.primaryButtonText,
                fontWeight: FontWeight.w700,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: _isMatchRunning ? _pauseMatch : _startMatch,
                  icon: Icon(_isMatchRunning ? Icons.pause : Icons.play_arrow),
                  label: Text(_isMatchRunning ? 'Pause' : 'Start'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isMatchRunning ? Colors.orange : Colors.green,
                    foregroundColor: Colors.white,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: _resetMatch,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Reset'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAllianceSelection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Alliance Color',
              style: TextStyle(
                color: PerseveranceColors.buttonFill,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<AllianceColor>(
                    title: Text(
                      'Red Alliance',
                      style: TextStyle(color: Colors.red),
                    ),
                    value: AllianceColor.red,
                    groupValue: _allianceColor,
                    onChanged: (value) {
                      setState(() {
                        _allianceColor = value!;
                      });
                    },
                    activeColor: PerseveranceColors.buttonFill,
                  ),
                ),
                Expanded(
                  child: RadioListTile<AllianceColor>(
                    title: Text(
                      'Blue Alliance',
                      style: TextStyle(color: Colors.blue),
                    ),
                    value: AllianceColor.blue,
                    groupValue: _allianceColor,
                    onChanged: (value) {
                      setState(() {
                        _allianceColor = value!;
                      });
                    },
                    activeColor: PerseveranceColors.buttonFill,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhaseSelection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Match Phase',
              style: TextStyle(
                color: PerseveranceColors.buttonFill,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            SegmentedButton<MatchPhase>(
              segments: MatchPhase.values.map((phase) => ButtonSegment(
                value: phase,
                label: Text(phase.displayName),
              )).toList(),
              selected: {_currentPhase},
              onSelectionChanged: (Set<MatchPhase> selection) {
                setState(() {
                  _currentPhase = selection.first;
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) {
                    if (states.contains(MaterialState.selected)) {
                      return PerseveranceColors.buttonFill;
                    }
                    return PerseveranceColors.background;
                  },
                ),
                foregroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) {
                    if (states.contains(MaterialState.selected)) {
                      return PerseveranceColors.primaryButtonText;
                    }
                    return PerseveranceColors.secondaryText;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScoringInterface() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Scoring - ${_currentPhase.displayName}',
              style: TextStyle(
                color: PerseveranceColors.buttonFill,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildScoreCard('Goals Scored', 'goals', 0, 10),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildScoreCard('Rings Collected', 'rings', 0, 20),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildScoreCard('Climbs', 'climbs', 0, 5),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildScoreCard('Parks', 'parks', 0, 3),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Total Score: ${_scores[_currentPhase.name] ?? 0}',
              style: TextStyle(
                color: PerseveranceColors.primaryButtonText,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreCard(String title, String key, int min, int max) {
    final currentValue = _matchData[_currentPhase.name]?[key] ?? 0;
    
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: PerseveranceColors.background.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: PerseveranceColors.secondaryText.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: PerseveranceColors.secondaryText,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '$currentValue',
            style: TextStyle(
              color: PerseveranceColors.buttonFill,
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => _updateScore(key, -1, min),
                icon: const Icon(Icons.remove_circle_outline),
                color: PerseveranceColors.secondaryText,
              ),
              IconButton(
                onPressed: () => _updateScore(key, 1, max),
                icon: const Icon(Icons.add_circle_outline),
                color: PerseveranceColors.buttonFill,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quick Actions',
              style: TextStyle(
                color: PerseveranceColors.buttonFill,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildQuickActionButton('Climb', Icons.trending_up, () => _quickAction('climb')),
                _buildQuickActionButton('Park', Icons.local_parking, () => _quickAction('park')),
                _buildQuickActionButton('Score', Icons.sports_soccer, () => _quickAction('score')),
                _buildQuickActionButton('Foul', Icons.warning, () => _quickAction('foul')),
                _buildQuickActionButton('Technical', Icons.build, () => _quickAction('technical')),
                _buildQuickActionButton('Yellow Card', Icons.warning_amber, () => _quickAction('yellow')),
                _buildQuickActionButton('Red Card', Icons.block, () => _quickAction('red')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionButton(String label, IconData icon, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 16),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: PerseveranceColors.buttonFill,
        foregroundColor: PerseveranceColors.primaryButtonText,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }

  Widget _buildNotesSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Match Notes',
              style: TextStyle(
                color: PerseveranceColors.buttonFill,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Enter match observations, strategies, or notes...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: PerseveranceColors.background.withOpacity(0.1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamDatabaseTab() {
    final teamsAsync = ref.watch(teamsProvider);
    return AsyncValueWidget(
      value: teamsAsync,
      builder: (teams) => Column(
        children: [
          // Search and filter
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search teams by name or number...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: PerseveranceColors.background.withOpacity(0.1),
                  ),
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<TeamRegion>(
                  value: _selectedRegion,
                  decoration: const InputDecoration(
                    labelText: 'Filter by Region',
                    border: OutlineInputBorder(),
                  ),
                  items: [
                    const DropdownMenuItem<TeamRegion>(
                      value: null,
                      child: Text('All Regions'),
                    ),
                    ...TeamRegion.values.map((region) => DropdownMenuItem(
                      value: region,
                      child: Text(region.displayName),
                    )),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedRegion = value;
                    });
                  },
                ),
              ],
            ),
          ),
          
          // Teams list
          Expanded(
            child: ListView.builder(
              itemCount: teams.length,
              itemBuilder: (context, index) {
                final team = teams[index];
                return _buildTeamCard(team);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamCard(Map<String, dynamic> team) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: PerseveranceColors.buttonFill,
          child: Text(
            team['teamNumber'],
            style: TextStyle(
              color: PerseveranceColors.primaryButtonText,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        title: Text(
          team['name'],
          style: TextStyle(
            color: PerseveranceColors.buttonFill,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Team ${team['teamNumber']} • ${team['region']}',
              style: TextStyle(
                color: PerseveranceColors.secondaryText,
              ),
            ),
            if (team['school'] != null)
              Text(
                team['school'],
                style: TextStyle(
                  color: PerseveranceColors.secondaryText,
                ),
              ),
          ],
        ),
        trailing: IconButton(
          onPressed: () => _viewTeamDetails(team),
          icon: const Icon(Icons.arrow_forward_ios),
          color: PerseveranceColors.secondaryText,
        ),
        onTap: () => _viewTeamDetails(team),
      ),
    );
  }

  Widget _buildAlliancesTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Alliance Partner Recommendations
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recommended Alliance Partners',
                    style: TextStyle(
                      color: PerseveranceColors.buttonFill,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ..._getAllianceRecommendations().map((recommendation) => 
                    _buildAllianceRecommendationCard(recommendation),
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Compatibility Analysis
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Compatibility Analysis',
                    style: TextStyle(
                      color: PerseveranceColors.buttonFill,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildCompatibilityChart(),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Strategy Notes
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alliance Strategy Notes',
                    style: TextStyle(
                      color: PerseveranceColors.buttonFill,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    maxLines: 6,
                    decoration: InputDecoration(
                      hintText: 'Enter alliance strategy notes, strengths, weaknesses, and recommendations...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: PerseveranceColors.background.withOpacity(0.1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAllianceRecommendationCard(Map<String, dynamic> recommendation) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: PerseveranceColors.background.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: PerseveranceColors.secondaryText.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: PerseveranceColors.buttonFill,
                child: Text(
                  recommendation['teamNumber'],
                  style: TextStyle(
                    color: PerseveranceColors.primaryButtonText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recommendation['name'],
                      style: TextStyle(
                        color: PerseveranceColors.buttonFill,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Compatibility: ${recommendation['compatibility']}%',
                      style: TextStyle(
                        color: PerseveranceColors.secondaryText,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _getCompatibilityColor(recommendation['compatibility']),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  recommendation['score'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            recommendation['reasoning'],
            style: TextStyle(
              color: PerseveranceColors.secondaryText,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompatibilityChart() {
    return Column(
      children: [
        _buildCompatibilityBar('Team 1234', 85),
        const SizedBox(height: 8),
        _buildCompatibilityBar('Team 5678', 72),
        const SizedBox(height: 8),
        _buildCompatibilityBar('Team 9012', 68),
        const SizedBox(height: 8),
        _buildCompatibilityBar('Team 3456', 45),
      ],
    );
  }

  Widget _buildCompatibilityBar(String teamName, int compatibility) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              teamName,
              style: TextStyle(
                color: PerseveranceColors.secondaryText,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '$compatibility%',
              style: TextStyle(
                color: PerseveranceColors.buttonFill,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        LinearProgressIndicator(
          value: compatibility / 100,
          backgroundColor: PerseveranceColors.secondaryText.withOpacity(0.2),
          valueColor: AlwaysStoppedAnimation<Color>(_getCompatibilityColor(compatibility)),
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }

  // Helper methods
  void _startMatch() {
    setState(() {
      _isMatchRunning = true;
    });
    _matchTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _matchTimeSeconds++;
      });
    });
  }

  void _pauseMatch() {
    setState(() {
      _isMatchRunning = false;
    });
    _matchTimer?.cancel();
  }

  void _resetMatch() {
    setState(() {
      _matchTimeSeconds = 0;
      _isMatchRunning = false;
      _scores.clear();
      _matchData.clear();
    });
    _matchTimer?.cancel();
  }

  void _updateScore(String key, int delta, int max) {
    setState(() {
      final currentValue = _matchData[_currentPhase.name]?[key] ?? 0;
      final newValue = (currentValue + delta).clamp(0, max);
      
      if (_matchData[_currentPhase.name] == null) {
        _matchData[_currentPhase.name] = {};
      }
      _matchData[_currentPhase.name]![key] = newValue;
      
      // Update total score
      _scores[_currentPhase.name] = _matchData[_currentPhase.name]!.values
          .whereType<int>()
          .fold(0, (sum, value) => sum + value);
    });
  }

  void _quickAction(String action) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Quick action: $action'),
        backgroundColor: PerseveranceColors.buttonFill,
      ),
    );
  }

  void _viewTeamDetails(Map<String, dynamic> team) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Team ${team['teamNumber']}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${team['name']}'),
            Text('Region: ${team['region']}'),
            if (team['school'] != null) Text('School: ${team['school']}'),
            const SizedBox(height: 16),
            Text(
              'Performance Metrics:',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Text('Average Score: ${team['avgScore'] ?? 'N/A'}'),
            Text('Win Rate: ${team['winRate'] ?? 'N/A'}'),
            const SizedBox(height: 16),
            Text(
              'Strengths:',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            ...(team['strengths'] as List<String>).map((s) => Text('• $s')),
            const SizedBox(height: 8),
            Text(
              'Weaknesses:',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            ...(team['weaknesses'] as List<String>).map((w) => Text('• $w')),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  Color _getCompatibilityColor(int compatibility) {
    if (compatibility >= 80) return Colors.green;
    if (compatibility >= 60) return Colors.orange;
    return Colors.red;
  }
} 