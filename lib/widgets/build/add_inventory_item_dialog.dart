import 'package:flutter/material.dart';
import '../../models/inventory_item.dart';
import '../../utils/colors.dart';

class AddInventoryItemDialog extends StatefulWidget {
  final Function(InventoryItem) onItemAdded;
  final String teamId;
  final String userId;

  const AddInventoryItemDialog({
    super.key,
    required this.onItemAdded,
    required this.teamId,
    required this.userId,
  });

  @override
  State<AddInventoryItemDialog> createState() => _AddInventoryItemDialogState();
}

class _AddInventoryItemDialogState extends State<AddInventoryItemDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();
  final _partNumberController = TextEditingController();
  final _supplierController = TextEditingController();
  final _costController = TextEditingController();

  InventoryCategory _category = InventoryCategory.other;
  int _quantity = 1;
  int _minimumStock = 1;

  // AI suggestion state
  String? _suggestedName;
  String? _suggestedLocation;
  String? _tipName;
  String? _tipLocation;
  bool _loading = false;
  String? _error;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    _partNumberController.dispose();
    _supplierController.dispose();
    _costController.dispose();
    super.dispose();
  }

  Future<void> _fetchNameSuggestion(String input) async {
    // TODO: Replace with actual AI service call
    if (input.isEmpty) {
      setState(() {
        _suggestedName = null;
        _tipName = null;
      });
      return;
    }
    if (input.length < 3) {
      setState(() {
        _suggestedName = null;
        _tipName = 'Use a descriptive part name.';
      });
    } else {
      setState(() {
        _suggestedName = 'VEX $input';
        _tipName = null;
      });
    }
  }

  Future<void> _fetchLocationSuggestion(String input) async {
    // TODO: Replace with actual AI service call
    if (input.isEmpty) {
      setState(() {
        _suggestedLocation = null;
        _tipLocation = null;
      });
      return;
    }
    if (input.length < 2) {
      setState(() {
        _suggestedLocation = null;
        _tipLocation = 'Specify a shelf, bin, or area.';
      });
    } else {
      setState(() {
        _suggestedLocation = 'Bin $input';
        _tipLocation = null;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final item = InventoryItem(
        id: '', // Appwrite will generate the real ID
        name: _nameController.text,
        description: _descriptionController.text,
        category: _category,
        quantity: _quantity,
        minimumStock: _minimumStock,
        location: _locationController.text,
        partNumber: _partNumberController.text,
        supplier: _supplierController.text,
        cost: double.tryParse(_costController.text),
        lastUpdated: DateTime.now(),
      );
      widget.onItemAdded(item);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Inventory Item'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                onChanged: (v) => _fetchNameSuggestion(v),
                validator: (v) => v == null || v.isEmpty ? 'Enter a name' : null,
              ),
              if (_suggestedName != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: GestureDetector(
                    onTap: () => setState(() => _nameController.text = _suggestedName!),
                    child: Row(
                      children: [
                        const Icon(Icons.lightbulb, size: 16, color: Colors.amber),
                        const SizedBox(width: 4),
                        Text('Suggested: $_suggestedName', style: TextStyle(color: Colors.amber[800], fontSize: 13)),
                      ],
                    ),
                  ),
                ),
              if (_tipName != null)
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Row(
                    children: [
                      const Icon(Icons.info_outline, size: 14, color: Colors.blueGrey),
                      const SizedBox(width: 4),
                      Text('Tip: $_tipName', style: const TextStyle(color: Colors.blueGrey, fontSize: 12)),
                    ],
                  ),
                ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 2,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<InventoryCategory>(
                value: _category,
                decoration: const InputDecoration(labelText: 'Category'),
                items: InventoryCategory.values
                    .map((c) => DropdownMenuItem(
                          value: c,
                          child: Text(c.displayName),
                        ))
                    .toList(),
                onChanged: (c) => setState(() => _category = c!),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: 'Quantity'),
                      keyboardType: TextInputType.number,
                      initialValue: '1',
                      onChanged: (v) => setState(() => _quantity = int.tryParse(v) ?? 1),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: 'Minimum Stock'),
                      keyboardType: TextInputType.number,
                      initialValue: '1',
                      onChanged: (v) => setState(() => _minimumStock = int.tryParse(v) ?? 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(labelText: 'Location'),
                onChanged: (v) => _fetchLocationSuggestion(v),
                validator: (v) => v == null || v.isEmpty ? 'Enter a location' : null,
              ),
              if (_suggestedLocation != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: GestureDetector(
                    onTap: () => setState(() => _locationController.text = _suggestedLocation!),
                    child: Row(
                      children: [
                        const Icon(Icons.lightbulb, size: 16, color: Colors.amber),
                        const SizedBox(width: 4),
                        Text('Suggested: $_suggestedLocation', style: TextStyle(color: Colors.amber[800], fontSize: 13)),
                      ],
                    ),
                  ),
                ),
              if (_tipLocation != null)
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Row(
                    children: [
                      const Icon(Icons.info_outline, size: 14, color: Colors.blueGrey),
                      const SizedBox(width: 4),
                      Text('Tip: $_tipLocation', style: const TextStyle(color: Colors.blueGrey, fontSize: 12)),
                    ],
                  ),
                ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _partNumberController,
                decoration: const InputDecoration(labelText: 'Part Number'),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _supplierController,
                decoration: const InputDecoration(labelText: 'Supplier'),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _costController,
                decoration: const InputDecoration(labelText: 'Cost'),
                keyboardType: TextInputType.number,
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
        ElevatedButton(
          onPressed: _loading ? null : _submitForm,
          child: const Text('Add'),
        ),
      ],
    );
  }
} 