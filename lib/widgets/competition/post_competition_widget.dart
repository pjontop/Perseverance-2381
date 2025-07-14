import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../utils/colors.dart';

class PostCompetitionWidget extends ConsumerStatefulWidget {
  const PostCompetitionWidget({super.key});

  @override
  ConsumerState<PostCompetitionWidget> createState() => _PostCompetitionWidgetState();
}

class _PostCompetitionWidgetState extends ConsumerState<PostCompetitionWidget> {
  String _selectedAnalysis = 'Performance';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 16),
          _buildAnalysisSelector(),
          const SizedBox(height: 16),
          _buildSelectedAnalysis(),
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
            Text(
              'Post-Competition Analysis',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'AI-enhanced insights and performance review',
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

  Widget _buildAnalysisSelector() {
    final analyses = ['Performance', 'Improvements', 'Awards', 'Gallery'];
    
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: analyses.map((analysis) {
          final isSelected = _selectedAnalysis == analysis;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FilterChip(
              label: Text(analysis),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  _selectedAnalysis = analysis;
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

  Widget _buildSelectedAnalysis() {
    switch (_selectedAnalysis) {
      case 'Performance':
        return _buildPerformanceAnalysis();
      case 'Improvements':
        return _buildImprovementsAnalysis();
      case 'Awards':
        return _buildAwardsAnalysis();
      case 'Gallery':
        return _buildGalleryAnalysis();
      default:
        return _buildPerformanceAnalysis();
    }
  }

  Widget _buildPerformanceAnalysis() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Match Performance Review',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: PerseveranceColors.buttonFill,
          ),
        ),
        const SizedBox(height: 12),
        ..._getMatchPerformances().map((match) => _buildMatchPerformance(match)),
      ],
    );
  }

  Widget _buildMatchPerformance(Map<String, dynamic> match) {
    final isWin = match['result'] == 'win';
    final isLoss = match['result'] == 'loss';
    final isTie = match['result'] == 'tie';
    
    Color resultColor;
    IconData resultIcon;
    
    if (isWin) {
      resultColor = Colors.green;
      resultIcon = Icons.emoji_events;
    } else if (isLoss) {
      resultColor = Colors.red;
      resultIcon = Icons.close;
    } else {
      resultColor = Colors.orange;
      resultIcon = Icons.remove;
    }

    return Card(
      color: PerseveranceColors.background,
      margin: const EdgeInsets.only(bottom: 8),
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
                    color: resultColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    resultIcon,
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
                      Text(
                        '${match['ourScore']} - ${match['opponentScore']}',
                        style: TextStyle(
                          fontSize: 14,
                          color: PerseveranceColors.secondaryText,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: resultColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    match['result'].toUpperCase(),
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildPerformanceMetrics(match['metrics']),
            if (match['aiInsights'] != null) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: PerseveranceColors.buttonFill.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.psychology,
                      color: PerseveranceColors.buttonFill,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        match['aiInsights'],
                        style: TextStyle(
                          color: PerseveranceColors.buttonFill,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildPerformanceMetrics(Map<String, dynamic> metrics) {
    return Column(
      children: [
        _buildMetricRow('Autonomous Score', metrics['autonomous'], 15),
        _buildMetricRow('Driver Score', metrics['driver'], 85),
        _buildMetricRow('Endgame Score', metrics['endgame'], 20),
        _buildMetricRow('Penalties', metrics['penalties'], 0),
      ],
    );
  }

  Widget _buildMetricRow(String label, int value, int maxValue) {
    final percentage = maxValue > 0 ? value / maxValue : 0.0;
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: PerseveranceColors.secondaryText,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: LinearProgressIndicator(
              value: percentage,
              backgroundColor: PerseveranceColors.secondaryButtonText,
              valueColor: AlwaysStoppedAnimation<Color>(PerseveranceColors.buttonFill),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '$value/$maxValue',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: PerseveranceColors.buttonFill,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImprovementsAnalysis() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What Went Well / What to Improve',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: PerseveranceColors.buttonFill,
          ),
        ),
        const SizedBox(height: 12),
        _buildImprovementSection('Strengths', _getStrengths(), Colors.green),
        const SizedBox(height: 16),
        _buildImprovementSection('Areas for Improvement', _getImprovements(), Colors.orange),
        const SizedBox(height: 16),
        _buildImprovementSection('AI Recommendations', _getAIRecommendations(), PerseveranceColors.buttonFill),
      ],
    );
  }

  Widget _buildImprovementSection(String title, List<Map<String, dynamic>> items, Color color) {
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
                  title == 'Strengths' 
                      ? Icons.thumb_up 
                      : title == 'Areas for Improvement'
                          ? Icons.build
                          : Icons.psychology,
                  color: color,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: PerseveranceColors.buttonFill,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...items.map((item) => _buildImprovementItem(item, color)),
          ],
        ),
      ),
    );
  }

  Widget _buildImprovementItem(Map<String, dynamic> item, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle,
            color: color,
            size: 16,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['title'],
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: PerseveranceColors.buttonFill,
                  ),
                ),
                if (item['description'] != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    item['description'],
                    style: TextStyle(
                      fontSize: 12,
                      color: PerseveranceColors.secondaryText,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAwardsAnalysis() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Awards & Achievements',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: PerseveranceColors.buttonFill,
          ),
        ),
        const SizedBox(height: 12),
        ..._getAwards().map((award) => _buildAwardItem(award)),
      ],
    );
  }

  Widget _buildAwardItem(Map<String, dynamic> award) {
    final isWon = award['status'] == 'won';
    final isNominated = award['status'] == 'nominated';
    
    Color statusColor;
    IconData statusIcon;
    
    if (isWon) {
      statusColor = Colors.amber;
      statusIcon = Icons.emoji_events;
    } else if (isNominated) {
      statusColor = Colors.blue;
      statusIcon = Icons.star;
    } else {
      statusColor = Colors.grey;
      statusIcon = Icons.info;
    }

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
                    award['name'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: PerseveranceColors.buttonFill,
                    ),
                  ),
                  Text(
                    award['description'],
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
                color: statusColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                award['status'].toUpperCase(),
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGalleryAnalysis() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Competition Photo Gallery',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: PerseveranceColors.buttonFill,
          ),
        ),
        const SizedBox(height: 12),
        _buildPhotoGrid(),
      ],
    );
  }

  Widget _buildPhotoGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: _getPhotos().length,
      itemBuilder: (context, index) {
        final photo = _getPhotos()[index];
        return _buildPhotoItem(photo);
      },
    );
  }

  Widget _buildPhotoItem(Map<String, dynamic> photo) {
    return Card(
      color: PerseveranceColors.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: PerseveranceColors.buttonFill.withOpacity(0.1),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
              ),
              child: Center(
                child: Icon(
                  Icons.photo,
                  color: PerseveranceColors.buttonFill,
                  size: 32,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  photo['title'],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: PerseveranceColors.buttonFill,
                  ),
                ),
                Text(
                  photo['date'],
                  style: TextStyle(
                    fontSize: 10,
                    color: PerseveranceColors.secondaryText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _getMatchPerformances() {
    return [
      {
        'matchNumber': 'Q12',
        'result': 'win',
        'ourScore': 85,
        'opponentScore': 72,
        'metrics': {
          'autonomous': 12,
          'driver': 65,
          'endgame': 15,
          'penalties': 0,
        },
        'aiInsights': 'Strong autonomous performance and excellent driver control',
      },
      {
        'matchNumber': 'Q13',
        'result': 'loss',
        'ourScore': 68,
        'opponentScore': 91,
        'metrics': {
          'autonomous': 8,
          'driver': 52,
          'endgame': 8,
          'penalties': 5,
        },
        'aiInsights': 'Need to improve autonomous consistency and reduce penalties',
      },
      {
        'matchNumber': 'Q14',
        'result': 'win',
        'ourScore': 92,
        'opponentScore': 78,
        'metrics': {
          'autonomous': 15,
          'driver': 70,
          'endgame': 12,
          'penalties': 0,
        },
        'aiInsights': 'Excellent endgame strategy and clean execution',
      },
    ];
  }

  List<Map<String, dynamic>> _getStrengths() {
    return [
      {
        'title': 'Autonomous Programming',
        'description': 'Consistent autonomous scoring with multiple routines',
      },
      {
        'title': 'Driver Skills',
        'description': 'Excellent driver control and game strategy',
      },
      {
        'title': 'Team Communication',
        'description': 'Strong pit crew coordination and quick repairs',
      },
    ];
  }

  List<Map<String, dynamic>> _getImprovements() {
    return [
      {
        'title': 'Endgame Strategy',
        'description': 'Need to develop more consistent endgame scoring',
      },
      {
        'title': 'Penalty Avoidance',
        'description': 'Reduce minor rule violations and contact penalties',
      },
      {
        'title': 'Alliance Communication',
        'description': 'Improve pre-match alliance partner coordination',
      },
    ];
  }

  List<Map<String, dynamic>> _getAIRecommendations() {
    return [
      {
        'title': 'Practice Autonomous Variations',
        'description': 'AI suggests practicing 3-4 different autonomous routines',
      },
      {
        'title': 'Endgame Practice',
        'description': 'Focus 30% of practice time on endgame scenarios',
      },
      {
        'title': 'Alliance Strategy',
        'description': 'Develop standardized alliance communication protocols',
      },
    ];
  }

  List<Map<String, dynamic>> _getAwards() {
    return [
      {
        'name': 'Excellence Award',
        'description': 'Overall team excellence in design and performance',
        'status': 'won',
      },
      {
        'name': 'Design Award',
        'description': 'Innovative robot design and engineering',
        'status': 'nominated',
      },
      {
        'name': 'Tournament Champion',
        'description': 'First place in tournament competition',
        'status': 'nominated',
      },
    ];
  }

  List<Map<String, dynamic>> _getPhotos() {
    return [
      {'title': 'Pit Setup', 'date': '2024-03-01'},
      {'title': 'Robot Inspection', 'date': '2024-03-01'},
      {'title': 'Match Q12', 'date': '2024-03-01'},
      {'title': 'Team Celebration', 'date': '2024-03-01'},
      {'title': 'Awards Ceremony', 'date': '2024-03-01'},
      {'title': 'Team Photo', 'date': '2024-03-01'},
    ];
  }
} 