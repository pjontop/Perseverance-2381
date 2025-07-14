import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';
import '../../utils/colors.dart';
import '../../services/haptic_service.dart';

class CompetitionIntelligenceWidget extends ConsumerStatefulWidget {
  const CompetitionIntelligenceWidget({super.key});

  @override
  ConsumerState<CompetitionIntelligenceWidget> createState() => _CompetitionIntelligenceWidgetState();
}

class _CompetitionIntelligenceWidgetState extends ConsumerState<CompetitionIntelligenceWidget> {
  String _selectedAnalysis = 'Opponent Analysis';

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
          const SizedBox(height: 16),
          _buildIntelligenceInsights(),
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
              'Competition Intelligence',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'AI-powered competition analysis and strategic insights',
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
    final analyses = [
      'Opponent Analysis',
      'Alliance Success',
      'Match Predictions',
      'Regional Performance',
    ];

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
                HapticService.chartInteraction();
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
      case 'Opponent Analysis':
        return _buildOpponentAnalysis();
      case 'Alliance Success':
        return _buildAllianceSuccess();
      case 'Match Predictions':
        return _buildMatchPredictions();
      case 'Regional Performance':
        return _buildRegionalPerformance();
      default:
        return _buildOpponentAnalysis();
    }
  }

  Widget _buildOpponentAnalysis() {
    return Card(
      color: PerseveranceColors.background,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Opponent Strength/Weakness Analysis',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
            const SizedBox(height: 16),
            _buildRadarChart(),
            const SizedBox(height: 16),
            _buildOpponentList(),
          ],
        ),
      ),
    );
  }

  Widget _buildRadarChart() {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(16),
      child: CustomPaint(
        painter: RadarChartPainter(),
        child: Container(),
      ),
    );
  }

  Widget _buildOpponentList() {
    final opponents = [
      {'name': 'Team 1234A', 'strength': 'Autonomous', 'weakness': 'Endgame'},
      {'name': 'Team 5678B', 'strength': 'Driver Skills', 'weakness': 'Consistency'},
      {'name': 'Team 9012C', 'strength': 'Strategy', 'weakness': 'Speed'},
    ];

    return Column(
      children: opponents.map((opponent) => _buildOpponentCard(opponent)).toList(),
    );
  }

  Widget _buildOpponentCard(Map<String, dynamic> opponent) {
    return Card(
      color: PerseveranceColors.primaryButtonText,
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              opponent['name'],
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.background,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _buildStrengthWeakness('Strength', opponent['strength'], Colors.green),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildStrengthWeakness('Weakness', opponent['weakness'], Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStrengthWeakness(String type, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            type,
            style: TextStyle(
              fontSize: 10,
              color: PerseveranceColors.secondaryText,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAllianceSuccess() {
    return Card(
      color: PerseveranceColors.background,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Alliance Success Rate Statistics',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
            const SizedBox(height: 16),
            _buildAllianceStats(),
          ],
        ),
      ),
    );
  }

  Widget _buildAllianceStats() {
    return Column(
      children: [
        _buildStatRow('Total Alliances', '12', '85%'),
        _buildStatRow('Successful Alliances', '10', '83%'),
        _buildStatRow('Failed Alliances', '2', '17%'),
        _buildStatRow('Average Alliance Score', '156', '+12%'),
      ],
    );
  }

  Widget _buildStatRow(String label, String value, String percentage) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: PerseveranceColors.buttonFill,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
          ),
          Expanded(
            child: Text(
              percentage,
              style: TextStyle(
                fontSize: 14,
                color: PerseveranceColors.secondaryText,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMatchPredictions() {
    return Card(
      color: PerseveranceColors.background,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Match Prediction Accuracy',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
            const SizedBox(height: 16),
            _buildPredictionAccuracy(),
          ],
        ),
      ),
    );
  }

  Widget _buildPredictionAccuracy() {
    return Column(
      children: [
        _buildAccuracyCard('Overall Accuracy', '87%', Colors.green),
        const SizedBox(height: 8),
        _buildAccuracyCard('Win Predictions', '92%', Colors.blue),
        const SizedBox(height: 8),
        _buildAccuracyCard('Loss Predictions', '78%', Colors.orange),
      ],
    );
  }

  Widget _buildAccuracyCard(String label, String accuracy, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: PerseveranceColors.buttonFill,
              ),
            ),
          ),
          Text(
            accuracy,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegionalPerformance() {
    return Card(
      color: PerseveranceColors.background,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Regional Performance Comparison',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
            const SizedBox(height: 16),
            _buildRegionalStats(),
          ],
        ),
      ),
    );
  }

  Widget _buildRegionalStats() {
    final regions = [
      {'name': 'Northern California', 'rank': '3rd', 'score': '85.2'},
      {'name': 'Southern California', 'rank': '7th', 'score': '82.1'},
      {'name': 'Central Valley', 'rank': '1st', 'score': '89.5'},
      {'name': 'Bay Area', 'rank': '5th', 'score': '83.7'},
    ];

    return Column(
      children: regions.map((region) => _buildRegionCard(region)).toList(),
    );
  }

  Widget _buildRegionCard(Map<String, dynamic> region) {
    final isTopRank = region['rank'] == '1st';
    final color = isTopRank ? Colors.amber : PerseveranceColors.buttonFill;

    return Card(
      color: PerseveranceColors.primaryButtonText,
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                region['name'],
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: PerseveranceColors.background,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                region['rank'],
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: isTopRank ? Colors.black : PerseveranceColors.primaryButtonText,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '${region['score']}',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.background,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIntelligenceInsights() {
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
                  Icons.psychology,
                  color: PerseveranceColors.buttonFill,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  'AI Insights',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: PerseveranceColors.buttonFill,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildInsightItem('Focus on autonomous consistency to improve win rate'),
            _buildInsightItem('Alliance with teams strong in endgame strategies'),
            _buildInsightItem('Practice defensive maneuvers against aggressive opponents'),
          ],
        ),
      ),
    );
  }

  Widget _buildInsightItem(String insight) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.lightbulb,
            color: PerseveranceColors.buttonFill,
            size: 16,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              insight,
              style: TextStyle(
                fontSize: 12,
                color: PerseveranceColors.secondaryText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RadarChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = PerseveranceColors.buttonFill
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 3;

    // Draw radar chart lines
    for (int i = 0; i < 6; i++) {
      final angle = (i * 60) * (3.14159 / 180);
      final endPoint = Offset(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );
      canvas.drawLine(center, endPoint, paint);
    }

    // Draw data points (simplified)
    final dataPoints = [
      Offset(center.dx + radius * 0.8, center.dy - radius * 0.3),
      Offset(center.dx + radius * 0.6, center.dy + radius * 0.4),
      Offset(center.dx - radius * 0.7, center.dy + radius * 0.2),
    ];

    final dataPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    for (final point in dataPoints) {
      canvas.drawCircle(point, 4, dataPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
} 