import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/app_providers.dart';
import '../../utils/colors.dart';
import '../../models/competition/alliance_recommendations_state.dart';

class AllianceRecommendationsWidget extends ConsumerStatefulWidget {
  const AllianceRecommendationsWidget({super.key});

  @override
  ConsumerState<AllianceRecommendationsWidget> createState() => _AllianceRecommendationsWidgetState();
}

class _AllianceRecommendationsWidgetState extends ConsumerState<AllianceRecommendationsWidget> {
  String? _selectedTeamId;

  @override
  Widget build(BuildContext context) {
    final allianceRecommendationsState = ref.watch(allianceRecommendationsProvider);
    final teamsAsync = ref.watch(teamsProvider(''));

    Widget content;
    if (allianceRecommendationsState.isLoading) {
      content = _buildLoadingState();
    } else if (allianceRecommendationsState.error != null) {
      content = Center(child: Text('Error: ${allianceRecommendationsState.error}'));
    } else {
      content = _buildRecommendationsList(allianceRecommendationsState);
    }

    return Column(
      children: [
        _buildHeader(),
        const SizedBox(height: 16),
        _buildTeamSelector(teamsAsync),
        const SizedBox(height: 16),
        Expanded(child: content),
      ],
    );
  }

  Widget _buildHeader() {
    return Card(
      color: PerseveranceColors.background,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Alliance Partner Recommendations',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Find the best alliance partners based on team compatibility and strategy',
              style: TextStyle(
                fontSize: 14,
                color: PerseveranceColors.secondaryText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamSelector(AsyncValue<List<Map<String, dynamic>>> teamsAsync) {
    return Card(
      color: PerseveranceColors.background,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Your Team',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
            const SizedBox(height: 12),
            teamsAsync.when(
              data: (teams) => _buildTeamDropdown(teams),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Text(
                'Error loading teams: $error',
                style: TextStyle(color: Colors.red),
              ),
            ),
            const SizedBox(height: 12),
            if (_selectedTeamId != null)
              ElevatedButton.icon(
                onPressed: () {
                  ref.read(allianceRecommendationsProvider.notifier)
                      .generateRecommendations(_selectedTeamId!);
                },
                icon: const Icon(Icons.psychology),
                label: const Text('Generate Recommendations'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: PerseveranceColors.buttonFill,
                  foregroundColor: PerseveranceColors.primaryButtonText,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamDropdown(List<Map<String, dynamic>> teams) {
    return DropdownButtonFormField<String>(
      value: _selectedTeamId,
      decoration: InputDecoration(
        labelText: 'Choose your team',
        labelStyle: TextStyle(color: PerseveranceColors.buttonFill),
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
      dropdownColor: PerseveranceColors.background,
      items: teams.map((team) {
        return DropdownMenuItem<String>(
          value: team['id'],
          child: Text('${team['teamNumber']} - ${team['name']}'),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedTeamId = value;
        });
      },
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: PerseveranceColors.buttonFill,
          ),
          const SizedBox(height: 16),
          Text(
            'Analyzing team compatibility...',
            style: TextStyle(
              color: PerseveranceColors.secondaryText,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendationsList(AllianceRecommendationsState state) {
    if (state.recommendations.isEmpty) {
      return _buildEmptyState();
    }

    return ListView.builder(
      itemCount: state.recommendations.length,
      itemBuilder: (context, index) {
        final recommendation = state.recommendations[index];
        return _buildRecommendationCard(recommendation);
      },
    );
  }

  Widget _buildRecommendationCard(Map<String, dynamic> recommendation) {
    final compatibilityScore = recommendation['compatibilityScore'] ?? 0;
    final team = recommendation['team'] ?? {};
    final strategy = recommendation['strategy'] ?? '';
    final strengths = recommendation['strengths'] ?? [];
    final weaknesses = recommendation['weaknesses'] ?? [];

    return Card(
      color: PerseveranceColors.background,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: PerseveranceColors.buttonFill,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      team['teamNumber'] ?? '?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: PerseveranceColors.primaryButtonText,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        team['name'] ?? 'Unknown Team',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: PerseveranceColors.buttonFill,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${team['school'] ?? 'Unknown School'} • ${team['region'] ?? 'Unknown'}',
                        style: TextStyle(
                          fontSize: 12,
                          color: PerseveranceColors.secondaryText,
                        ),
                      ),
                    ],
                  ),
                ),
                _buildCompatibilityScore(compatibilityScore),
              ],
            ),
            const SizedBox(height: 16),
            _buildStrategySection(strategy),
            const SizedBox(height: 12),
            _buildStrengthsWeaknessesSection(strengths, weaknesses),
            const SizedBox(height: 12),
            _buildActionButtons(recommendation),
          ],
        ),
      ),
    );
  }

  Widget _buildCompatibilityScore(int score) {
    Color scoreColor;
    String scoreText;
    
    if (score >= 80) {
      scoreColor = Colors.green;
      scoreText = 'Excellent';
    } else if (score >= 60) {
      scoreColor = Colors.orange;
      scoreText = 'Good';
    } else if (score >= 40) {
      scoreColor = Colors.yellow;
      scoreText = 'Fair';
    } else {
      scoreColor = Colors.red;
      scoreText = 'Poor';
    }

    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: scoreColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '$score%',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          scoreText,
          style: TextStyle(
            fontSize: 10,
            color: scoreColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildStrategySection(String strategy) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Strategy',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: PerseveranceColors.buttonFill,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: PerseveranceColors.primaryButtonText,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            strategy.isNotEmpty ? strategy : 'No strategy notes available',
            style: TextStyle(
              fontSize: 12,
              color: PerseveranceColors.background,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStrengthsWeaknessesSection(List<dynamic> strengths, List<dynamic> weaknesses) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Strengths',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 4),
              ...strengths.take(3).map((strength) => Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 12,
                      color: Colors.green,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        strength,
                        style: TextStyle(
                          fontSize: 10,
                          color: PerseveranceColors.secondaryText,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Weaknesses',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 4),
              ...weaknesses.take(3).map((weakness) => Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Row(
                  children: [
                    Icon(
                      Icons.cancel,
                      size: 12,
                      color: Colors.red,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        weakness,
                        style: TextStyle(
                          fontSize: 10,
                          color: PerseveranceColors.secondaryText,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(Map<String, dynamic> recommendation) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => _showDetailedAnalysis(recommendation),
            icon: const Icon(Icons.analytics, size: 16),
            label: const Text('Details'),
            style: OutlinedButton.styleFrom(
              foregroundColor: PerseveranceColors.buttonFill,
              side: BorderSide(color: PerseveranceColors.buttonFill),
              padding: const EdgeInsets.symmetric(vertical: 8),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () => _addToPreferredPartners(recommendation),
            icon: const Icon(Icons.favorite, size: 16),
            label: const Text('Add'),
            style: ElevatedButton.styleFrom(
              backgroundColor: PerseveranceColors.buttonFill,
              foregroundColor: PerseveranceColors.primaryButtonText,
              padding: const EdgeInsets.symmetric(vertical: 8),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.psychology_outlined,
            size: 64,
            color: PerseveranceColors.secondaryText,
          ),
          const SizedBox(height: 16),
          Text(
            'No recommendations yet',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: PerseveranceColors.buttonFill,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Select your team and generate alliance recommendations',
            style: TextStyle(
              color: PerseveranceColors.secondaryText,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _showDetailedAnalysis(Map<String, dynamic> recommendation) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Detailed Analysis',
          style: TextStyle(color: PerseveranceColors.buttonFill),
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildAnalysisSection('Compatibility Factors', recommendation['compatibilityFactors'] ?? []),
              const SizedBox(height: 16),
              _buildAnalysisSection('Strategy Notes', [recommendation['strategy'] ?? 'No strategy notes']),
              const SizedBox(height: 16),
              _buildAnalysisSection('Match History', recommendation['matchHistory'] ?? []),
              const SizedBox(height: 16),
              _buildAnalysisSection('Performance Metrics', recommendation['performanceMetrics'] ?? []),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Close',
              style: TextStyle(color: PerseveranceColors.buttonFill),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnalysisSection(String title, List<dynamic> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: PerseveranceColors.buttonFill,
          ),
        ),
        const SizedBox(height: 8),
        ...items.map((item) => Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.circle,
                size: 8,
                color: PerseveranceColors.buttonFill,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  item.toString(),
                  style: TextStyle(
                    fontSize: 12,
                    color: PerseveranceColors.secondaryText,
                  ),
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }

  void _addToPreferredPartners(Map<String, dynamic> recommendation) {
    // TODO: Implement adding to preferred partners
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Added ${recommendation['team']?['name'] ?? 'team'} to preferred partners'),
        backgroundColor: Colors.green,
      ),
    );
  }
} 