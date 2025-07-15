import 'package:flutter/material.dart';
import '../../models/meeting.dart';
import '../../models/member.dart';
import '../../utils/colors.dart';
import '../../utils/ai_helpers.dart';

class AddMeetingDialog extends StatefulWidget {
  final List<Member> members;
  final void Function(Meeting) onCreate;
  final String teamId;
  final String userId;

  const AddMeetingDialog({
    super.key,
    required this.members,
    required this.onCreate,
    required this.teamId,
    required this.userId,
  });

  @override
  State<AddMeetingDialog> createState() => _AddMeetingDialogState();
}

class _AddMeetingDialogState extends State<AddMeetingDialog> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _location = '';
  DateTime _dateTime = DateTime.now().add(const Duration(days: 1));
  MeetingType _type = MeetingType.team;
  List<Member> _selectedAttendees = [];
  String _notes = '';

  // AI suggestion state
  String? _suggestedTitle;
  String? _suggestedNotes;
  String? _tipTitle;
  String? _tipNotes;
  DateTime? _suggestedDateTime;
  bool _loading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    if (widget.members.isNotEmpty) {
      _selectedAttendees = [widget.members.first];
    }
  }

  Future<void> _fetchTitleSuggestion(String input) async {
    setState(() { _suggestedTitle = null; _tipTitle = null; });
    if (input.isEmpty) return;
    // Example: Use AIHelpers.getTextCompletion for smart suggestion
    final suggestion = await AIHelpers.getTextCompletion(input, 'meeting_title');
    setState(() { _suggestedTitle = suggestion != input ? suggestion : null; });
    if (input.length < 4) setState(() { _tipTitle = 'Try to be more descriptive.'; });
  }

  Future<void> _fetchNotesSuggestion(String input) async {
    setState(() { _suggestedNotes = null; _tipNotes = null; });
    if (input.isEmpty) return;
    final suggestion = await AIHelpers.getTextCompletion(input, 'meeting_agenda');
    setState(() { _suggestedNotes = suggestion != input ? suggestion : null; });
    if (input.length < 8) setState(() { _tipNotes = 'Add more details to the agenda.'; });
  }

  Future<void> _fetchOptimalTime() async {
    setState(() { _suggestedDateTime = null; });
    final optimal = await AIHelpers.getOptimalNotificationTime('meeting', _dateTime, {});
    setState(() { _suggestedDateTime = optimal.isAfter(DateTime.now()) ? optimal : null; });
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() { _loading = true; _error = null; });
    try {
      final meeting = Meeting(
        id: '',
        title: _title,
        dateTime: _dateTime,
        location: _location,
        attendees: _selectedAttendees,
        type: _type,
        notes: _notes,
      );
      widget.onCreate(meeting);
      Navigator.of(context).pop();
    } catch (e) {
      setState(() { _error = 'Failed to create meeting. Please try again.'; });
    } finally {
      setState(() { _loading = false; });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Schedule New Meeting'),
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
                decoration: const InputDecoration(labelText: 'Location'),
                onChanged: (v) => setState(() => _location = v),
                validator: (v) => v == null || v.isEmpty ? 'Enter a location' : null,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: InputDatePickerFormField(
                      initialDate: _dateTime,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                      onDateSubmitted: (date) {
                        setState(() => _dateTime = DateTime(date.year, date.month, date.day, _dateTime.hour, _dateTime.minute));
                        _fetchOptimalTime();
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: 'Time (HH:MM)'),
                      initialValue: '${_dateTime.hour.toString().padLeft(2, '0')}:${_dateTime.minute.toString().padLeft(2, '0')}',
                      onChanged: (v) {
                        final parts = v.split(':');
                        if (parts.length == 2) {
                          final hour = int.tryParse(parts[0]) ?? _dateTime.hour;
                          final minute = int.tryParse(parts[1]) ?? _dateTime.minute;
                          setState(() => _dateTime = DateTime(_dateTime.year, _dateTime.month, _dateTime.day, hour, minute));
                          _fetchOptimalTime();
                        }
                      },
                    ),
                  ),
                ],
              ),
              if (_suggestedDateTime != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: GestureDetector(
                    onTap: () => setState(() => _dateTime = _suggestedDateTime!),
                    child: Row(
                      children: [
                        const Icon(Icons.schedule, size: 16, color: Colors.green),
                        const SizedBox(width: 4),
                        Text('Suggested: ${_suggestedDateTime!.toLocal()}'.split('.').first, style: TextStyle(color: Colors.green[800], fontSize: 13)),
                      ],
                    ),
                  ),
                ),
              const SizedBox(height: 12),
              DropdownButtonFormField<MeetingType>(
                value: _type,
                items: MeetingType.values.map((type) => DropdownMenuItem(
                  value: type,
                  child: Text(meetingTypeDisplay(type)),
                )).toList(),
                onChanged: (type) => setState(() => _type = type ?? MeetingType.team),
                decoration: const InputDecoration(labelText: 'Type'),
              ),
              const SizedBox(height: 12),
              // Attendees multi-select
              InputDecorator(
                decoration: const InputDecoration(labelText: 'Attendees'),
                child: Wrap(
                  spacing: 4,
                  children: widget.members.map((member) {
                    final selected = _selectedAttendees.contains(member);
                    return FilterChip(
                      label: Text(member.name),
                      selected: selected,
                      onSelected: (val) {
                        setState(() {
                          if (val) {
                            _selectedAttendees.add(member);
                          } else {
                            _selectedAttendees.remove(member);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Agenda / Notes'),
                minLines: 2,
                maxLines: 4,
                onChanged: (v) {
                  setState(() => _notes = v);
                  _fetchNotesSuggestion(v);
                },
              ),
              if (_suggestedNotes != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: GestureDetector(
                    onTap: () => setState(() => _notes = _suggestedNotes!),
                    child: Row(
                      children: [
                        const Icon(Icons.lightbulb, size: 16, color: Colors.amber),
                        const SizedBox(width: 4),
                        Text('Suggested: $_suggestedNotes', style: TextStyle(color: Colors.amber[800], fontSize: 13)),
                      ],
                    ),
                  ),
                ),
              if (_tipNotes != null)
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Row(
                    children: [
                      const Icon(Icons.info_outline, size: 14, color: Colors.blueGrey),
                      const SizedBox(width: 4),
                      Text('Tip: $_tipNotes', style: const TextStyle(color: Colors.blueGrey, fontSize: 12)),
                    ],
                  ),
                ),
              if (_error != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(_error!, style: const TextStyle(color: Colors.red)),
                ),
              if (_loading)
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Center(child: CircularProgressIndicator()),
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
        ElevatedButton(
          onPressed: _loading ? null : _submit,
          child: const Text('Create'),
        ),
      ],
    );
  }
}

String meetingTypeDisplay(MeetingType type) {
  switch (type) {
    case MeetingType.team:
      return 'Team Meeting';
    case MeetingType.build:
      return 'Build Session';
    case MeetingType.competitionPrep:
      return 'Competition Prep';
    case MeetingType.other:
      return 'Other';
  }
} 