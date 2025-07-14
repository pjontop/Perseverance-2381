import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../utils/colors.dart';
import '../../services/haptic_service.dart';

class ResourceUtilizationWidget extends ConsumerStatefulWidget {
  const ResourceUtilizationWidget({super.key});

  @override
  ConsumerState<ResourceUtilizationWidget> createState() => _ResourceUtilizationWidgetState();
}

class _ResourceUtilizationWidgetState extends ConsumerState<ResourceUtilizationWidget> {
  String _selectedResource = 'Parts Usage';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 16),
          _buildResourceSelector(),
          const SizedBox(height: 16),
          _buildSelectedResource(),
          const SizedBox(height: 16),
          _buildResourceSummary(),
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
              'Resource Utilization',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Track parts, tools, budget, and inventory efficiency',
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

  Widget _buildResourceSelector() {
    final resources = [
      'Parts Usage',
      'Tool Checkout',
      'Budget Tracking',
      'Inventory Turnover',
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: resources.map((resource) {
          final isSelected = _selectedResource == resource;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FilterChip(
              label: Text(resource),
              selected: isSelected,
              onSelected: (selected) {
                HapticService.chartInteraction();
                setState(() {
                  _selectedResource = resource;
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

  Widget _buildSelectedResource() {
    switch (_selectedResource) {
      case 'Parts Usage':
        return _buildPartsUsage();
      case 'Tool Checkout':
        return _buildToolCheckout();
      case 'Budget Tracking':
        return _buildBudgetTracking();
      case 'Inventory Turnover':
        return _buildInventoryTurnover();
      default:
        return _buildPartsUsage();
    }
  }

  Widget _buildPartsUsage() {
    return Card(
      color: PerseveranceColors.background,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Parts Usage Patterns',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
            const SizedBox(height: 16),
            _buildPartsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildPartsList() {
    final parts = [
      {'name': 'Motors', 'usage': '85%', 'stock': '12', 'status': 'Good'},
      {'name': 'Gears', 'usage': '92%', 'stock': '8', 'status': 'Low'},
      {'name': 'Screws', 'usage': '78%', 'stock': '150', 'status': 'Good'},
      {'name': 'Batteries', 'usage': '95%', 'stock': '6', 'status': 'Critical'},
      {'name': 'Controllers', 'usage': '88%', 'stock': '4', 'status': 'Low'},
    ];

    return Column(
      children: parts.map((part) => _buildPartCard(part)).toList(),
    );
  }

  Widget _buildPartCard(Map<String, dynamic> part) {
    Color statusColor;
    IconData statusIcon;
    
    switch (part['status']) {
      case 'Good':
        statusColor = Colors.green;
        statusIcon = Icons.check_circle;
        break;
      case 'Low':
        statusColor = Colors.orange;
        statusIcon = Icons.warning;
        break;
      case 'Critical':
        statusColor = Colors.red;
        statusIcon = Icons.error;
        break;
      default:
        statusColor = Colors.grey;
        statusIcon = Icons.info;
    }

    return Card(
      color: PerseveranceColors.primaryButtonText,
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    part['name'],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: PerseveranceColors.background,
                    ),
                  ),
                  Text(
                    'Usage: ${part['usage']} • Stock: ${part['stock']}',
                    style: TextStyle(
                      fontSize: 12,
                      color: PerseveranceColors.secondaryText,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              statusIcon,
              color: statusColor,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToolCheckout() {
    return Card(
      color: PerseveranceColors.background,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tool Checkout Frequency',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
            const SizedBox(height: 16),
            _buildToolStats(),
          ],
        ),
      ),
    );
  }

  Widget _buildToolStats() {
    final tools = [
      {'name': 'Drill', 'checkouts': '24', 'avgTime': '2.5h', 'efficiency': '85%'},
      {'name': 'Screwdriver', 'checkouts': '18', 'avgTime': '1.2h', 'efficiency': '92%'},
      {'name': 'Wrench Set', 'checkouts': '12', 'avgTime': '3.1h', 'efficiency': '78%'},
      {'name': 'Multimeter', 'checkouts': '8', 'avgTime': '1.8h', 'efficiency': '88%'},
    ];

    return Column(
      children: tools.map((tool) => _buildToolCard(tool)).toList(),
    );
  }

  Widget _buildToolCard(Map<String, dynamic> tool) {
    return Card(
      color: PerseveranceColors.primaryButtonText,
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tool['name'],
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
                  child: _buildToolMetric('Checkouts', tool['checkouts']),
                ),
                Expanded(
                  child: _buildToolMetric('Avg Time', tool['avgTime']),
                ),
                Expanded(
                  child: _buildToolMetric('Efficiency', tool['efficiency']),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToolMetric(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
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
            color: PerseveranceColors.background,
          ),
        ),
      ],
    );
  }

  Widget _buildBudgetTracking() {
    return Card(
      color: PerseveranceColors.background,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Budget Tracking & Spending Analysis',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
            const SizedBox(height: 16),
            _buildBudgetOverview(),
            const SizedBox(height: 16),
            _buildSpendingBreakdown(),
          ],
        ),
      ),
    );
  }

  Widget _buildBudgetOverview() {
    return Row(
      children: [
        Expanded(
          child: _buildBudgetCard('Total Budget', '\$2,500', Colors.blue),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildBudgetCard('Spent', '\$1,850', Colors.orange),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildBudgetCard('Remaining', '\$650', Colors.green),
        ),
      ],
    );
  }

  Widget _buildBudgetCard(String title, String amount, Color color) {
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
            amount,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpendingBreakdown() {
    final categories = [
      {'category': 'Parts', 'amount': '\$850', 'percentage': '46%'},
      {'category': 'Tools', 'amount': '\$420', 'percentage': '23%'},
      {'category': 'Competition Fees', 'amount': '\$380', 'percentage': '21%'},
      {'category': 'Travel', 'amount': '\$200', 'percentage': '11%'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Spending by Category',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: PerseveranceColors.buttonFill,
          ),
        ),
        const SizedBox(height: 8),
        ...categories.map((category) => _buildCategoryRow(category)),
      ],
    );
  }

  Widget _buildCategoryRow(Map<String, dynamic> category) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              category['category'],
              style: TextStyle(
                fontSize: 12,
                color: PerseveranceColors.buttonFill,
              ),
            ),
          ),
          Expanded(
            child: Text(
              category['amount'],
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
          ),
          Expanded(
            child: Text(
              category['percentage'],
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

  Widget _buildInventoryTurnover() {
    return Card(
      color: PerseveranceColors.background,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Inventory Turnover Rates',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
            const SizedBox(height: 16),
            _buildTurnoverStats(),
          ],
        ),
      ),
    );
  }

  Widget _buildTurnoverStats() {
    final items = [
      {'item': 'Motors', 'turnover': '2.3x', 'status': 'Optimal'},
      {'item': 'Gears', 'turnover': '1.8x', 'status': 'Good'},
      {'item': 'Screws', 'turnover': '4.2x', 'status': 'High'},
      {'item': 'Batteries', 'turnover': '1.2x', 'status': 'Low'},
    ];

    return Column(
      children: items.map((item) => _buildTurnoverCard(item)).toList(),
    );
  }

  Widget _buildTurnoverCard(Map<String, dynamic> item) {
    Color statusColor;
    
    switch (item['status']) {
      case 'Optimal':
        statusColor = Colors.green;
        break;
      case 'Good':
        statusColor = Colors.blue;
        break;
      case 'High':
        statusColor = Colors.orange;
        break;
      case 'Low':
        statusColor = Colors.red;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Card(
      color: PerseveranceColors.primaryButtonText,
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                item['item'],
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: PerseveranceColors.background,
                ),
              ),
            ),
            Text(
              item['turnover'],
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: statusColor,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: statusColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                item['status'],
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResourceSummary() {
    return Card(
      color: PerseveranceColors.background,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Resource Efficiency Summary',
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
                  child: _buildSummaryCard('Parts Efficiency', '87%', Colors.green),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildSummaryCard('Tool Utilization', '92%', Colors.blue),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _buildSummaryCard('Budget Efficiency', '74%', Colors.orange),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildSummaryCard('Inventory Turnover', '2.1x', Colors.purple),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(String title, String value, Color color) {
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
} 