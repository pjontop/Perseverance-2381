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

  @override
  void initState() {
    super.initState();
    if (widget.members.isNotEmpty) {
      _assignee = widget.members.first;
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
                onChanged: (v) => setState(() => _title = v),
                validator: (v) => v == null || v.isEmpty ? 'Enter a title' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Description'),
                onChanged: (v) => setState(() => _description = v),
                maxLines: 2,
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
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
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
              Navigator.of(context).pop();
            }
          },
          child: const Text('Create'),
        ),
      ],
    );
  }
} 