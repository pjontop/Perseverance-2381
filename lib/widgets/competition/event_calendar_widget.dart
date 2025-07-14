import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../utils/colors.dart';

class EventCalendarWidget extends ConsumerStatefulWidget {
  const EventCalendarWidget({super.key});

  @override
  ConsumerState<EventCalendarWidget> createState() => _EventCalendarWidgetState();
}

class _EventCalendarWidgetState extends ConsumerState<EventCalendarWidget> {
  DateTime _selectedDate = DateTime.now();
  String _selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildCalendarHeader(),
          const SizedBox(height: 16),
          _buildFilterChips(),
          const SizedBox(height: 16),
          _buildEventList(),
          const SizedBox(height: 16),
          _buildTravelSection(),
          const SizedBox(height: 16),
          _buildRegistrationSection(),
        ],
      ),
    );
  }

  Widget _buildCalendarHeader() {
    return Card(
      color: PerseveranceColors.background,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Competition Calendar',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _selectedDate = _selectedDate.subtract(const Duration(days: 1));
                    });
                  },
                  icon: Icon(Icons.chevron_left, color: PerseveranceColors.buttonFill),
                ),
                Expanded(
                  child: Text(
                    '${_selectedDate.month}/${_selectedDate.day}/${_selectedDate.year}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: PerseveranceColors.buttonFill,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _selectedDate = _selectedDate.add(const Duration(days: 1));
                    });
                  },
                  icon: Icon(Icons.chevron_right, color: PerseveranceColors.buttonFill),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChips() {
    final filters = ['All', 'Registration', 'Travel', 'Competition', 'Deadlines'];
    
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

  Widget _buildEventList() {
    final events = _getEvents();
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Upcoming Events',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: PerseveranceColors.buttonFill,
          ),
        ),
        const SizedBox(height: 12),
        ...events.map((event) => _buildEventCard(event)),
      ],
    );
  }

  Widget _buildEventCard(Map<String, dynamic> event) {
    final isRegistration = event['type'] == 'registration';
    final isTravel = event['type'] == 'travel';
    final isCompetition = event['type'] == 'competition';
    
    Color statusColor;
    IconData statusIcon;
    
    switch (event['status']) {
      case 'completed':
        statusColor = Colors.green;
        statusIcon = Icons.check_circle;
        break;
      case 'pending':
        statusColor = Colors.orange;
        statusIcon = Icons.schedule;
        break;
      case 'overdue':
        statusColor = Colors.red;
        statusIcon = Icons.error;
        break;
      default:
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
                color: isRegistration 
                    ? Colors.blue 
                    : isTravel 
                        ? Colors.green 
                        : Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                isRegistration 
                    ? Icons.how_to_reg 
                    : isTravel 
                        ? Icons.flight 
                        : Icons.sports_esports,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event['title'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: PerseveranceColors.buttonFill,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    event['location'] ?? '',
                    style: TextStyle(
                      fontSize: 12,
                      color: PerseveranceColors.secondaryText,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 12,
                        color: PerseveranceColors.secondaryText,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        event['date'],
                        style: TextStyle(
                          fontSize: 12,
                          color: PerseveranceColors.secondaryText,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Icon(
                        statusIcon,
                        size: 12,
                        color: statusColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        event['status'].toString().toUpperCase(),
                        style: TextStyle(
                          fontSize: 10,
                          color: statusColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () => _showEventDetails(event),
              icon: Icon(
                Icons.chevron_right,
                color: PerseveranceColors.buttonFill,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTravelSection() {
    return Card(
      color: PerseveranceColors.background,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Travel Coordination',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
            const SizedBox(height: 12),
            _buildTravelItem('Hotel Booking', 'Holiday Inn Express', 'Confirmed', Icons.hotel),
            _buildTravelItem('Transportation', 'Team Van', 'Confirmed', Icons.directions_car),
            _buildTravelItem('Packing List', '75% Complete', 'In Progress', Icons.checklist),
            _buildTravelItem('Team Meeting', 'Pre-competition', 'Scheduled', Icons.group),
          ],
        ),
      ),
    );
  }

  Widget _buildTravelItem(String title, String details, String status, IconData icon) {
    Color statusColor = status == 'Confirmed' ? Colors.green : Colors.orange;
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: PerseveranceColors.buttonFill,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: PerseveranceColors.primaryButtonText,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: PerseveranceColors.buttonFill,
                  ),
                ),
                Text(
                  details,
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
              status,
              style: TextStyle(
                fontSize: 10,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegistrationSection() {
    return Card(
      color: PerseveranceColors.background,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Registration & Deadlines',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
            const SizedBox(height: 12),
            _buildDeadlineItem('Team Registration', '2024-02-15', 500, true),
            _buildDeadlineItem('Robot Inspection', '2024-02-20', 0, false),
            _buildDeadlineItem('Driver Meeting', '2024-02-25', 0, false),
            _buildDeadlineItem('Competition Start', '2024-03-01', 0, false),
          ],
        ),
      ),
    );
  }

  Widget _buildDeadlineItem(String title, String date, int fee, bool isPaid) {
    final daysUntil = DateTime.parse(date).difference(DateTime.now()).inDays;
    Color statusColor = daysUntil < 0 ? Colors.red : daysUntil < 7 ? Colors.orange : Colors.green;
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(
            isPaid ? Icons.payment : Icons.schedule,
            color: statusColor,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: PerseveranceColors.buttonFill,
                  ),
                ),
                Text(
                  'Due: $date',
                  style: TextStyle(
                    fontSize: 12,
                    color: PerseveranceColors.secondaryText,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (fee > 0)
                Text(
                  '\$$fee',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: PerseveranceColors.buttonFill,
                  ),
                ),
              Text(
                daysUntil < 0 ? 'Overdue' : '$daysUntil days',
                style: TextStyle(
                  fontSize: 10,
                  color: statusColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _getEvents() {
    return [
      {
        'id': '1',
        'title': 'VEX Robotics Competition',
        'location': 'San Jose Convention Center',
        'date': '2024-03-01',
        'type': 'competition',
        'status': 'pending',
      },
      {
        'id': '2',
        'title': 'Team Registration Deadline',
        'location': 'Online',
        'date': '2024-02-15',
        'type': 'registration',
        'status': 'completed',
      },
      {
        'id': '3',
        'title': 'Robot Inspection',
        'location': 'Competition Venue',
        'date': '2024-02-20',
        'type': 'registration',
        'status': 'pending',
      },
      {
        'id': '4',
        'title': 'Travel to Competition',
        'location': 'San Jose, CA',
        'date': '2024-02-28',
        'type': 'travel',
        'status': 'pending',
      },
    ];
  }

  void _showEventDetails(Map<String, dynamic> event) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.4,
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
                      Text(
                        event['title'],
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: PerseveranceColors.buttonFill,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildDetailRow('Date', event['date']),
                      _buildDetailRow('Location', event['location'] ?? 'TBD'),
                      _buildDetailRow('Status', event['status'].toString().toUpperCase()),
                      _buildDetailRow('Type', event['type'].toString().toUpperCase()),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () {
                          // TODO: Implement event actions
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: PerseveranceColors.buttonFill,
                          foregroundColor: PerseveranceColors.primaryButtonText,
                        ),
                        child: const Text('View Details'),
                      ),
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

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: PerseveranceColors.buttonFill,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: PerseveranceColors.secondaryText,
              ),
            ),
          ),
        ],
      ),
    );
  }
} 