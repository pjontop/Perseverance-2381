import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/app_providers.dart';
import '../../utils/colors.dart';
import '../../models/appwrite/match_model.dart';
import '../../models/competition/live_match_state.dart';

class LiveMatchWidget extends ConsumerStatefulWidget {
  const LiveMatchWidget({super.key});

  @override
  ConsumerState<LiveMatchWidget> createState() => _LiveMatchWidgetState();
}

class _LiveMatchWidgetState extends ConsumerState<LiveMatchWidget> {
  int _elapsedSeconds = 0;
  bool _isTimerRunning = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted && _isTimerRunning) {
        setState(() {
          _elapsedSeconds++;
        });
        _startTimer();
      }
    });
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final liveMatchState = ref.watch(liveMatchProvider);
    
    if (!liveMatchState.isLive) {
      return _buildStartMatchCard();
    }

    return Column(
      children: [
        _buildMatchHeader(liveMatchState),
        const SizedBox(height: 16),
        _buildTimerSection(),
        const SizedBox(height: 16),
        _buildScoringSection(liveMatchState),
        const SizedBox(height: 16),
        _buildQuickActions(),
        const SizedBox(height: 16),
        _buildNotesSection(liveMatchState),
        const SizedBox(height: 16),
        _buildMatchControls(liveMatchState),
      ],
    );
  }

  Widget _buildStartMatchCard() {
    return Card(
      color: PerseveranceColors.background,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Icon(
              Icons.play_circle_outline,
              size: 64,
              color: PerseveranceColors.buttonFill,
            ),
            const SizedBox(height: 16),
            Text(
              'Start Live Match',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Begin scouting a new match',
              style: TextStyle(
                fontSize: 16,
                color: PerseveranceColors.secondaryText,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: FilledButton.icon(
                    onPressed: () => _showStartMatchDialog(),
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('Start Match'),
                    style: FilledButton.styleFrom(
                      backgroundColor: PerseveranceColors.buttonFill,
                      foregroundColor: PerseveranceColors.primaryButtonText,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMatchHeader(LiveMatchState state) {
    return Card(
      color: PerseveranceColors.background,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Match ${state.currentMatch ?? "Unknown"}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: PerseveranceColors.buttonFill,
                    ),
                  ),
                  Text(
                    'LIVE MATCH',
                    style: TextStyle(
                      fontSize: 14,
                      color: PerseveranceColors.secondaryText,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.fiber_manual_record,
              color: Colors.red,
              size: 16,
            ),
            const SizedBox(width: 4),
            Text(
              'LIVE',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimerSection() {
    return Card(
      color: PerseveranceColors.background,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Match Timer',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              _formatTime(_elapsedSeconds),
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                fontFamily: 'monospace',
                color: PerseveranceColors.buttonFill,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _isTimerRunning = !_isTimerRunning;
                      if (_isTimerRunning) {
                        _startTimer();
                      }
                    });
                  },
                  icon: Icon(
                    _isTimerRunning ? Icons.pause : Icons.play_arrow,
                    color: PerseveranceColors.buttonFill,
                  ),
                  tooltip: _isTimerRunning ? 'Pause Timer' : 'Start Timer',
                  semanticsLabel: _isTimerRunning ? 'Pause Timer' : 'Start Timer',
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _elapsedSeconds = 0;
                      _isTimerRunning = false;
                    });
                  },
                  icon: Icon(
                    Icons.refresh,
                    color: PerseveranceColors.buttonFill,
                  ),
                  tooltip: 'Reset Timer',
                  semanticsLabel: 'Reset Timer',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScoringSection(LiveMatchState state) {
    return Card(
      color: PerseveranceColors.background,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Scoring',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
            const SizedBox(height: 12),
            _buildScoreCard('Autonomous', 'autonomous_score'),
            const SizedBox(height: 8),
            _buildScoreCard('Driver Controlled', 'driver_score'),
            const SizedBox(height: 8),
            _buildScoreCard('Endgame', 'endgame_score'),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreCard(String title, String key) {
    final currentScore = 0; // TODO: Get from state.matchData
    
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              color: PerseveranceColors.buttonFill,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            _updateScore(key, (currentScore - 1).clamp(0, 10));
          },
          icon: Icon(Icons.remove),
          color: PerseveranceColors.buttonFill,
          tooltip: 'Decrease Score',
          semanticsLabel: 'Decrease Score',
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: PerseveranceColors.buttonFill,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              currentScore.toString(),
              style: TextStyle(
                color: PerseveranceColors.primaryButtonText,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            _updateScore(key, (currentScore + 1).clamp(0, 10));
          },
          icon: Icon(Icons.add),
          color: PerseveranceColors.buttonFill,
          tooltip: 'Increase Score',
          semanticsLabel: 'Increase Score',
        ),
      ],
    );
  }

  Widget _buildQuickActions() {
    return Card(
      color: PerseveranceColors.background,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quick Actions',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildActionButton('Goal Scored', Icons.sports_soccer),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildActionButton('Foul', Icons.warning),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildActionButton('Timeout', Icons.timer),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(String label, IconData icon) {
    return FilledButton.icon(
      onPressed: () {
        _addNote('$label action recorded');
      },
      icon: Icon(icon, size: 16),
      label: Text(label, style: TextStyle(fontSize: 12)),
      style: FilledButton.styleFrom(
        backgroundColor: PerseveranceColors.buttonFill,
        foregroundColor: PerseveranceColors.primaryButtonText,
        padding: const EdgeInsets.symmetric(vertical: 8),
      ),
    );
  }

  Widget _buildNotesSection(LiveMatchState state) {
    return Card(
      color: PerseveranceColors.background,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notes',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                hintText: 'Add match notes...',
                hintStyle: TextStyle(color: PerseveranceColors.secondaryText),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: PerseveranceColors.buttonFill),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: PerseveranceColors.buttonFill, width: 2),
                ),
              ),
              style: TextStyle(color: PerseveranceColors.buttonFill),
              onChanged: (value) {
                _addNote(value);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMatchControls(LiveMatchState state) {
    return Card(
      color: PerseveranceColors.background,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {
                  _endMatch();
                },
                icon: const Icon(Icons.stop),
                label: const Text('End Match'),
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showStartMatchDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Start Match',
          style: TextStyle(color: PerseveranceColors.buttonFill),
        ),
        content: Text(
          'Choose your alliance color:',
          style: TextStyle(color: PerseveranceColors.buttonFill),
        ),
        actions: [
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              _startMatch('Q1', 'red');
            },
            style: FilledButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Red Alliance'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              _startMatch('Q1', 'blue');
            },
            style: FilledButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            child: const Text('Blue Alliance'),
          ),
        ],
      ),
    );
  }

  void _updatePhase(MatchPhase phase) {
    if (mounted) {
      ref.read(liveMatchProvider.notifier).updateMatchData({'currentPhase': phase.name});
    }
  }

  void _updateScore(String category, int newScore) {
    if (mounted) {
      ref.read(liveMatchProvider.notifier).updateMatchData({category: newScore});
    }
  }

  void _addNote(String note) {
    if (mounted) {
      ref.read(liveMatchProvider.notifier).updateMatchData({'notes': note});
    }
  }

  void _endMatch() {
    if (mounted) {
      ref.read(liveMatchProvider.notifier).endLiveMatch();
    }
  }

  void _startMatch(String matchId, String allianceColor) {
    if (mounted) {
      ref.read(liveMatchProvider.notifier).startLiveMatch(matchId);
    }
  }
} 