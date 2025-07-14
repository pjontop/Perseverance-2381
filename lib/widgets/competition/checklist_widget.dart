import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../utils/colors.dart';

class ChecklistWidget extends ConsumerStatefulWidget {
  const ChecklistWidget({super.key});

  @override
  ConsumerState<ChecklistWidget> createState() => _ChecklistWidgetState();
}

class _ChecklistWidgetState extends ConsumerState<ChecklistWidget> {
  String _selectedCategory = 'Robot Inspection';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 16),
          _buildCategorySelector(),
          const SizedBox(height: 16),
          _buildChecklistItems(),
          const SizedBox(height: 16),
          _buildProgressSection(),
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
              'Pre-Competition Checklists',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'AI-enhanced progress tracking for competition preparation',
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

  Widget _buildCategorySelector() {
    final categories = [
      'Robot Inspection',
      'Pit Setup',
      'Tool Inventory',
      'Team Roles',
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          final isSelected = _selectedCategory == category;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FilterChip(
              label: Text(category),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  _selectedCategory = category;
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

  Widget _buildChecklistItems() {
    final items = _getChecklistItems();
    final completedCount = items.where((item) => item['completed'] == true).length;
    final totalCount = items.length;
    final progress = totalCount > 0 ? completedCount / totalCount : 0.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _selectedCategory,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
            Text(
              '$completedCount/$totalCount',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: PerseveranceColors.secondaryButtonText,
          valueColor: AlwaysStoppedAnimation<Color>(PerseveranceColors.buttonFill),
        ),
        const SizedBox(height: 16),
        ...items.map((item) => _buildChecklistItem(item)),
      ],
    );
  }

  Widget _buildChecklistItem(Map<String, dynamic> item) {
    final isCompleted = item['completed'] == true;
    final isCritical = item['critical'] == true;
    final isAISuggested = item['aiSuggested'] == true;

    return Card(
      color: PerseveranceColors.background,
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Checkbox(
              value: isCompleted,
              onChanged: (value) {
                setState(() {
                  item['completed'] = value;
                });
              },
              activeColor: PerseveranceColors.buttonFill,
              checkColor: PerseveranceColors.primaryButtonText,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item['title'],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isCompleted 
                                ? PerseveranceColors.secondaryText 
                                : PerseveranceColors.buttonFill,
                            decoration: isCompleted ? TextDecoration.lineThrough : null,
                          ),
                        ),
                      ),
                      if (isCritical)
                        Icon(
                          Icons.priority_high,
                          color: Colors.red,
                          size: 16,
                        ),
                      if (isAISuggested)
                        Icon(
                          Icons.psychology,
                          color: PerseveranceColors.buttonFill,
                          size: 16,
                        ),
                    ],
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
                  if (item['assignedTo'] != null) ...[
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          size: 12,
                          color: PerseveranceColors.secondaryText,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Assigned to: ${item['assignedTo']}',
                          style: TextStyle(
                            fontSize: 10,
                            color: PerseveranceColors.secondaryText,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            IconButton(
              onPressed: () => _showItemDetails(item),
              icon: Icon(
                Icons.info_outline,
                color: PerseveranceColors.buttonFill,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressSection() {
    final categories = [
      {'name': 'Robot Inspection', 'progress': 0.8},
      {'name': 'Pit Setup', 'progress': 0.6},
      {'name': 'Tool Inventory', 'progress': 0.9},
      {'name': 'Team Roles', 'progress': 0.7},
    ];

    return Card(
      color: PerseveranceColors.background,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Overall Progress',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
            const SizedBox(height: 12),
            ...categories.map((category) => _buildProgressItem(category)),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressItem(Map<String, dynamic> category) {
    final progress = category['progress'] as double;
    final percentage = (progress * 100).toInt();

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                category['name'],
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: PerseveranceColors.buttonFill,
                ),
              ),
              Text(
                '$percentage%',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: PerseveranceColors.buttonFill,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: PerseveranceColors.secondaryButtonText,
            valueColor: AlwaysStoppedAnimation<Color>(PerseveranceColors.buttonFill),
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _getChecklistItems() {
    switch (_selectedCategory) {
      case 'Robot Inspection':
        return [
          {
            'id': '1',
            'title': 'Robot weight check',
            'description': 'Ensure robot is under 18 lbs',
            'completed': true,
            'critical': true,
            'aiSuggested': false,
            'assignedTo': 'Mechanical Team',
          },
          {
            'id': '2',
            'title': 'Battery inspection',
            'description': 'Check all batteries are fully charged',
            'completed': true,
            'critical': true,
            'aiSuggested': true,
            'assignedTo': 'Electrical Team',
          },
          {
            'id': '3',
            'title': 'Safety inspection',
            'description': 'Verify all safety features are functional',
            'completed': false,
            'critical': true,
            'aiSuggested': false,
            'assignedTo': 'Safety Officer',
          },
          {
            'id': '4',
            'title': 'Autonomous testing',
            'description': 'Test autonomous routines',
            'completed': false,
            'critical': false,
            'aiSuggested': true,
            'assignedTo': 'Programming Team',
          },
        ];
      case 'Pit Setup':
        return [
          {
            'id': '5',
            'title': 'Pit area setup',
            'description': 'Organize pit area with tools and parts',
            'completed': true,
            'critical': false,
            'aiSuggested': false,
            'assignedTo': 'Pit Crew',
          },
          {
            'id': '6',
            'title': 'Tool organization',
            'description': 'Arrange tools for easy access',
            'completed': false,
            'critical': false,
            'aiSuggested': true,
            'assignedTo': 'Pit Crew',
          },
          {
            'id': '7',
            'title': 'Safety equipment',
            'description': 'Ensure safety equipment is available',
            'completed': true,
            'critical': true,
            'aiSuggested': false,
            'assignedTo': 'Safety Officer',
          },
        ];
      case 'Tool Inventory':
        return [
          {
            'id': '8',
            'title': 'Spare parts check',
            'description': 'Inventory all spare parts',
            'completed': true,
            'critical': false,
            'aiSuggested': true,
            'assignedTo': 'Mechanical Team',
          },
          {
            'id': '9',
            'title': 'Tool checklist',
            'description': 'Verify all tools are packed',
            'completed': false,
            'critical': true,
            'aiSuggested': false,
            'assignedTo': 'Pit Crew',
          },
          {
            'id': '10',
            'title': 'Battery backup',
            'description': 'Pack extra batteries',
            'completed': true,
            'critical': true,
            'aiSuggested': true,
            'assignedTo': 'Electrical Team',
          },
        ];
      case 'Team Roles':
        return [
          {
            'id': '11',
            'title': 'Driver assignments',
            'description': 'Assign primary and backup drivers',
            'completed': true,
            'critical': true,
            'aiSuggested': false,
            'assignedTo': 'Coach',
          },
          {
            'id': '12',
            'title': 'Pit crew roles',
            'description': 'Assign pit crew responsibilities',
            'completed': false,
            'critical': false,
            'aiSuggested': true,
            'assignedTo': 'Team Captain',
          },
          {
            'id': '13',
            'title': 'Scouting team',
            'description': 'Assign scouting responsibilities',
            'completed': false,
            'critical': false,
            'aiSuggested': true,
            'assignedTo': 'Team Captain',
          },
        ];
      default:
        return [];
    }
  }

  void _showItemDetails(Map<String, dynamic> item) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          item['title'],
          style: TextStyle(color: PerseveranceColors.buttonFill),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (item['description'] != null) ...[
              Text(
                'Description:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: PerseveranceColors.buttonFill,
                ),
              ),
              Text(
                item['description'],
                style: TextStyle(color: PerseveranceColors.secondaryText),
              ),
              const SizedBox(height: 16),
            ],
            if (item['assignedTo'] != null) ...[
              Text(
                'Assigned to: ${item['assignedTo']}',
                style: TextStyle(color: PerseveranceColors.secondaryText),
              ),
              const SizedBox(height: 16),
            ],
            if (item['aiSuggested'] == true) ...[
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
                        'AI-suggested priority item',
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
} 