import 'package:flutter/material.dart';
import '../../models/task.dart';
import '../../models/member.dart';

class AddTaskDialog extends StatefulWidget {
  final List<Member> members;
  final void Function(Task) onCreate;

  const AddTaskDialog({super.key, required this.members, required this.onCreate});

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _description = '';
  Member? _assignee;
  DateTime _dueDate = DateTime.now().add(const Duration(days: 1));
  TaskCategory _category = TaskCategory.design;
  TaskPriority _priority = TaskPriority.medium;
  TaskStatus _status = TaskStatus.notStarted;

  // AI suggestion state
  String? _suggestedTitle;
  String? _suggestedDescription;
  String? _tipTitle;
  String? _tipDescription;
  bool _loading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    if (widget.members.isNotEmpty) {
      _assignee = widget.members.first;
    }
  }

  Future<void> _fetchTitleSuggestion(String input) async {
    // TODO: Replace with actual AI service call
    // Simulate suggestion and tip
    if (input.isEmpty) {
      setState(() {
        _suggestedTitle = null;
        _tipTitle = null;
      });
      return;
    }
    // Example: If input is too short, show a tip
    if (input.length < 4) {
      setState(() {
        _suggestedTitle = null;
        _tipTitle = 'Try to be more descriptive.';
      });
    } else {
      setState(() {
        _suggestedTitle = 'Finish $input by Friday';
        _tipTitle = null;
      });
    }
  }

  Future<void> _fetchDescriptionSuggestion(String input) async {
    // TODO: Replace with actual AI service call
    if (input.isEmpty) {
      setState(() {
        _suggestedDescription = null;
        _tipDescription = null;
      });
      return;
    }
    if (input.length < 8) {
      setState(() {
        _suggestedDescription = null;
        _tipDescription = 'Add more details for clarity.';
      });
    } else {
      setState(() {
        _suggestedDescription = 'Remember to include all required steps.';
        _tipDescription = null;
      });
    }
  }

  Future<void> _createTask() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      // TODO: Replace with actual Appwrite service/provider call
      await Future.delayed(const Duration(seconds: 1)); // Simulate network
      // On success:
      widget.onCreate(
        Task(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          title: _title,
          description: _description,
          dueDate: _dueDate,
          priority: _priority,
          status: _status,
          assignedTo: _assignee?.name ?? '',
          category: _category,
        ),
      );
      if (mounted) Navigator.of(context).pop();
    } catch (e) {
      setState(() {
        _error = 'Failed to create task. Please try again.';
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create New Task'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Title'),
                onChanged: (v) {
                  setState(() => _title = v);
                  _fetchTitleSuggestion(v);
                },
                validator: (v) => v == null || v.isEmpty ? 'Enter a title' : null,
              ),
              if (_suggestedTitle != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: GestureDetector(
                    onTap: () => setState(() => _title = _suggestedTitle!),
                    child: Row(
                      children: [
                        const Icon(Icons.lightbulb, size: 16, color: Colors.amber),
                        const SizedBox(width: 4),
                        Text('Suggested: $_suggestedTitle', style: TextStyle(color: Colors.amber[800], fontSize: 13)),
                      ],
                    ),
                  ),
                ),
              if (_tipTitle != null)
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Row(
                    children: [
                      const Icon(Icons.info_outline, size: 14, color: Colors.blueGrey),
                      const SizedBox(width: 4),
                      Text('Tip: $_tipTitle', style: const TextStyle(color: Colors.blueGrey, fontSize: 12)),
                    ],
                  ),
                ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Description'),
                onChanged: (v) {
                  setState(() => _description = v);
                  _fetchDescriptionSuggestion(v);
                },
                maxLines: 2,
              ),
              if (_suggestedDescription != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: GestureDetector(
                    onTap: () => setState(() => _description = _suggestedDescription!),
                    child: Row(
                      children: [
                        const Icon(Icons.lightbulb, size: 16, color: Colors.amber),
                        const SizedBox(width: 4),
                        Text('Suggested: $_suggestedDescription', style: TextStyle(color: Colors.amber[800], fontSize: 13)),
                      ],
                    ),
                  ),
                ),
              if (_tipDescription != null)
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Row(
                    children: [
                      const Icon(Icons.info_outline, size: 14, color: Colors.blueGrey),
                      const SizedBox(width: 4),
                      Text('Tip: $_tipDescription', style: const TextStyle(color: Colors.blueGrey, fontSize: 12)),
                    ],
                  ),
                ),
              const SizedBox(height: 12),
              DropdownButtonFormField<Member>(
                value: _assignee,
                decoration: const InputDecoration(labelText: 'Assignee'),
                items: widget.members
                    .map((m) => DropdownMenuItem(
                          value: m,
                          child: Text(m.name),
                        ))
                    .toList(),
                onChanged: (m) => setState(() => _assignee = m),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Text('Due Date:'),
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: _dueDate,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                      );
                      if (picked != null) setState(() => _dueDate = picked);
                    },
                    child: Text('${_dueDate.month}/${_dueDate.day}/${_dueDate.year}'),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<TaskCategory>(
                value: _category,
                decoration: const InputDecoration(labelText: 'Category'),
                items: TaskCategory.values
                    .map((c) => DropdownMenuItem(
                          value: c,
                          child: Text(c.name[0].toUpperCase() + c.name.substring(1)),
                        ))
                    .toList(),
                onChanged: (c) => setState(() => _category = c!),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<TaskPriority>(
                value: _priority,
                decoration: const InputDecoration(labelText: 'Priority'),
                items: TaskPriority.values
                    .map((p) => DropdownMenuItem(
                          value: p,
                          child: Text(p.displayName),
                        ))
                    .toList(),
                onChanged: (p) => setState(() => _priority = p!),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<TaskStatus>(
                value: _status,
                decoration: const InputDecoration(labelText: 'Status'),
                items: TaskStatus.values
                    .map((s) => DropdownMenuItem(
                          value: s,
                          child: Text(s.displayName),
                        ))
                    .toList(),
                onChanged: (s) => setState(() => _status = s!),
              ),
              if (_error != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(_error!, style: const TextStyle(color: Colors.red)),
                ),
              if (_loading)
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _loading ? null : () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: _loading
              ? null
              : () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _createTask();
                  }
                },
          child: const Text('Create'),
        ),
      ],
    );
  }
} 