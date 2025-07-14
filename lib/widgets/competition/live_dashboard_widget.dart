import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../utils/colors.dart';

class LiveDashboardWidget extends ConsumerStatefulWidget {
  const LiveDashboardWidget({super.key});

  @override
  ConsumerState<LiveDashboardWidget> createState() => _LiveDashboardWidgetState();
}

class _LiveDashboardWidgetState extends ConsumerState<LiveDashboardWidget> {
  String _selectedView = 'Brackets';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 16),
          _buildViewSelector(),
          const SizedBox(height: 16),
          _buildSelectedView(),
          const SizedBox(height: 16),
          _buildNotifications(),
        ],
      ),
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
            Row(
              children: [
                Icon(
                  Icons.fiber_manual_record,
                  color: Colors.red,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Text(
                  'LIVE COMPETITION',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'VEX Robotics Competition',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
            Text(
              'San Jose Convention Center • March 1-3, 2024',
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

  Widget _buildViewSelector() {
    final views = ['Brackets', 'Schedule', 'Skills', 'Awards'];
    
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: views.map((view) {
          final isSelected = _selectedView == view;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FilterChip(
              label: Text(view),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  _selectedView = view;
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

  Widget _buildSelectedView() {
    switch (_selectedView) {
      case 'Brackets':
        return _buildBracketsView();
      case 'Schedule':
        return _buildScheduleView();
      case 'Skills':
        return _buildSkillsView();
      case 'Awards':
        return _buildAwardsView();
      default:
        return _buildBracketsView();
    }
  }

  Widget _buildBracketsView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tournament Brackets',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: PerseveranceColors.buttonFill,
          ),
        ),
        const SizedBox(height: 12),
        _buildBracketRound('Quarter Finals', [
          {'team1': '1234A', 'team2': '5678B', 'score1': 85, 'score2': 72, 'winner': '1234A'},
          {'team1': '9012C', 'team2': '3456D', 'score1': 91, 'score2': 88, 'winner': '9012C'},
          {'team1': '7890E', 'team2': '1234F', 'score1': 76, 'score2': 82, 'winner': '1234F'},
          {'team1': '5678G', 'team2': '9012H', 'score1': 95, 'score2': 87, 'winner': '5678G'},
        ]),
        const SizedBox(height: 16),
        _buildBracketRound('Semi Finals', [
          {'team1': '1234A', 'team2': '9012C', 'score1': 0, 'score2': 0, 'winner': null},
          {'team1': '1234F', 'team2': '5678G', 'score1': 0, 'score2': 0, 'winner': null},
        ]),
        const SizedBox(height: 16),
        _buildBracketRound('Finals', [
          {'team1': 'TBD', 'team2': 'TBD', 'score1': 0, 'score2': 0, 'winner': null},
        ]),
      ],
    );
  }

  Widget _buildBracketRound(String roundName, List<Map<String, dynamic>> matches) {
    return Card(
      color: PerseveranceColors.background,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              roundName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
            const SizedBox(height: 12),
            ...matches.map((match) => _buildBracketMatch(match)),
          ],
        ),
      ),
    );
  }

  Widget _buildBracketMatch(Map<String, dynamic> match) {
    final isCompleted = match['winner'] != null;
    final isOurTeam = match['team1'] == '1234A' || match['team2'] == '1234A';
    
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isOurTeam 
            ? PerseveranceColors.buttonFill.withOpacity(0.1)
            : PerseveranceColors.primaryButtonText,
        borderRadius: BorderRadius.circular(8),
        border: isOurTeam 
            ? Border.all(color: PerseveranceColors.buttonFill, width: 2)
            : null,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              match['team1'],
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: isOurTeam 
                    ? PerseveranceColors.buttonFill 
                    : PerseveranceColors.background,
              ),
            ),
          ),
          Text(
            '${match['score1']}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isOurTeam 
                  ? PerseveranceColors.buttonFill 
                  : PerseveranceColors.background,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'vs',
            style: TextStyle(
              fontSize: 12,
              color: isOurTeam 
                  ? PerseveranceColors.buttonFill 
                  : PerseveranceColors.background,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '${match['score2']}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isOurTeam 
                  ? PerseveranceColors.buttonFill 
                  : PerseveranceColors.background,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              match['team2'],
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: isOurTeam 
                    ? PerseveranceColors.buttonFill 
                    : PerseveranceColors.background,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Match Schedule',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: PerseveranceColors.buttonFill,
          ),
        ),
        const SizedBox(height: 12),
        ..._getMatchSchedule().map((match) => _buildScheduleMatch(match)),
      ],
    );
  }

  Widget _buildScheduleMatch(Map<String, dynamic> match) {
    final isUpcoming = match['status'] == 'upcoming';
    final isLive = match['status'] == 'live';
    final isCompleted = match['status'] == 'completed';
    final isOurMatch = match['teams'].contains('1234A');

    Color statusColor;
    IconData statusIcon;
    
    if (isLive) {
      statusColor = Colors.red;
      statusIcon = Icons.fiber_manual_record;
    } else if (isUpcoming) {
      statusColor = Colors.orange;
      statusIcon = Icons.schedule;
    } else {
      statusColor = Colors.green;
      statusIcon = Icons.check_circle;
    }

    return Card(
      color: isOurMatch 
          ? PerseveranceColors.buttonFill.withOpacity(0.1)
          : PerseveranceColors.background,
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: statusColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                statusIcon,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Match ${match['matchNumber']}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: PerseveranceColors.buttonFill,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    match['teams'].join(' vs '),
                    style: TextStyle(
                      fontSize: 12,
                      color: PerseveranceColors.secondaryText,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    match['time'],
                    style: TextStyle(
                      fontSize: 12,
                      color: PerseveranceColors.secondaryText,
                    ),
                  ),
                ],
              ),
            ),
            if (isOurMatch)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: PerseveranceColors.buttonFill,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'OUR MATCH',
                  style: TextStyle(
                    fontSize: 10,
                    color: PerseveranceColors.primaryButtonText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillsView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Skills Challenge',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: PerseveranceColors.buttonFill,
          ),
        ),
        const SizedBox(height: 12),
        _buildSkillsRun('Programming Skills', 95, 1),
        _buildSkillsRun('Driver Skills', 88, 2),
        _buildSkillsRun('Combined Skills', 183, 1),
      ],
    );
  }

  Widget _buildSkillsRun(String type, int score, int rank) {
    return Card(
      color: PerseveranceColors.background,
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: rank <= 3 ? Colors.amber : PerseveranceColors.buttonFill,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  '#$rank',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: rank <= 3 ? Colors.black : PerseveranceColors.primaryButtonText,
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
                    type,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: PerseveranceColors.buttonFill,
                    ),
                  ),
                  Text(
                    'Score: $score',
                    style: TextStyle(
                      fontSize: 14,
                      color: PerseveranceColors.secondaryText,
                    ),
                  ),
                ],
              ),
            ),
            if (rank <= 3)
              Icon(
                Icons.emoji_events,
                color: Colors.amber,
                size: 24,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildAwardsView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Awards Ceremony',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: PerseveranceColors.buttonFill,
          ),
        ),
        const SizedBox(height: 12),
        _buildAwardItem('Excellence Award', 'Scheduled', '3:00 PM'),
        _buildAwardItem('Design Award', 'Scheduled', '3:15 PM'),
        _buildAwardItem('Tournament Champion', 'Scheduled', '3:30 PM'),
      ],
    );
  }

  Widget _buildAwardItem(String award, String status, String time) {
    return Card(
      color: PerseveranceColors.background,
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              Icons.emoji_events,
              color: Colors.amber,
              size: 24,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    award,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: PerseveranceColors.buttonFill,
                    ),
                  ),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 12,
                      color: PerseveranceColors.secondaryText,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: PerseveranceColors.buttonFill,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                status,
                style: TextStyle(
                  fontSize: 10,
                  color: PerseveranceColors.primaryButtonText,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotifications() {
    return Card(
      color: PerseveranceColors.background,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Live Notifications',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
            const SizedBox(height: 12),
            _buildNotificationItem('Match Q12 starting in 5 minutes', 'urgent'),
            _buildNotificationItem('Skills challenge registration closing', 'important'),
            _buildNotificationItem('Team meeting in pit area', 'info'),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationItem(String message, String priority) {
    Color priorityColor;
    IconData priorityIcon;
    
    switch (priority) {
      case 'urgent':
        priorityColor = Colors.red;
        priorityIcon = Icons.warning;
        break;
      case 'important':
        priorityColor = Colors.orange;
        priorityIcon = Icons.info;
        break;
      default:
        priorityColor = Colors.blue;
        priorityIcon = Icons.notifications;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(
            priorityIcon,
            color: priorityColor,
            size: 16,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                fontSize: 12,
                color: PerseveranceColors.secondaryText,
              ),
            ),
          ),
          Text(
            '2 min ago',
            style: TextStyle(
              fontSize: 10,
              color: PerseveranceColors.secondaryText,
            ),
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _getMatchSchedule() {
    return [
      {
        'matchNumber': 'Q12',
        'teams': ['1234A', '5678B'],
        'time': '2:30 PM',
        'status': 'upcoming',
      },
      {
        'matchNumber': 'Q13',
        'teams': ['9012C', '3456D'],
        'time': '2:45 PM',
        'status': 'live',
      },
      {
        'matchNumber': 'Q14',
        'teams': ['7890E', '1234F'],
        'time': '3:00 PM',
        'status': 'upcoming',
      },
      {
        'matchNumber': 'Q11',
        'teams': ['1234A', '9012C'],
        'time': '2:15 PM',
        'status': 'completed',
      },
    ];
  }
} 