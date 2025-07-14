import 'package:flutter/material.dart';
import '../models/build_log.dart';
import '../models/inventory_item.dart';
import '../models/tool.dart';
import '../utils/colors.dart';
import '../widgets/build/build_log_card.dart';
import '../widgets/build/inventory_item_card.dart';
import '../widgets/build/tool_card.dart';
import '../widgets/build/add_build_log_dialog.dart';

class BuildScreen extends StatefulWidget {
  const BuildScreen({super.key});

  @override
  State<BuildScreen> createState() => _BuildScreenState();
}

class _BuildScreenState extends State<BuildScreen> with TickerProviderStateMixin {
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
          _buildBuildLogsTab(),
          _buildInventoryTab(),
          _buildToolsTab(),
          _buildResourcesTab(),
        ],
      ),
      floatingActionButton: _tabController.index == 0 ? FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddBuildLogDialog(
              onBuildLogAdded: (buildLog) {
                // TODO: Add build log to database
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Build log "${buildLog.title}" added successfully'),
                    backgroundColor: PerseveranceColors.buttonFill,
                  ),
                );
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

  Widget _buildBuildLogsTab() {
    final buildLogs = _getPlaceholderBuildLogs();
    final filteredLogs = buildLogs.where((log) {
      if (_searchQuery.isEmpty) return true;
      return log.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
             log.description.toLowerCase().contains(_searchQuery.toLowerCase()) ||
             log.author.toLowerCase().contains(_searchQuery.toLowerCase()) ||
             log.robotVersion.toLowerCase().contains(_searchQuery.toLowerCase());
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
                buildLog: filteredLogs[index],
                onTap: () {
                  // TODO: Navigate to build log details
                },
                onEdit: () {
                  // TODO: Edit build log
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildInventoryTab() {
    final inventory = _getPlaceholderInventory();
    final filteredInventory = inventory.where((item) {
      if (_searchQuery.isEmpty && _selectedCategory == null) return true;
      
      bool matchesSearch = _searchQuery.isEmpty || 
          item.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          item.description.toLowerCase().contains(_searchQuery.toLowerCase());
      
      bool matchesCategory = _selectedCategory == null || item.category == _selectedCategory;
      
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
                item: filteredInventory[index],
                onTap: () {
                  // TODO: Navigate to item details
                },
                onEdit: () {
                  // TODO: Edit inventory item
                },
                onQuantityChanged: (newQuantity) {
                  // TODO: Update quantity
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Quantity updated to $newQuantity'),
                      backgroundColor: PerseveranceColors.buttonFill,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildToolsTab() {
    final tools = _getPlaceholderTools();
    final filteredTools = tools.where((tool) {
      if (_searchQuery.isEmpty && _selectedToolStatus == null) return true;
      
      bool matchesSearch = _searchQuery.isEmpty || 
          tool.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          tool.description.toLowerCase().contains(_searchQuery.toLowerCase());
      
      bool matchesStatus = _selectedToolStatus == null || tool.status == _selectedToolStatus;
      
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
                tool: filteredTools[index],
                onTap: () {
                  // TODO: Navigate to tool details
                },
                onCheckout: () {
                  // TODO: Checkout tool
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Tool checked out successfully'),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                onReturn: () {
                  // TODO: Return tool
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Tool returned successfully'),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                onEdit: () {
                  // TODO: Edit tool
                },
              );
            },
          ),
        ),
      ],
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

  // Placeholder data methods
  List<BuildLog> _getPlaceholderBuildLogs() {
    final now = DateTime.now();
    return [
      BuildLog(
        id: '1',
        title: 'Drive Train Assembly V1',
        description: 'Completed assembly of the main drive train system with 4-wheel drive',
        date: now.subtract(const Duration(days: 5)),
        status: BuildStatus.completed,
        progress: 1.0,
        author: 'Mike Rodriguez',
        tags: ['Mechanical', 'Drive Train', 'V1'],
        robotVersion: 'V1',
        performanceMetrics: {'Speed': 15.5, 'Maneuverability': 85.0},
      ),
      BuildLog(
        id: '2',
        title: 'Lift Mechanism V2',
        description: 'Working on the lift mechanism for game objects with improved design',
        date: now.subtract(const Duration(hours: 6)),
        status: BuildStatus.inProgress,
        progress: 0.75,
        author: 'Sarah Chen',
        tags: ['Mechanical', 'Lift', 'V2'],
        robotVersion: 'V2',
        performanceMetrics: {'Lift Capacity': 8.0, 'Speed': 12.0},
      ),
      BuildLog(
        id: '3',
        title: 'Autonomous Programming V3',
        description: 'Developing autonomous routines for competition with advanced algorithms',
        date: now.subtract(const Duration(hours: 2)),
        status: BuildStatus.testing,
        progress: 0.6,
        author: 'Alex Johnson',
        tags: ['Programming', 'Autonomous', 'V3'],
        robotVersion: 'V3',
        performanceMetrics: {'Accuracy': 92.5, 'Efficiency': 88.0},
      ),
      BuildLog(
        id: '4',
        title: 'Sensor Integration V3',
        description: 'Integrating various sensors for better robot control and feedback',
        date: now,
        status: BuildStatus.inProgress,
        progress: 0.3,
        author: 'Emma Wilson',
        tags: ['Electronics', 'Sensors', 'V3'],
        robotVersion: 'V3',
        performanceMetrics: {'Accuracy': 95.0},
      ),
    ];
  }

  List<InventoryItem> _getPlaceholderInventory() {
    final now = DateTime.now();
    return [
      InventoryItem(
        id: '1',
        name: 'VEX 393 Motor',
        description: 'High-speed motor for drive train',
        category: InventoryCategory.motors,
        quantity: 8,
        minimumStock: 4,
        location: 'Shelf A1',
        partNumber: 'VEX-393',
        supplier: 'VEX Robotics',
        cost: 29.99,
        lastUpdated: now.subtract(const Duration(days: 2)),
      ),
      InventoryItem(
        id: '2',
        name: 'VEX 269 Motor',
        description: 'High-torque motor for lift mechanism',
        category: InventoryCategory.motors,
        quantity: 4,
        minimumStock: 2,
        location: 'Shelf A2',
        partNumber: 'VEX-269',
        supplier: 'VEX Robotics',
        cost: 34.99,
        lastUpdated: now.subtract(const Duration(days: 1)),
      ),
      InventoryItem(
        id: '3',
        name: 'Ultrasonic Sensor',
        description: 'Distance measurement sensor',
        category: InventoryCategory.sensors,
        quantity: 2,
        minimumStock: 3,
        location: 'Shelf B1',
        partNumber: 'VEX-US',
        supplier: 'VEX Robotics',
        cost: 19.99,
        lastUpdated: now.subtract(const Duration(hours: 6)),
      ),
      InventoryItem(
        id: '4',
        name: 'Aluminum Channel',
        description: 'Structural aluminum channel for frame',
        category: InventoryCategory.structure,
        quantity: 12,
        minimumStock: 8,
        location: 'Shelf C1',
        partNumber: 'AL-CH-12',
        supplier: 'VEX Robotics',
        cost: 8.99,
        lastUpdated: now.subtract(const Duration(days: 3)),
      ),
      InventoryItem(
        id: '5',
        name: 'Screws M3x10',
        description: 'M3 screws 10mm length',
        category: InventoryCategory.hardware,
        quantity: 200,
        minimumStock: 100,
        location: 'Bin D1',
        partNumber: 'SCREW-M3-10',
        supplier: 'VEX Robotics',
        cost: 0.15,
        lastUpdated: now.subtract(const Duration(days: 5)),
      ),
      InventoryItem(
        id: '6',
        name: 'VEX Controller',
        description: 'Main robot controller',
        category: InventoryCategory.electronics,
        quantity: 1,
        minimumStock: 1,
        location: 'Shelf E1',
        partNumber: 'VEX-CTRL',
        supplier: 'VEX Robotics',
        cost: 199.99,
        lastUpdated: now.subtract(const Duration(days: 1)),
      ),
      InventoryItem(
        id: '7',
        name: 'Pneumatic Cylinder',
        description: 'Double-acting pneumatic cylinder',
        category: InventoryCategory.pneumatics,
        quantity: 0,
        minimumStock: 2,
        location: 'Shelf F1',
        partNumber: 'PNEU-CYL',
        supplier: 'VEX Robotics',
        cost: 24.99,
        lastUpdated: now.subtract(const Duration(days: 7)),
      ),
      InventoryItem(
        id: '8',
        name: 'Battery Pack',
        description: '7.2V NiMH battery pack',
        category: InventoryCategory.electronics,
        quantity: 3,
        minimumStock: 2,
        location: 'Shelf E2',
        partNumber: 'BAT-7.2V',
        supplier: 'VEX Robotics',
        cost: 49.99,
        lastUpdated: now.subtract(const Duration(hours: 12)),
      ),
    ];
  }

  List<Tool> _getPlaceholderTools() {
    final now = DateTime.now();
    return [
      Tool(
        id: '1',
        name: 'Cordless Drill',
        description: '18V cordless drill with battery',
        status: ToolStatus.available,
        location: 'Tool Cabinet A',
        lastMaintenance: now.subtract(const Duration(days: 30)),
      ),
      Tool(
        id: '2',
        name: 'Screwdriver Set',
        description: 'Complete screwdriver set with various bits',
        status: ToolStatus.checkedOut,
        checkedOutBy: 'Mike Rodriguez',
        checkedOutAt: now.subtract(const Duration(hours: 2)),
        dueBackAt: now.add(const Duration(days: 1)),
        location: 'Tool Cabinet B',
      ),
      Tool(
        id: '3',
        name: 'Wrench Set',
        description: 'Metric and imperial wrench set',
        status: ToolStatus.available,
        location: 'Tool Cabinet C',
        lastMaintenance: now.subtract(const Duration(days: 15)),
      ),
      Tool(
        id: '4',
        name: 'Soldering Iron',
        description: 'Temperature-controlled soldering iron',
        status: ToolStatus.maintenance,
        location: 'Tool Cabinet D',
        notes: 'Needs new tip',
        lastMaintenance: now.subtract(const Duration(days: 60)),
      ),
      Tool(
        id: '5',
        name: 'Digital Caliper',
        description: 'Precision digital caliper for measurements',
        status: ToolStatus.checkedOut,
        checkedOutBy: 'Sarah Chen',
        checkedOutAt: now.subtract(const Duration(days: 1)),
        dueBackAt: now.subtract(const Duration(hours: 6)),
        location: 'Tool Cabinet E',
      ),
      Tool(
        id: '6',
        name: 'Level',
        description: 'Spirit level for alignment',
        status: ToolStatus.available,
        location: 'Tool Cabinet F',
        lastMaintenance: now.subtract(const Duration(days: 45)),
      ),
      Tool(
        id: '7',
        name: 'Wire Strippers',
        description: 'Automatic wire strippers',
        status: ToolStatus.available,
        location: 'Tool Cabinet G',
        lastMaintenance: now.subtract(const Duration(days: 20)),
      ),
      Tool(
        id: '8',
        name: 'Multimeter',
        description: 'Digital multimeter for electrical testing',
        status: ToolStatus.checkedOut,
        checkedOutBy: 'Alex Johnson',
        checkedOutAt: now.subtract(const Duration(hours: 4)),
        dueBackAt: now.add(const Duration(hours: 2)),
        location: 'Tool Cabinet H',
      ),
    ];
  }
} 