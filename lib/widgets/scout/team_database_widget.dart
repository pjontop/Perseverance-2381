import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/app_providers.dart';
import '../../utils/colors.dart';

class TeamDatabaseWidget extends ConsumerStatefulWidget {
  const TeamDatabaseWidget({super.key});

  @override
  ConsumerState<TeamDatabaseWidget> createState() => _TeamDatabaseWidgetState();
}

class _TeamDatabaseWidgetState extends ConsumerState<TeamDatabaseWidget> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedFilter = 'All';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final teamDatabaseState = ref.watch(teamDatabaseProvider);
    final teamsAsync = ref.watch(teamsProvider(teamDatabaseState.searchQuery));

    return Column(
      children: [
        _buildSearchSection(),
        const SizedBox(height: 16),
        _buildFilterChips(),
        const SizedBox(height: 16),
        Expanded(
          child: teamsAsync.when(
            data: (teams) => _buildTeamsList(teams),
            loading: () => _buildLoadingState(),
            error: (error, stack) => _buildErrorState(error.toString()),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchSection() {
    return Card(
      color: PerseveranceColors.background,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Team Database',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search teams by number or name...',
                hintStyle: TextStyle(color: PerseveranceColors.secondaryText),
                prefixIcon: Icon(
                  Icons.search,
                  color: PerseveranceColors.buttonFill,
                ),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          _searchController.clear();
                          ref.read(teamDatabaseProvider.notifier).searchTeams('');
                        },
                        icon: Icon(
                          Icons.clear,
                          color: PerseveranceColors.buttonFill,
                        ),
                      )
                    : null,
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
                ref.read(teamDatabaseProvider.notifier).searchTeams(value);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChips() {
    final filters = ['All', 'Red Alliance', 'Blue Alliance', 'High Score', 'Low Score'];
    
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filters.map((filter) {
          final isSelected = _selectedFilter == filter;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FilterChip(
              label: Text(filter),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  _selectedFilter = filter;
                });
              },
              selectedColor: PerseveranceColors.buttonFill,
              checkmarkColor: PerseveranceColors.primaryButtonText,
              labelStyle: TextStyle(
                color: isSelected 
                    ? PerseveranceColors.primaryButtonText 
                    : PerseveranceColors.buttonFill,
              ),
              side: BorderSide(color: PerseveranceColors.buttonFill),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTeamsList(List<Map<String, dynamic>> teams) {
    if (teams.isEmpty) {
      return _buildEmptyState();
    }

    return ListView.builder(
      itemCount: teams.length,
      itemBuilder: (context, index) {
        final team = teams[index];
        return _buildTeamCard(team);
      },
    );
  }

  Widget _buildTeamCard(Map<String, dynamic> team) {
    final isSelected = false; // Remove selectedTeamId reference for now
    
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      color: isSelected ? PerseveranceColors.primary.withOpacity(0.1) : null,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: PerseveranceColors.primary,
          child: Text(
            team['name']?.substring(0, 1).toUpperCase() ?? 'T',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          team['name'] ?? 'Unknown Team',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          'Team ${team['code'] ?? 'N/A'} • ${team['location'] ?? 'Unknown Location'}',
        ),
        trailing: IconButton(
          icon: const Icon(Icons.info_outline),
          onPressed: () => _showTeamDetails(team),
        ),
        onTap: () => _selectTeam(team),
      ),
    );
  }

  Widget _buildPerformanceMetrics(Map<String, dynamic> team) {
    final metrics = team['performanceMetrics'] ?? {};
    final avgScore = metrics['averageScore'] ?? 0;
    final winRate = metrics['winRate'] ?? 0.0;
    
    return Row(
      children: [
        _buildMetricChip('Avg: $avgScore', Icons.trending_up),
        const SizedBox(width: 8),
        _buildMetricChip('${(winRate * 100).toInt()}% Win', Icons.emoji_events),
      ],
    );
  }

  Widget _buildMetricChip(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: PerseveranceColors.secondaryButtonText,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 12,
            color: PerseveranceColors.secondaryText,
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: PerseveranceColors.secondaryText,
            ),
          ),
        ],
      ),
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
            'Loading teams...',
            style: TextStyle(
              color: PerseveranceColors.secondaryText,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: PerseveranceColors.secondaryText,
          ),
          const SizedBox(height: 16),
          Text(
            'Error loading teams',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: PerseveranceColors.buttonFill,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            error,
            style: TextStyle(
              color: PerseveranceColors.secondaryText,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              ref.invalidate(teamsProvider);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: PerseveranceColors.buttonFill,
              foregroundColor: PerseveranceColors.primaryButtonText,
            ),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: 64,
            color: PerseveranceColors.secondaryText,
          ),
          const SizedBox(height: 16),
          Text(
            'No teams found',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: PerseveranceColors.buttonFill,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Try adjusting your search criteria',
            style: TextStyle(
              color: PerseveranceColors.secondaryText,
            ),
          ),
        ],
      ),
    );
  }

  void _showTeamDetails(Map<String, dynamic> team) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        builder: (context, scrollController) => Container(
          decoration: BoxDecoration(
            color: PerseveranceColors.background,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: PerseveranceColors.secondaryText,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTeamHeader(team),
                      const SizedBox(height: 24),
                      _buildTeamStats(team),
                      const SizedBox(height: 24),
                      _buildStrengthsWeaknesses(team),
                      const SizedBox(height: 24),
                      _buildMatchHistory(team),
                      const SizedBox(height: 24),
                      _buildAlliancePartners(team),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTeamHeader(Map<String, dynamic> team) {
    return Row(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: PerseveranceColors.buttonFill,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              team['teamNumber'] ?? '?',
              style: TextStyle(
                fontSize: 24,
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
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: PerseveranceColors.buttonFill,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${team['school'] ?? 'Unknown School'} • ${team['region'] ?? 'Unknown'}',
                style: TextStyle(
                  fontSize: 14,
                  color: PerseveranceColors.secondaryText,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTeamStats(Map<String, dynamic> team) {
    final metrics = team['performanceMetrics'] ?? {};
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Performance Stats',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: PerseveranceColors.buttonFill,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                'Average Score',
                '${metrics['averageScore'] ?? 0}',
                Icons.trending_up,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildStatCard(
                'Win Rate',
                '${((metrics['winRate'] ?? 0.0) * 100).toInt()}%',
                Icons.emoji_events,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                'Matches Played',
                '${metrics['matchesPlayed'] ?? 0}',
                Icons.sports_esports,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildStatCard(
                'Highest Score',
                '${metrics['highestScore'] ?? 0}',
                Icons.leaderboard,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: PerseveranceColors.primaryButtonText,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: PerseveranceColors.background,
            size: 24,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: PerseveranceColors.background,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: PerseveranceColors.background,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildStrengthsWeaknesses(Map<String, dynamic> team) {
    final strengths = team['strengths'] ?? [];
    final weaknesses = team['weaknesses'] ?? [];
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Strengths & Weaknesses',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: PerseveranceColors.buttonFill,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Strengths',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...strengths.map((strength) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          size: 16,
                          color: Colors.green,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            strength,
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
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...weaknesses.map((weakness) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      children: [
                        Icon(
                          Icons.cancel,
                          size: 16,
                          color: Colors.red,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            weakness,
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
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMatchHistory(Map<String, dynamic> team) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Matches',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: PerseveranceColors.buttonFill,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          height: 200,
          child: ListView.builder(
            itemCount: 5, // Show last 5 matches
            itemBuilder: (context, index) {
              return _buildMatchHistoryItem(index);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMatchHistoryItem(int index) {
    // Placeholder match data
    final matches = [
      {'match': 'Q12', 'score': 85, 'result': 'W', 'alliance': 'Red'},
      {'match': 'Q11', 'score': 72, 'result': 'L', 'alliance': 'Blue'},
      {'match': 'Q10', 'score': 91, 'result': 'W', 'alliance': 'Red'},
      {'match': 'Q9', 'score': 68, 'result': 'L', 'alliance': 'Blue'},
      {'match': 'Q8', 'score': 88, 'result': 'W', 'alliance': 'Red'},
    ];
    
    if (index >= matches.length) return const SizedBox.shrink();
    
    final match = matches[index];
    
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: PerseveranceColors.primaryButtonText,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: match['result'] == 'W' ? Colors.green : Colors.red,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Text(
                match['result'].toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Match ${match['match']}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: PerseveranceColors.background,
                  ),
                ),
                Text(
                  '${match['alliance']} Alliance',
                  style: TextStyle(
                    fontSize: 12,
                    color: PerseveranceColors.background,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '${match['score']} pts',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: PerseveranceColors.background,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAlliancePartners(Map<String, dynamic> team) {
    final partners = team['preferredAlliancePartners'] ?? [];
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Preferred Alliance Partners',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: PerseveranceColors.buttonFill,
          ),
        ),
        const SizedBox(height: 12),
        if (partners.isEmpty)
          Text(
            'No preferred partners recorded',
            style: TextStyle(
              color: PerseveranceColors.secondaryText,
            ),
          )
        else
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: partners.map((partner) {
              return Chip(
                label: Text(partner),
                backgroundColor: PerseveranceColors.buttonFill,
                labelStyle: TextStyle(
                  color: PerseveranceColors.primaryButtonText,
                ),
              );
            }).toList(),
          ),
      ],
    );
  }
} 