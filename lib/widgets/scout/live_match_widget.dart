import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/app_providers.dart';
import '../../utils/colors.dart';

class LiveMatchWidget extends ConsumerStatefulWidget {
  const LiveMatchWidget({super.key});

  @override
  ConsumerState<LiveMatchWidget> createState() => _LiveMatchWidgetState();
}

class _LiveMatchWidgetState extends ConsumerState<LiveMatchWidget> {
  late Timer _timer;
  int _elapsedSeconds = 0;
  bool _isTimerRunning = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_isTimerRunning) {
        setState(() {
          _elapsedSeconds++;
        });
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
    
    if (!liveMatchState.isActive) {
      return _buildStartMatchCard();
    }

    return Column(
      children: [
        _buildMatchHeader(liveMatchState),
        const SizedBox(height: 16),
        _buildTimerSection(),
        const SizedBox(height: 16),
        _buildPhaseSelector(liveMatchState),
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
                  child: ElevatedButton.icon(
                    onPressed: () => _showStartMatchDialog(),
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('Start Match'),
                    style: ElevatedButton.styleFrom(
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
                color: state.allianceColor == 'red' ? Colors.red : Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Match ${state.matchId}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: PerseveranceColors.buttonFill,
                    ),
                  ),
                  Text(
                    '${state.allianceColor?.toUpperCase()} Alliance',
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
                    });
                  },
                  icon: Icon(
                    _isTimerRunning ? Icons.pause : Icons.play_arrow,
                    color: PerseveranceColors.buttonFill,
                  ),
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhaseSelector(LiveMatchState state) {
    return Card(
      color: PerseveranceColors.background,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Match Phase',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: MatchPhase.values.map((phase) {
                final isSelected = state.currentPhase == phase;
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ElevatedButton(
                      onPressed: () {
                        ref.read(liveMatchProvider.notifier).updatePhase(phase);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isSelected 
                            ? PerseveranceColors.buttonFill 
                            : Colors.transparent,
                        foregroundColor: isSelected 
                            ? PerseveranceColors.primaryButtonText 
                            : PerseveranceColors.buttonFill,
                        side: BorderSide(
                          color: PerseveranceColors.buttonFill,
                          width: 1,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: Text(
                        _getPhaseName(phase),
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  String _getPhaseName(MatchPhase phase) {
    switch (phase) {
      case MatchPhase.autonomous:
        return 'AUTO';
      case MatchPhase.driverControlled:
        return 'DRIVER';
      case MatchPhase.endgame:
        return 'END';
    }
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
            _buildScoreButtons(state),
            const SizedBox(height: 12),
            _buildScoreDisplay(state),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreButtons(LiveMatchState state) {
    final currentPhase = state.currentPhase;
    final scoreData = currentPhase == MatchPhase.autonomous 
        ? state.autonomousData 
        : currentPhase == MatchPhase.driverControlled 
            ? state.driverControlledData 
            : state.endgameData;

    final scoreCategories = _getScoreCategories(currentPhase);

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: scoreCategories.map((category) {
        final currentScore = scoreData[category] ?? 0;
        return Column(
          children: [
            Text(
              category,
              style: TextStyle(
                fontSize: 12,
                color: PerseveranceColors.secondaryText,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    final newScore = (currentScore - 1).clamp(0, 10);
                    ref.read(liveMatchProvider.notifier).updateScore(category, newScore);
                  },
                  icon: const Icon(Icons.remove),
                  style: IconButton.styleFrom(
                    backgroundColor: PerseveranceColors.secondaryButtonText,
                    foregroundColor: PerseveranceColors.secondaryText,
                    minimumSize: const Size(32, 32),
                  ),
                ),
                Container(
                  width: 40,
                  height: 32,
                  decoration: BoxDecoration(
                    color: PerseveranceColors.buttonFill,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text(
                      '$currentScore',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: PerseveranceColors.primaryButtonText,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    final newScore = (currentScore + 1).clamp(0, 10);
                    ref.read(liveMatchProvider.notifier).updateScore(category, newScore);
                  },
                  icon: const Icon(Icons.add),
                  style: IconButton.styleFrom(
                    backgroundColor: PerseveranceColors.secondaryButtonText,
                    foregroundColor: PerseveranceColors.secondaryText,
                    minimumSize: const Size(32, 32),
                  ),
                ),
              ],
            ),
          ],
        );
      }).toList(),
    );
  }

  List<String> _getScoreCategories(MatchPhase? phase) {
    switch (phase) {
      case MatchPhase.autonomous:
        return ['Triballs', 'Mobility', 'Park'];
      case MatchPhase.driverControlled:
        return ['Triballs', 'Goals', 'Poles'];
      case MatchPhase.endgame:
        return ['Climb', 'Park', 'Bonus'];
      default:
        return [];
    }
  }

  Widget _buildScoreDisplay(LiveMatchState state) {
    final totalScore = _calculateTotalScore(state);
    
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: PerseveranceColors.primaryButtonText,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total Score',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: PerseveranceColors.background,
            ),
          ),
          Text(
            '$totalScore',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: PerseveranceColors.background,
            ),
          ),
        ],
      ),
    );
  }

  int _calculateTotalScore(LiveMatchState state) {
    int total = 0;
    
    // Autonomous score
    state.autonomousData.forEach((key, value) {
      if (value is int) total += value;
    });
    
    // Driver controlled score
    state.driverControlledData.forEach((key, value) {
      if (value is int) total += value;
    });
    
    // Endgame score
    state.endgameData.forEach((key, value) {
      if (value is int) total += value;
    });
    
    return total;
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
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildQuickActionButton('Climb', Icons.trending_up),
                _buildQuickActionButton('Park', Icons.local_parking),
                _buildQuickActionButton('Foul', Icons.warning),
                _buildQuickActionButton('Tech Foul', Icons.error),
                _buildQuickActionButton('Disable', Icons.block),
                _buildQuickActionButton('Reset', Icons.refresh),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionButton(String label, IconData icon) {
    return ElevatedButton.icon(
      onPressed: () {
        ref.read(liveMatchProvider.notifier).addNote('$label action recorded');
      },
      icon: Icon(icon, size: 16),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: PerseveranceColors.secondaryButtonText,
        foregroundColor: PerseveranceColors.secondaryText,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        minimumSize: const Size(80, 36),
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
              maxLines: 4,
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
                ref.read(liveMatchProvider.notifier).addNote(value);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMatchControls(LiveMatchState state) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              ref.read(liveMatchProvider.notifier).endMatch();
            },
            icon: const Icon(Icons.stop),
            label: const Text('End Match'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () => _showSaveDialog(state),
            icon: const Icon(Icons.save),
            label: const Text('Save Report'),
            style: ElevatedButton.styleFrom(
              backgroundColor: PerseveranceColors.buttonFill,
              foregroundColor: PerseveranceColors.primaryButtonText,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ),
      ],
    );
  }

  void _showStartMatchDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Start New Match',
          style: TextStyle(color: PerseveranceColors.buttonFill),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Match Number',
                labelStyle: TextStyle(color: PerseveranceColors.buttonFill),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      ref.read(liveMatchProvider.notifier).startMatch('Q1', 'red');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Red'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      ref.read(liveMatchProvider.notifier).startMatch('Q1', 'blue');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Blue'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showSaveDialog(LiveMatchState state) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Save Scout Report',
          style: TextStyle(color: PerseveranceColors.buttonFill),
        ),
        content: Text(
          'Save the current match data as a scout report?',
          style: TextStyle(color: PerseveranceColors.secondaryText),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: TextStyle(color: PerseveranceColors.buttonFill),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // TODO: Save scout report to database
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Scout report saved successfully'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: PerseveranceColors.buttonFill,
              foregroundColor: PerseveranceColors.primaryButtonText,
            ),
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
} 