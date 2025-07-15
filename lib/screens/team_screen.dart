import 'package:flutter/material.dart';
import '../models/member.dart';
import '../models/task.dart';
import '../models/meeting.dart';
import '../utils/colors.dart';
import '../widgets/team/member_card.dart';
import '../widgets/team/task_card.dart';
import '../widgets/team/meeting_card.dart';
import '../widgets/team/add_task_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/app_providers.dart';
import '../models/user.dart' as app_user;
import '../models/competition/task_model.dart' as comp_task;
import '../models/task.dart' as local_task;
import '../widgets/team/add_meeting_dialog.dart';

class TeamScreen extends ConsumerStatefulWidget {
  const TeamScreen({super.key});

  @override
  ConsumerState<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends ConsumerState<TeamScreen> {
  String searchQuery = '';
  TaskStatus? filterStatus;
  TaskPriority? filterPriority;
  String? filterAssignee;

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final teamId = (authState.valueOrNull?.teamId ?? '');
    final userId = (authState.valueOrNull?.id ?? '');
    final membersAsync = ref.watch(_teamCollectionProvider('members', teamId));
    final tasksAsync = ref.watch(_teamCollectionProvider('tasks', teamId));
    final meetingsAsync = ref.watch(_teamCollectionProvider('meetings', teamId));

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
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            onPressed: () => _showAddTaskDialog(context),
            icon: const Icon(Icons.add_task),
            label: const Text('New Task'),
            backgroundColor: PerseveranceColors.buttonFill,
            foregroundColor: PerseveranceColors.primaryButtonText,
          ),
          const SizedBox(height: 12),
          if (membersAsync is AsyncData && (membersAsync.value as List).isNotEmpty)
            FloatingActionButton.extended(
              onPressed: () => _showAddMeetingDialog(context),
              icon: const Icon(Icons.calendar_month),
              label: const Text('New Meeting'),
              backgroundColor: PerseveranceColors.buttonFill,
              foregroundColor: PerseveranceColors.primaryButtonText,
            ),
        ],
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
              AsyncValueWidget(
                value: membersAsync,
                builder: (members) => _buildMembersList(members),
              ),
              const SizedBox(height: 24),

              // Attendance Tracking
              _buildSectionHeader(context, 'Attendance', icon: Icons.check_circle),
              const SizedBox(height: 8),
              AsyncValueWidget(
                value: membersAsync,
                builder: (members) => _buildAttendanceSummary(members),
              ),
              const SizedBox(height: 24),

              // Task Assignment Board
              _buildSectionHeader(context, 'Task Board', icon: Icons.assignment),
              const SizedBox(height: 8),
              _buildTaskFilters(),
              const SizedBox(height: 8),
              AsyncValueWidget(
                value: tasksAsync,
                builder: (tasks) {
                  final filteredTasks = tasks.where((task) {
                    final matchesQuery = searchQuery.isEmpty || (task['title'] ?? '').toLowerCase().contains(searchQuery.toLowerCase());
                    final matchesStatus = filterStatus == null || task['status'] == filterStatus?.toString();
                    final matchesPriority = filterPriority == null || task['priority'] == filterPriority?.toString();
                    final matchesAssignee = filterAssignee == null || task['assignedTo'] == filterAssignee;
                    return matchesQuery && matchesStatus && matchesPriority && matchesAssignee;
                  }).toList();
                  return _buildTasksList(filteredTasks);
                },
              ),
              const SizedBox(height: 24),

              // Meeting Scheduler
              _buildSectionHeader(context, 'Upcoming Meetings', icon: Icons.calendar_month),
              const SizedBox(height: 8),
              AsyncValueWidget(
                value: meetingsAsync,
                builder: (meetings) => _buildMeetingsList(meetings),
              ),
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

  Widget _buildMembersList(List<dynamic> members) {
    return Column(
      children: members.map((m) => MemberCard(member: _userMapToMember(m), onTap: () => _showMemberDetails(_userMapToMember(m)))).toList(),
    );
  }

  Widget _buildAttendanceSummary(List<dynamic> members) {
    final present = members.where((m) => m['attendanceStatus'] == 'present').length;
    final absent = members.where((m) => m['attendanceStatus'] == 'absent').length;
    final late = members.where((m) => m['attendanceStatus'] == 'late').length;
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
              onPressed: () async {
                // Example: Mark current user as present
                final authState = ref.read(authProvider);
                final userId = authState.valueOrNull?.id;
                if (userId != null) {
                  final db = ref.read(databaseServiceProvider);
                  await db.updateDocument(
                    collectionId: 'users',
                    documentId: userId,
                    data: {'attendanceStatus': 'present'},
                  );
                  setState(() {});
                }
              },
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
    // Get members for the assignee filter
    final authState = ref.watch(authProvider);
    final teamId = (authState.valueOrNull?.teamId ?? '');
    final membersAsync = ref.watch(_teamCollectionProvider('members', teamId));
    List<Member> members = [];
    if (membersAsync is AsyncData) {
      members = (membersAsync.value as List<dynamic>).map((m) => _userMapToMember(m)).toList();
    }
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

  Widget _buildTasksList(List<dynamic> filteredTasks) {
    if (filteredTasks.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Center(
          child: Text('No tasks found.', style: TextStyle(color: PerseveranceColors.secondaryButtonText.withValues(alpha: 0.7))),
        ),
      );
    }
    return Column(
      children: filteredTasks.map((t) {
        final compTask = comp_task.Task.fromJson(t);
        final localTask = _competitionTaskToLocalTask(compTask);
        return TaskCard(
          task: localTask,
          onTap: () => _showTaskDetails(compTask),
          onEdit: (task) async {
            final db = ref.read(databaseServiceProvider);
            // Show a dialog or navigate to an edit screen as needed
            // For now, just mark as 'editing' (example)
            await db.updateDocument(
              collectionId: 'tasks',
              documentId: task['id'],
              data: {'status': 'editing'},
            );
            setState(() {});
          },
          onComplete: (task) async {
            final db = ref.read(databaseServiceProvider);
            await db.updateDocument(
              collectionId: 'tasks',
              documentId: task['id'],
              data: {'status': 'completed'},
            );
            setState(() {});
          },
        );
      }).toList(),
    );
  }

  Widget _buildMeetingsList(List<dynamic> meetings) {
    if (meetings.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Center(
          child: Text('No upcoming meetings.', style: TextStyle(color: PerseveranceColors.secondaryButtonText.withValues(alpha: 0.7))),
        ),
      );
    }
    // For now, just pass the raw map to MeetingCard or create a helper if needed
    return Column(
      children: meetings.map((m) => MeetingCard(meeting: m)).toList(),
    );
  }

  // --- Dialogs and Actions ---
  void _showAddTaskDialog(BuildContext context) {
    final authState = ref.read(authProvider);
    final teamId = (authState.valueOrNull?.teamId ?? '');
    final userId = (authState.valueOrNull?.id ?? '');
    final membersAsync = ref.read(_teamCollectionProvider('members', teamId));
    List<Member> members = [];
    if (membersAsync is AsyncData) {
      members = (membersAsync.value as List<dynamic>).map((m) => _userMapToMember(m)).toList();
    }
    showDialog(
      context: context,
      builder: (ctx) => AddTaskDialog(
        members: members,
        onCreate: (task) async {
          final databaseNotifier = ref.read(databaseProvider.notifier);
          final now = DateTime.now();
          final data = {
            'title': task.title,
            'description': task.description,
            'assignedTo': task.assignedTo,
            'teamId': teamId,
            'status': task.status.name,
            'priority': task.priority.name,
            'dueDate': task.dueDate.toIso8601String(),
            'createdBy': userId,
            'createdAt': now.toIso8601String(),
          };
          final success = await databaseNotifier.createDocument(
            collectionId: 'tasks',
            data: data,
          );
          if (success) {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Task created successfully!')),
              );
            }
          } else {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Failed to create task.')),
              );
            }
          }
        },
      ),
    );
  }

  void _showAddMeetingDialog(BuildContext context) {
    final authState = ref.read(authProvider);
    final teamId = (authState.valueOrNull?.teamId ?? '');
    final userId = (authState.valueOrNull?.id ?? '');
    final membersAsync = ref.read(_teamCollectionProvider('members', teamId));
    List<Member> members = [];
    if (membersAsync is AsyncData) {
      members = (membersAsync.value as List<dynamic>).map((m) => _userMapToMember(m)).toList();
    }
    showDialog(
      context: context,
      builder: (ctx) => AddMeetingDialog(
        members: members,
        teamId: teamId,
        userId: userId,
        onCreate: (meeting) async {
          final databaseNotifier = ref.read(databaseProvider.notifier);
          final now = DateTime.now();
          final data = {
            'title': meeting.title,
            'dateTime': meeting.dateTime.toIso8601String(),
            'location': meeting.location,
            'attendees': meeting.attendees.map((m) => m.id).toList(),
            'type': meeting.type.name,
            'notes': meeting.notes,
            'teamId': teamId,
            'createdBy': userId,
            'createdAt': now.toIso8601String(),
          };
          final success = await databaseNotifier.createDocument(
            collectionId: 'meetings',
            data: data,
          );
          if (success) {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Meeting scheduled successfully!')),
              );
            }
          } else {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Failed to schedule meeting.')),
              );
            }
          }
        },
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

  void _showTaskDetails(comp_task.Task task) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(task.title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Description: ${task.description}'),
            Text('Assignee: ${task.assignedTo ?? ''}'),
            // Remove formattedDueDate, displayName, etc. if not present
            // Text('Due: ${task.formattedDueDate}'),
            // Text('Priority: ${task.priority.displayName}'),
            // Text('Status: ${task.status.displayName}'),
            // Text('Category: ${task.category.name[0].toUpperCase() + task.category.name.substring(1)}'),
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
      // final idx = tasks.indexWhere((t) => t.id == task.id); // tasks is not defined
      // if (idx != -1) {
      //   tasks[idx] = Task(
      //     id: task.id,
      //     title: task.title,
      //     description: task.description,
      //     dueDate: task.dueDate,
      //     priority: task.priority,
      //     status: TaskStatus.completed,
      //     assignedTo: task.assignedTo,
      //     category: task.category,
      //     completedAt: DateTime.now(),
      //   );
      // }
    });
  }

  void _quickCheckIn() {
    // For demo, randomly set all to present
    setState(() {
      // members = members.map((m) => Member( // members is not defined
      //   id: m.id,
      //   name: m.name,
      //   role: m.role,
      //   avatarUrl: m.avatarUrl,
      //   status: MemberStatus.present,
      //   hoursLogged: m.hoursLogged + 1.0,
      // )).toList();
    });
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Attendance checked in!')));
  }

  // --- Placeholder Data ---
  Member _userMapToMember(Map<String, dynamic> user) {
    // Map Appwrite user fields to Member fields as best as possible
    return Member(
      id: user['id'] ?? user['\$id'] ?? '',
      name: user['fullName'] ?? user['name'] ?? '',
      role: MemberRole.values.firstWhere(
        (e) => e.name == (user['role']?.toLowerCase() ?? ''),
        orElse: () => MemberRole.other,
      ),
      avatarUrl: user['photoUrl'] ?? user['avatarUrl'] ?? '',
      status: MemberStatus.present, // Default, as status is not in user model
      hoursLogged: (user['hoursLogged'] is num) ? user['hoursLogged'].toDouble() : 0.0,
    );
  }

  local_task.Task _competitionTaskToLocalTask(comp_task.Task t) {
    // Map fields as best as possible
    return local_task.Task(
      id: t.id,
      title: t.title,
      description: t.description,
      dueDate: t.deadline,
      priority: local_task.TaskPriority.values.firstWhere(
        (e) => e.name.toLowerCase() == t.priority.name.toLowerCase(),
        orElse: () => local_task.TaskPriority.medium,
      ),
      status: local_task.TaskStatus.values.firstWhere(
        (e) => e.name.toLowerCase() == t.status.name.toLowerCase(),
        orElse: () => local_task.TaskStatus.notStarted,
      ),
      assignedTo: t.assignedTo ?? '',
      category: local_task.TaskCategory.values.firstWhere(
        (e) => e.name.toLowerCase() == t.category.name.toLowerCase(),
        orElse: () => local_task.TaskCategory.other,
      ),
      completedAt: t.completedAt,
    );
  }
}

// Helper: Provider for team collection
final _teamCollectionProvider =
    (String collection, String teamId) => FutureProvider<List<dynamic>>((ref) async {
  final db = ref.watch(databaseServiceProvider);
  switch (collection) {
    case 'members':
      return db.getTeamMembers(teamId);
    case 'tasks':
      return db.getTeamTasks(teamId);
    case 'meetings':
      return db.getTeamMeetings(teamId);
    default:
      return [];
  }
});

// AsyncValueWidget for loading/error/data
class AsyncValueWidget<T> extends StatelessWidget {
  final AsyncValue<T> value;
  final Widget Function(T data) builder;
  const AsyncValueWidget({required this.value, required this.builder, super.key});
  @override
  Widget build(BuildContext context) {
    return value.when(
      data: builder,
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
    );
  }
} 