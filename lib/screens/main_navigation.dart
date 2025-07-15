import 'package:flutter/material.dart';
import '../utils/colors.dart';
import 'dashboard_screen.dart';
import 'team_screen.dart';
import 'build_screen.dart';
import 'games_screen.dart';
import 'settings_screen.dart';

/// Main Navigation Screen
/// 
/// The main navigation screen with drawer navigation for the VEX Robotics Team Perseverance app.
/// Handles navigation between different screens with Games category grouping.
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  // Use const constructors for better performance
  static const List<Widget> _screens = [
    DashboardScreen(),
    TeamScreen(),
    BuildScreen(),
    GamesScreen(),
  ];

  // Cache titles to avoid rebuilding
  static const List<String> _titles = [
    'Home',
    'Team',
    'Build',
    'Games',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _getTitle(),
          style: const TextStyle(
            color: PerseveranceColors.onSurface,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        backgroundColor: PerseveranceColors.surface,
        elevation: 0,
        iconTheme: const IconThemeData(color: PerseveranceColors.onSurface),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: PerseveranceColors.onSurface,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
          ),
        ],
      ),
      drawer: _buildDrawer(),
      body: RepaintBoundary(
        child: _buildBody(),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: PerseveranceColors.surface,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildDrawerHeader(),
          ...List.generate(_titles.length, (index) => _buildDrawerItem(
            icon: _getIconForIndex(index),
            title: _titles[index],
            isSelected: _selectedIndex == index,
            onTap: () => _onItemTapped(index),
          )),
        ],
      ),
    );
  }

  Widget _buildDrawerHeader() {
    return DrawerHeader(
      decoration: const BoxDecoration(
        color: PerseveranceColors.primary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundColor: PerseveranceColors.onPrimary,
            child: Icon(
              Icons.engineering,
              size: 30,
              color: PerseveranceColors.primary,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Team Perseverance',
            style: TextStyle(
              color: PerseveranceColors.onPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'VEX Robotics',
            style: TextStyle(
              color: PerseveranceColors.onPrimary.withOpacity(0.8),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconForIndex(int index) {
    switch (index) {
      case 0:
        return Icons.home;
      case 1:
        return Icons.people;
      case 2:
        return Icons.build;
      case 3:
        return Icons.sports_esports;
      default:
        return Icons.home;
    }
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
    double indent = 0,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? PerseveranceColors.primary : PerseveranceColors.onSurface,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? PerseveranceColors.primary : PerseveranceColors.onSurface,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      selectedTileColor: PerseveranceColors.primaryContainer.withOpacity(0.1),
      onTap: onTap,
      contentPadding: EdgeInsets.only(left: 16 + indent),
    );
  }

  Widget _buildBody() {
    return _screens[_selectedIndex];
  }

  Widget _buildBottomNavigationBar() {
    return NavigationBar(
      selectedIndex: _selectedIndex,
      onDestinationSelected: _onItemTapped,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home),
          selectedIcon: Icon(Icons.home),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.people),
          selectedIcon: Icon(Icons.people),
          label: 'Team',
        ),
        NavigationDestination(
          icon: Icon(Icons.build),
          selectedIcon: Icon(Icons.build),
          label: 'Build',
        ),
        NavigationDestination(
          icon: Icon(Icons.sports_esports),
          selectedIcon: Icon(Icons.sports_esports),
          label: 'Games',
        ),
      ],
    );
  }

  String _getTitle() {
    return _titles[_selectedIndex];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
} 