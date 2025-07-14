import 'package:flutter/material.dart';
import '../models/member.dart';
import '../models/task.dart';
import '../models/meeting.dart';
import '../utils/colors.dart';
import '../widgets/team/member_card.dart';
import '../widgets/team/task_card.dart';
import '../widgets/team/meeting_card.dart';
import '../widgets/team/add_task_dialog.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({super.key});

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  // Placeholder data
  late List<Member> members;
  late List<Task> tasks;
  late List<Meeting> meetings;
  String searchQuery = '';
  TaskStatus? filterStatus;
  TaskPriority? filterPriority;
  String? filterAssignee;

  @override
  void initState() {
    super.initState();
    members = _getPlaceholderMembers();
    tasks = _getPlaceholderTasks();
    meetings = _getPlaceholderMeetings();
  }

  @override
  Widget build(BuildContext context) {
    final filteredTasks = tasks.where((task) {
      final matchesQuery = searchQuery.isEmpty || task.title.toLowerCase().contains(searchQuery.toLowerCase());
      final matchesStatus = filterStatus == null || task.status == filterStatus;
      final matchesPriority = filterPriority == null || task.priority == filterPriority;
      final matchesAssignee = filterAssignee == null || task.assignedTo == filterAssignee;
      return matchesQuery && matchesStatus && matchesPriority && matchesAssignee;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Team Management',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: PerseveranceColors.secondaryText,
          ),
        ),
        backgroundColor: PerseveranceColors.background,
        foregroundColor: PerseveranceColors.secondaryText,
        elevation: 0,
        centerTitle: true,
        scrolledUnderElevation: 0,
      ),
      backgroundColor: PerseveranceColors.background,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddTaskDialog(context),
        icon: const Icon(Icons.add_task),
        label: const Text('New Task'),
        backgroundColor: PerseveranceColors.buttonFill,
        foregroundColor: PerseveranceColors.primaryButtonText,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Team Members Section
              _buildSectionHeader(context, 'Team Members', icon: Icons.people),
              const SizedBox(height: 8),
              _buildMembersList(),
              const SizedBox(height: 24),

              // Attendance Tracking
              _buildSectionHeader(context, 'Attendance', icon: Icons.check_circle),
              const SizedBox(height: 8),
              _buildAttendanceSummary(),
              const SizedBox(height: 24),

              // Task Assignment Board
              _buildSectionHeader(context, 'Task Board', icon: Icons.assignment),
              const SizedBox(height: 8),
              _buildTaskFilters(),
              const SizedBox(height: 8),
              _buildTasksList(filteredTasks),
              const SizedBox(height: 24),

              // Meeting Scheduler
              _buildSectionHeader(context, 'Upcoming Meetings', icon: Icons.calendar_month),
              const SizedBox(height: 8),
              _buildMeetingsList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, {required IconData icon}) {
    return Row(
      children: [
        Icon(icon, color: PerseveranceColors.buttonFill, size: 22),
        const SizedBox(width: 8),
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: PerseveranceColors.secondaryText,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildMembersList() {
    return Column(
      children: members.map((m) => MemberCard(member: m, onTap: () => _showMemberDetails(m))).toList(),
    );
  }

  Widget _buildAttendanceSummary() {
    final present = members.where((m) => m.status == MemberStatus.present).length;
    final absent = members.where((m) => m.status == MemberStatus.absent).length;
    final late = members.where((m) => m.status == MemberStatus.late).length;
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildAttendanceStat('Present', present, Colors.green),
            _buildAttendanceStat('Absent', absent, Colors.red),
            _buildAttendanceStat('Late', late, Colors.orange),
            const SizedBox(width: 12),
            ElevatedButton.icon(
              onPressed: _quickCheckIn,
              icon: const Icon(Icons.how_to_reg),
              label: const Text('Check-In'),
              style: ElevatedButton.styleFrom(
                backgroundColor: PerseveranceColors.buttonFill,
                foregroundColor: PerseveranceColors.primaryButtonText,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAttendanceStat(String label, int value, Color color) {
    return Column(
      children: [
        Text('$value', style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 20)),
        const SizedBox(height: 2),
        Text(label, style: TextStyle(color: color, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildTaskFilters() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search tasks...',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: PerseveranceColors.secondaryText.withValues(alpha: 0.08),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
            ),
            onChanged: (v) => setState(() => searchQuery = v),
          ),
        ),
        const SizedBox(width: 8),
        _buildDropdownFilter<TaskStatus>(
          label: 'Status',
          value: filterStatus,
          items: TaskStatus.values,
          display: (s) => s.displayName,
          onChanged: (s) => setState(() => filterStatus = s),
        ),
        const SizedBox(width: 8),
        _buildDropdownFilter<TaskPriority>(
          label: 'Priority',
          value: filterPriority,
          items: TaskPriority.values,
          display: (p) => p.displayName,
          onChanged: (p) => setState(() => filterPriority = p),
        ),
        const SizedBox(width: 8),
        _buildDropdownFilter<String>(
          label: 'Assignee',
          value: filterAssignee,
          items: ['All', ...members.map((m) => m.name)],
          display: (s) => s,
          onChanged: (s) => setState(() => filterAssignee = s == 'All' ? null : s),
        ),
      ],
    );
  }

  Widget _buildDropdownFilter<T>({required String label, required T? value, required List<T> items, required String Function(T) display, required void Function(T?) onChanged}) {
    return DropdownButton<T>(
      value: value,
      hint: Text(label),
      items: items.map((e) => DropdownMenuItem<T>(value: e, child: Text(display(e)))).toList(),
      onChanged: onChanged,
      underline: const SizedBox(),
      style: const TextStyle(fontSize: 14),
      isDense: true,
      isExpanded: false,
    );
  }

  Widget _buildTasksList(List<Task> filteredTasks) {
    if (filteredTasks.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Center(
          child: Text('No tasks found.', style: TextStyle(color: PerseveranceColors.secondaryButtonText.withValues(alpha: 0.7))),
        ),
      );
    }
    return Column(
      children: filteredTasks.map((t) => TaskCard(
        task: t,
        onTap: () => _showTaskDetails(t),
        onEdit: () => _editTask(t),
        onComplete: () => _markTaskComplete(t),
      )).toList(),
    );
  }

  Widget _buildMeetingsList() {
    if (meetings.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Center(
          child: Text('No upcoming meetings.', style: TextStyle(color: PerseveranceColors.secondaryButtonText.withValues(alpha: 0.7))),
        ),
      );
    }
    return Column(
      children: meetings.map((m) => MeetingCard(meeting: m)).toList(),
    );
  }

  // --- Dialogs and Actions ---
  void _showAddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AddTaskDialog(
        members: members,
        onCreate: (task) => setState(() => tasks.add(task)),
      ),
    );
  }

  void _showMemberDetails(Member member) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(member.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Role: ${member.roleDisplay}'),
            Text('Status: ${member.statusText}'),
            Text('Hours Logged: ${member.hoursLogged.toStringAsFixed(1)}h'),
          ],
        ),
        actions: [TextButton(onPressed: () => Navigator.of(ctx).pop(), child: const Text('Close'))],
      ),
    );
  }

  void _showTaskDetails(Task task) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(task.title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Description: ${task.description}'),
            Text('Assignee: ${task.assignedTo}'),
            Text('Due: ${task.formattedDueDate}'),
            Text('Priority: ${task.priority.displayName}'),
            Text('Status: ${task.status.displayName}'),
            Text('Category: ${task.category.name[0].toUpperCase() + task.category.name.substring(1)}'),
          ],
        ),
        actions: [TextButton(onPressed: () => Navigator.of(ctx).pop(), child: const Text('Close'))],
      ),
    );
  }

  void _editTask(Task task) {
    // For demo, just show a snackbar
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Edit task (not implemented)')));
  }

  void _markTaskComplete(Task task) {
    setState(() {
      final idx = tasks.indexWhere((t) => t.id == task.id);
      if (idx != -1) {
        tasks[idx] = Task(
          id: task.id,
          title: task.title,
          description: task.description,
          dueDate: task.dueDate,
          priority: task.priority,
          status: TaskStatus.completed,
          assignedTo: task.assignedTo,
          category: task.category,
          completedAt: DateTime.now(),
        );
      }
    });
  }

  void _quickCheckIn() {
    // For demo, randomly set all to present
    setState(() {
      members = members.map((m) => Member(
        id: m.id,
        name: m.name,
        role: m.role,
        avatarUrl: m.avatarUrl,
        status: MemberStatus.present,
        hoursLogged: m.hoursLogged + 1.0,
      )).toList();
    });
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Attendance checked in!')));
  }

  // --- Placeholder Data ---
  List<Member> _getPlaceholderMembers() {
    return [
      Member(id: '1', name: 'Alex Johnson', role: MemberRole.captain, avatarUrl: '', status: MemberStatus.present, hoursLogged: 42.5),
      Member(id: '2', name: 'Sarah Chen', role: MemberRole.programmer, avatarUrl: '', status: MemberStatus.present, hoursLogged: 38.0),
      Member(id: '3', name: 'Mike Rodriguez', role: MemberRole.builder, avatarUrl: '', status: MemberStatus.late, hoursLogged: 29.5),
      Member(id: '4', name: 'Emma Wilson', role: MemberRole.strategist, avatarUrl: '', status: MemberStatus.absent, hoursLogged: 25.0),
      Member(id: '5', name: 'Priya Patel', role: MemberRole.driver, avatarUrl: '', status: MemberStatus.present, hoursLogged: 33.2),
      Member(id: '6', name: 'Liam Smith', role: MemberRole.documenter, avatarUrl: '', status: MemberStatus.present, hoursLogged: 19.8),
    ];
  }

  List<Task> _getPlaceholderTasks() {
    final now = DateTime.now();
    return [
      Task(id: '1', title: 'Design new intake', description: 'Sketch and CAD the new intake system.', dueDate: now.add(const Duration(days: 2)), priority: TaskPriority.high, status: TaskStatus.inProgress, assignedTo: 'Alex Johnson', category: TaskCategory.design),
      Task(id: '2', title: 'Build chassis', description: 'Assemble the new chassis frame.', dueDate: now.add(const Duration(days: 3)), priority: TaskPriority.medium, status: TaskStatus.notStarted, assignedTo: 'Mike Rodriguez', category: TaskCategory.build),
      Task(id: '3', title: 'Write autonomous code', description: 'Program autonomous routines for competition.', dueDate: now.add(const Duration(days: 1)), priority: TaskPriority.high, status: TaskStatus.inProgress, assignedTo: 'Sarah Chen', category: TaskCategory.programming),
      Task(id: '4', title: 'Document build process', description: 'Update engineering notebook.', dueDate: now.add(const Duration(days: 4)), priority: TaskPriority.low, status: TaskStatus.review, assignedTo: 'Liam Smith', category: TaskCategory.documentation),
      Task(id: '5', title: 'Test lift mechanism', description: 'Test and tune the lift.', dueDate: now.add(const Duration(days: 2)), priority: TaskPriority.medium, status: TaskStatus.notStarted, assignedTo: 'Mike Rodriguez', category: TaskCategory.build),
      Task(id: '6', title: 'Strategy meeting', description: 'Plan match strategies.', dueDate: now.add(const Duration(days: 1)), priority: TaskPriority.medium, status: TaskStatus.notStarted, assignedTo: 'Emma Wilson', category: TaskCategory.design),
      Task(id: '7', title: 'Sensor calibration', description: 'Calibrate all sensors.', dueDate: now.add(const Duration(days: 3)), priority: TaskPriority.low, status: TaskStatus.completed, assignedTo: 'Priya Patel', category: TaskCategory.programming, completedAt: now.subtract(const Duration(hours: 2))),
      Task(id: '8', title: 'Update documentation', description: 'Add new photos to notebook.', dueDate: now.add(const Duration(days: 5)), priority: TaskPriority.low, status: TaskStatus.notStarted, assignedTo: 'Liam Smith', category: TaskCategory.documentation),
      Task(id: '9', title: 'Competition checklist', description: 'Prepare checklist for next event.', dueDate: now.add(const Duration(days: 2)), priority: TaskPriority.high, status: TaskStatus.review, assignedTo: 'Alex Johnson', category: TaskCategory.other),
      Task(id: '10', title: 'Debug drive code', description: 'Fix issues with drive control.', dueDate: now.add(const Duration(days: 1)), priority: TaskPriority.high, status: TaskStatus.inProgress, assignedTo: 'Sarah Chen', category: TaskCategory.programming),
    ];
  }

  List<Meeting> _getPlaceholderMeetings() {
    final now = DateTime.now();
    return [
      Meeting(id: '1', title: 'Weekly Team Meeting', dateTime: now.add(const Duration(days: 1, hours: 2)), location: 'Robotics Lab', attendees: members, type: MeetingType.team),
      Meeting(id: '2', title: 'Build Session', dateTime: now.add(const Duration(days: 2, hours: 3)), location: 'Workshop', attendees: members.where((m) => m.role == MemberRole.builder || m.role == MemberRole.driver).toList(), type: MeetingType.build),
      Meeting(id: '3', title: 'Competition Prep', dateTime: now.add(const Duration(days: 4)), location: 'School Gym', attendees: members, type: MeetingType.competitionPrep),
    ];
  }
} 