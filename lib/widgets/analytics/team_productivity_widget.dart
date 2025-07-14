import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../utils/colors.dart';
import '../../services/haptic_service.dart';

class TeamProductivityWidget extends ConsumerStatefulWidget {
  const TeamProductivityWidget({super.key});

  @override
  ConsumerState<TeamProductivityWidget> createState() => _TeamProductivityWidgetState();
}

class _TeamProductivityWidgetState extends ConsumerState<TeamProductivityWidget> {
  String _selectedMetric = 'Task Completion';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 16),
          _buildMetricSelector(),
          const SizedBox(height: 16),
          _buildSelectedMetric(),
          const SizedBox(height: 16),
          _buildTeamStats(),
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
              'Team Productivity Analytics',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Track team performance and productivity metrics',
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

  Widget _buildMetricSelector() {
    final metrics = [
      'Task Completion',
      'Build Progress',
      'Meeting Attendance',
      'Hours Logged',
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: metrics.map((metric) {
          final isSelected = _selectedMetric == metric;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FilterChip(
              label: Text(metric),
              selected: isSelected,
              onSelected: (selected) {
                HapticService.chartInteraction();
                setState(() {
                  _selectedMetric = metric;
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

  Widget _buildSelectedMetric() {
    switch (_selectedMetric) {
      case 'Task Completion':
        return _buildTaskCompletionChart();
      case 'Build Progress':
        return _buildBuildProgressChart();
      case 'Meeting Attendance':
        return _buildMeetingAttendanceChart();
      case 'Hours Logged':
        return _buildHoursLoggedChart();
      default:
        return _buildTaskCompletionChart();
    }
  }

  Widget _buildTaskCompletionChart() {
    return Card(
      color: PerseveranceColors.background,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Task Completion Rates by Member',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 100,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            '${value.toInt()}%',
                            style: TextStyle(
                              color: PerseveranceColors.secondaryText,
                              fontSize: 10,
                            ),
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        getTitlesWidget: (value, meta) {
                          final members = ['Alex', 'Sam', 'Jordan', 'Casey'];
                          if (value.toInt() < members.length) {
                            return Text(
                              members[value.toInt()],
                              style: TextStyle(
                                color: PerseveranceColors.secondaryText,
                                fontSize: 10,
                              ),
                            );
                          }
                          return const Text('');
                        },
                      ),
                    ),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: [
                    BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 85, color: PerseveranceColors.buttonFill)]),
                    BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 92, color: PerseveranceColors.buttonFill)]),
                    BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 78, color: PerseveranceColors.buttonFill)]),
                    BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 88, color: PerseveranceColors.buttonFill)]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBuildProgressChart() {
    return Card(
      color: PerseveranceColors.background,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Build Progress Timeline',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            '${value.toInt()}%',
                            style: TextStyle(
                              color: PerseveranceColors.secondaryText,
                              fontSize: 10,
                            ),
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        getTitlesWidget: (value, meta) {
                          final weeks = ['W1', 'W2', 'W3', 'W4', 'W5'];
                          if (value.toInt() < weeks.length) {
                            return Text(
                              weeks[value.toInt()],
                              style: TextStyle(
                                color: PerseveranceColors.secondaryText,
                                fontSize: 10,
                              ),
                            );
                          }
                          return const Text('');
                        },
                      ),
                    ),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        const FlSpot(0, 20),
                        const FlSpot(1, 35),
                        const FlSpot(2, 55),
                        const FlSpot(3, 75),
                        const FlSpot(4, 90),
                      ],
                      isCurved: true,
                      color: Colors.green,
                      barWidth: 3,
                      dotData: FlDotData(show: true),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMeetingAttendanceChart() {
    return Card(
      color: PerseveranceColors.background,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Meeting Attendance Statistics',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      value: 85,
                      title: '85%',
                      color: Colors.green,
                      radius: 60,
                      titleStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    PieChartSectionData(
                      value: 15,
                      title: '15%',
                      color: Colors.orange,
                      radius: 60,
                      titleStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                  centerSpaceRadius: 40,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildLegendItem('Present', Colors.green),
                _buildLegendItem('Absent', Colors.orange),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHoursLoggedChart() {
    return Card(
      color: PerseveranceColors.background,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hours Logged per Member',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 50,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            '${value.toInt()}h',
                            style: TextStyle(
                              color: PerseveranceColors.secondaryText,
                              fontSize: 10,
                            ),
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        getTitlesWidget: (value, meta) {
                          final members = ['Alex', 'Sam', 'Jordan', 'Casey'];
                          if (value.toInt() < members.length) {
                            return Text(
                              members[value.toInt()],
                              style: TextStyle(
                                color: PerseveranceColors.secondaryText,
                                fontSize: 10,
                              ),
                            );
                          }
                          return const Text('');
                        },
                      ),
                    ),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: [
                    BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 35, color: PerseveranceColors.buttonFill)]),
                    BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 42, color: PerseveranceColors.buttonFill)]),
                    BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 28, color: PerseveranceColors.buttonFill)]),
                    BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 38, color: PerseveranceColors.buttonFill)]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamStats() {
    return Card(
      color: PerseveranceColors.background,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Team Performance Summary',
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
                  child: _buildStatCard('Avg Task Completion', '85%', Colors.green),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildStatCard('Total Hours', '143h', PerseveranceColors.buttonFill),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _buildStatCard('Meeting Attendance', '92%', Colors.blue),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildStatCard('Build Progress', '90%', Colors.orange),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: PerseveranceColors.secondaryText,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
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

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: PerseveranceColors.secondaryText,
          ),
        ),
      ],
    );
  }
} 