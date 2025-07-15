import 'package:flutter/material.dart';
import '../models/build_log.dart';
import '../models/inventory_item.dart';
import '../models/tool.dart';
import '../utils/colors.dart';
import '../widgets/build/build_log_card.dart';
import '../widgets/build/inventory_item_card.dart';
import '../widgets/build/tool_card.dart';
import '../widgets/build/add_build_log_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/app_providers.dart';
import '../widgets/build/add_inventory_item_dialog.dart';

class BuildScreen extends ConsumerStatefulWidget {
  const BuildScreen({super.key});

  @override
  ConsumerState<BuildScreen> createState() => _BuildScreenState();
}

class _BuildScreenState extends ConsumerState<BuildScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  String _searchQuery = '';
  InventoryCategory? _selectedCategory;
  ToolStatus? _selectedToolStatus;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final teamId = (authState.valueOrNull?.teamId ?? '');
    final userId = (authState.valueOrNull?.id ?? '');
    final buildLogsAsync = ref.watch(_teamCollectionProvider('buildLogs', teamId));
    final inventoryAsync = ref.watch(_teamCollectionProvider('inventory', teamId));
    final toolsAsync = ref.watch(_teamCollectionProvider('tools', teamId));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Build Workshop',
          style: TextStyle(
            color: PerseveranceColors.buttonFill,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: PerseveranceColors.background,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: PerseveranceColors.buttonFill,
          labelColor: PerseveranceColors.buttonFill,
          unselectedLabelColor: PerseveranceColors.secondaryText,
          tabs: const [
            Tab(icon: Icon(Icons.build), text: 'Build Logs'),
            Tab(icon: Icon(Icons.inventory), text: 'Inventory'),
            Tab(icon: Icon(Icons.handyman), text: 'Tools'),
            Tab(icon: Icon(Icons.folder), text: 'Resources'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildBuildLogsTab(buildLogsAsync),
          _buildInventoryTab(inventoryAsync),
          _buildToolsTab(toolsAsync),
          _buildResourcesTab(),
        ],
      ),
      floatingActionButton: _tabController.index == 1 ? FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddInventoryItemDialog(
              teamId: teamId,
              userId: userId,
              onItemAdded: (item) async {
                final databaseNotifier = ref.read(databaseProvider.notifier);
                final now = DateTime.now();
                final data = {
                  'name': item.name,
                  'description': item.description,
                  'category': item.category.name,
                  'quantity': item.quantity,
                  'minimumStock': item.minimumStock,
                  'location': item.location,
                  'partNumber': item.partNumber,
                  'supplier': item.supplier,
                  'cost': item.cost,
                  'teamId': teamId,
                  'createdAt': now.toIso8601String(),
                  'updatedAt': now.toIso8601String(),
                };
                final success = await databaseNotifier.createDocument(
                  collectionId: 'inventory',
                  data: data,
                );
                if (success) {
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Inventory item "${item.name}" added successfully'),
                        backgroundColor: PerseveranceColors.buttonFill,
                      ),
                    );
                  }
                } else {
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Failed to create inventory item.'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                }
              },
            ),
          );
        },
        backgroundColor: PerseveranceColors.buttonFill,
        foregroundColor: PerseveranceColors.primaryButtonText,
        child: const Icon(Icons.add),
      ) : null,
    );
  }

  Widget _buildBuildLogsTab(AsyncValue<List<dynamic>> buildLogsAsync) {
    return AsyncValueWidget(
      value: buildLogsAsync,
      builder: (buildLogs) {
        final filteredLogs = buildLogs.where((log) {
          if (_searchQuery.isEmpty) return true;
          return (log['title'] ?? '').toLowerCase().contains(_searchQuery.toLowerCase()) ||
                 (log['description'] ?? '').toLowerCase().contains(_searchQuery.toLowerCase()) ||
                 (log['author'] ?? '').toLowerCase().contains(_searchQuery.toLowerCase()) ||
                 (log['robotVersion'] ?? '').toLowerCase().contains(_searchQuery.toLowerCase());
        }).toList();
        return Column(
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search build logs...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: PerseveranceColors.background.withOpacity(0.1),
                ),
              ),
            ),
            
            // Robot versions timeline
            Container(
              height: 60,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: ['V1', 'V2', 'V3', 'V4'].map((version) => Container(
                  margin: const EdgeInsets.only(right: 12),
                  child: FilterChip(
                    label: Text(version),
                    selected: true,
                    onSelected: (selected) {
                      // TODO: Filter by robot version
                    },
                    backgroundColor: PerseveranceColors.buttonFill,
                    selectedColor: PerseveranceColors.buttonFill,
                    labelStyle: const TextStyle(
                      color: PerseveranceColors.primaryButtonText,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )).toList(),
              ),
            ),
            
            // Build logs list
            Expanded(
              child: ListView.builder(
                itemCount: filteredLogs.length,
                itemBuilder: (context, index) {
                  return BuildLogCard(
                    buildLog: BuildLog.fromJson(filteredLogs[index]),
                    onTap: () {}, // TODO: Navigation
                    onEdit: () {}, // TODO: Edit
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildInventoryTab(AsyncValue<List<dynamic>> inventoryAsync) {
    return AsyncValueWidget(
      value: inventoryAsync,
      builder: (inventory) {
        final filteredInventory = inventory.where((item) {
          if (_searchQuery.isEmpty && _selectedCategory == null) return true;
          bool matchesSearch = _searchQuery.isEmpty ||
              (item['name'] ?? '').toLowerCase().contains(_searchQuery.toLowerCase()) ||
              (item['description'] ?? '').toLowerCase().contains(_searchQuery.toLowerCase());
          bool matchesCategory = _selectedCategory == null || item['category'] == _selectedCategory?.toString();
          return matchesSearch && matchesCategory;
        }).toList();
        return Column(
          children: [
            // Search and filter
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search inventory...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: PerseveranceColors.background.withOpacity(0.1),
                    ),
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<InventoryCategory>(
                    value: _selectedCategory,
                    decoration: const InputDecoration(
                      labelText: 'Filter by Category',
                      border: OutlineInputBorder(),
                    ),
                    items: [
                      const DropdownMenuItem<InventoryCategory>(
                        value: null,
                        child: Text('All Categories'),
                      ),
                      ...InventoryCategory.values.map((category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.displayName),
                      )),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedCategory = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            
            // Inventory list
            Expanded(
              child: ListView.builder(
                itemCount: filteredInventory.length,
                itemBuilder: (context, index) {
                  return InventoryItemCard(
                    item: InventoryItem.fromJson(filteredInventory[index]),
                    onTap: () {}, // TODO: Navigation
                    onEdit: () {}, // TODO: Edit
                    onQuantityChanged: (newQuantity) {}, // TODO: Update
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildToolsTab(AsyncValue<List<dynamic>> toolsAsync) {
    return AsyncValueWidget(
      value: toolsAsync,
      builder: (tools) {
        final filteredTools = tools.where((tool) {
          if (_searchQuery.isEmpty && _selectedToolStatus == null) return true;
          bool matchesSearch = _searchQuery.isEmpty ||
              (tool['name'] ?? '').toLowerCase().contains(_searchQuery.toLowerCase()) ||
              (tool['description'] ?? '').toLowerCase().contains(_searchQuery.toLowerCase());
          bool matchesStatus = _selectedToolStatus == null || tool['status'] == _selectedToolStatus?.toString();
          return matchesSearch && matchesStatus;
        }).toList();
        return Column(
          children: [
            // Search and filter
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search tools...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: PerseveranceColors.background.withOpacity(0.1),
                    ),
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<ToolStatus>(
                    value: _selectedToolStatus,
                    decoration: const InputDecoration(
                      labelText: 'Filter by Status',
                      border: OutlineInputBorder(),
                    ),
                    items: [
                      const DropdownMenuItem<ToolStatus>(
                        value: null,
                        child: Text('All Status'),
                      ),
                      ...ToolStatus.values.map((status) => DropdownMenuItem(
                        value: status,
                        child: Text(status.displayName),
                      )),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedToolStatus = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            
            // Tools list
            Expanded(
              child: ListView.builder(
                itemCount: filteredTools.length,
                itemBuilder: (context, index) {
                  return ToolCard(
                    tool: Tool.fromJson(filteredTools[index]),
                    onTap: () {}, // TODO: Navigation
                    onCheckout: () {}, // TODO: Checkout
                    onReturn: () {}, // TODO: Return
                    onEdit: () {}, // TODO: Edit
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildResourcesTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CAD Files Section
          _buildResourceSection(
            'CAD Files & Designs',
            Icons.design_services,
            [
              _buildResourceCard('Robot V1 CAD', 'Main robot assembly', Icons.engineering),
              _buildResourceCard('Robot V2 CAD', 'Updated design with improvements', Icons.engineering),
              _buildResourceCard('Drive Train CAD', 'Drive train assembly', Icons.settings),
              _buildResourceCard('Lift Mechanism CAD', 'Lift system design', Icons.trending_up),
            ],
          ),
          
          const SizedBox(height: 24),
          
          // Documentation Section
          _buildResourceSection(
            'Documentation',
            Icons.description,
            [
              _buildResourceCard('Build Instructions', 'Step-by-step build guide', Icons.build),
              _buildResourceCard('Wiring Diagrams', 'Electrical system diagrams', Icons.electric_bolt),
              _buildResourceCard('Programming Guide', 'Code documentation', Icons.code),
              _buildResourceCard('Competition Rules', 'VEX competition rules', Icons.rule),
            ],
          ),
          
          const SizedBox(height: 24),
          
          // Manuals Section
          _buildResourceSection(
            'Manuals & Guides',
            Icons.menu_book,
            [
              _buildResourceCard('Motor Manual', 'Motor specifications and usage', Icons.settings),
              _buildResourceCard('Sensor Manual', 'Sensor setup and calibration', Icons.radar),
              _buildResourceCard('Controller Manual', 'VEX controller guide', Icons.gamepad),
              _buildResourceCard('Software Manual', 'Programming software guide', Icons.computer),
            ],
          ),
          
          const SizedBox(height: 24),
          
          // Barcode Scanner Placeholder
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: PerseveranceColors.background.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: PerseveranceColors.secondaryText.withOpacity(0.3)),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.qr_code_scanner,
                  size: 48,
                  color: PerseveranceColors.buttonFill,
                ),
                const SizedBox(height: 12),
                Text(
                  'Barcode Scanner',
                  style: TextStyle(
                    color: PerseveranceColors.buttonFill,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Scanner not implemented yet. Will be available in future updates.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: PerseveranceColors.secondaryText,
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Barcode scanner coming soon!'),
                      ),
                    );
                  },
                  icon: const Icon(Icons.qr_code_scanner),
                  label: const Text('Scan Barcode'),
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
    );
  }

  Widget _buildResourceSection(String title, IconData icon, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: PerseveranceColors.buttonFill),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                color: PerseveranceColors.buttonFill,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.2,
          children: children,
        ),
      ],
    );
  }

  Widget _buildResourceCard(String title, String description, IconData icon) {
    return Card(
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Opening $title...'),
              backgroundColor: PerseveranceColors.buttonFill,
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 32,
                color: PerseveranceColors.buttonFill,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: PerseveranceColors.buttonFill,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: PerseveranceColors.secondaryText,
                  fontSize: 12,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
} 

// Helper: Provider for team collection
final _teamCollectionProvider =
    (String collection, String teamId) => FutureProvider<List<dynamic>>((ref) async {
  final db = ref.watch(databaseServiceProvider);
  switch (collection) {
    case 'buildLogs':
      return db.getTeamBuildLogs(teamId);
    case 'inventory':
      return db.getTeamInventory(teamId);
    case 'tools':
      return []; // TODO: Implement getTeamTools method
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