import 'package:flutter/material.dart';
import '../../models/build_log.dart';
import '../../utils/colors.dart';

class AddBuildLogDialog extends StatefulWidget {
  final Function(BuildLog) onBuildLogAdded;
  final String teamId;
  final String userId;

  const AddBuildLogDialog({
    super.key,
    required this.onBuildLogAdded,
    required this.teamId,
    required this.userId,
  });

  @override
  State<AddBuildLogDialog> createState() => _AddBuildLogDialogState();
}

class _AddBuildLogDialogState extends State<AddBuildLogDialog> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _authorController = TextEditingController();
  final _tagsController = TextEditingController();
  final _robotVersionController = TextEditingController();
  
  BuildStatus _selectedStatus = BuildStatus.inProgress;
  double _progress = 0.5;
  final List<String> _tags = [];
  final Map<String, double> _performanceMetrics = {};

  // AI suggestion state
  String? _suggestedTitle;
  String? _suggestedDescription;
  String? _tipTitle;
  String? _tipDescription;
  bool _loading = false;
  String? _error;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _authorController.dispose();
    _tagsController.dispose();
    _robotVersionController.dispose();
    super.dispose();
  }

  Future<void> _fetchTitleSuggestion(String input) async {
    // TODO: Replace with actual AI service call
    if (input.isEmpty) {
      setState(() {
        _suggestedTitle = null;
        _tipTitle = null;
      });
      return;
    }
    if (input.length < 4) {
      setState(() {
        _suggestedTitle = null;
        _tipTitle = 'Try to be more descriptive.';
      });
    } else {
      setState(() {
        _suggestedTitle = 'Document $input for future reference';
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
        _suggestedDescription = 'Include steps, issues, and results.';
        _tipDescription = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Add Build Log Entry',
        style: TextStyle(
          color: PerseveranceColors.buttonFill,
          fontWeight: FontWeight.w600,
        ),
      ),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                onChanged: (v) => _fetchTitleSuggestion(v),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              if (_suggestedTitle != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: GestureDetector(
                    onTap: () => setState(() => _titleController.text = _suggestedTitle!),
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
              const SizedBox(height: 16),
              
              // Description
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                onChanged: (v) => _fetchDescriptionSuggestion(v),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              if (_suggestedDescription != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: GestureDetector(
                    onTap: () => setState(() => _descriptionController.text = _suggestedDescription!),
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
              const SizedBox(height: 16),
              
              // Robot Version
              TextFormField(
                controller: _robotVersionController,
                decoration: const InputDecoration(
                  labelText: 'Robot Version (e.g., V1, V2)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter robot version';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              
              // Author
              TextFormField(
                controller: _authorController,
                decoration: const InputDecoration(
                  labelText: 'Author',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter author name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              
              // Status
              DropdownButtonFormField<BuildStatus>(
                value: _selectedStatus,
                decoration: const InputDecoration(
                  labelText: 'Status',
                  border: OutlineInputBorder(),
                ),
                items: BuildStatus.values.map((status) => DropdownMenuItem(
                  value: status,
                  child: Text(status.displayName),
                )).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedStatus = value!;
                  });
                },
              ),
              const SizedBox(height: 16),
              
              // Progress
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Progress: ${(_progress * 100).toInt()}%',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8),
                  Slider(
                    value: _progress,
                    min: 0.0,
                    max: 1.0,
                    divisions: 20,
                    activeColor: PerseveranceColors.buttonFill,
                    onChanged: (value) {
                      setState(() {
                        _progress = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // Tags
              TextFormField(
                controller: _tagsController,
                decoration: const InputDecoration(
                  labelText: 'Tags (comma separated)',
                  border: OutlineInputBorder(),
                  hintText: 'e.g., Mechanical, Drive Train, Programming',
                ),
                onChanged: (value) {
                  setState(() {
                    _tags.clear();
                    if (value.isNotEmpty) {
                      _tags.addAll(value.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty));
                    }
                  });
                },
              ),
              if (_tags.isNotEmpty) ...[
                const SizedBox(height: 8),
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: _tags.map((tag) => Chip(
                    label: Text(tag),
                    backgroundColor: PerseveranceColors.background.withOpacity(0.1),
                    deleteIcon: const Icon(Icons.close, size: 16),
                    onDeleted: () {
                      setState(() {
                        _tags.remove(tag);
                        _tagsController.text = _tags.join(', ');
                      });
                    },
                  )).toList(),
                ),
              ],
              const SizedBox(height: 16),
              
              // Performance Metrics
              ExpansionTile(
                title: Text(
                  'Performance Metrics (Optional)',
                  style: TextStyle(
                    color: PerseveranceColors.buttonFill,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                children: [
                  _buildPerformanceMetricField('Speed', 'mph'),
                  _buildPerformanceMetricField('Lift Capacity', 'lbs'),
                  _buildPerformanceMetricField('Accuracy', '%'),
                  _buildPerformanceMetricField('Efficiency', '%'),
                ],
              ),
              const SizedBox(height: 16),
              
              // Camera Integration Placeholder
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: PerseveranceColors.background.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: PerseveranceColors.secondaryText.withOpacity(0.3)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.camera_alt,
                          color: PerseveranceColors.buttonFill,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Photo Documentation',
                          style: TextStyle(
                            color: PerseveranceColors.buttonFill,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Camera integration will be implemented in future updates. Photos can be added later.',
                      style: TextStyle(
                        color: PerseveranceColors.secondaryText,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Camera integration coming soon!'),
                          ),
                        );
                      },
                      icon: const Icon(Icons.camera_alt, size: 16),
                      label: const Text('Add Photos'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: PerseveranceColors.buttonFill,
                        foregroundColor: PerseveranceColors.primaryButtonText,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'Cancel',
            style: TextStyle(color: PerseveranceColors.secondaryText),
          ),
        ),
        ElevatedButton(
          onPressed: _submitForm,
          style: ElevatedButton.styleFrom(
            backgroundColor: PerseveranceColors.buttonFill,
            foregroundColor: PerseveranceColors.primaryButtonText,
          ),
          child: const Text('Add Build Log'),
        ),
      ],
    );
  }

  Widget _buildPerformanceMetricField(String label, String unit) {
    final controller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                labelText: '$label ($unit)',
                border: const OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  final doubleValue = double.tryParse(value);
                  if (doubleValue != null) {
                    _performanceMetrics[label] = doubleValue;
                  }
                } else {
                  _performanceMetrics.remove(label);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final now = DateTime.now();
      final buildLog = BuildLog(
        id: '', // Appwrite will generate the real ID
        title: _titleController.text,
        description: _descriptionController.text,
        date: now,
        status: _selectedStatus,
        progress: _progress,
        author: _authorController.text,
        tags: _tags,
        robotVersion: _robotVersionController.text,
        performanceMetrics: Map.from(_performanceMetrics),
      );
      widget.onBuildLogAdded(buildLog);
      Navigator.of(context).pop();
    }
  }
} 