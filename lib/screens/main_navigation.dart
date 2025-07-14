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

  static const List<Widget> _screens = [
    DashboardScreen(),
    TeamScreen(),
    BuildScreen(),
    GamesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _getTitle(),
          style: TextStyle(
            color: PerseveranceColors.onSurface,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        backgroundColor: PerseveranceColors.surface,
        elevation: 0,
        iconTheme: IconThemeData(color: PerseveranceColors.onSurface),
        actions: [
          IconButton(
            icon: Icon(
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
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: PerseveranceColors.surface,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: PerseveranceColors.primary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: PerseveranceColors.onPrimary,
                  child: Icon(
                    Icons.engineering,
                    size: 30,
                    color: PerseveranceColors.primary,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
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
          ),
          _buildDrawerItem(
            icon: Icons.home,
            title: 'Home',
            isSelected: _selectedIndex == 0,
            onTap: () => _onItemTapped(0),
          ),
          _buildDrawerItem(
            icon: Icons.people,
            title: 'Team',
            isSelected: _selectedIndex == 1,
            onTap: () => _onItemTapped(1),
          ),
          _buildDrawerItem(
            icon: Icons.build,
            title: 'Build',
            isSelected: _selectedIndex == 2,
            onTap: () => _onItemTapped(2),
          ),
          _buildDrawerItem(
            icon: Icons.sports_esports,
            title: 'Games',
            isSelected: _selectedIndex == 3,
            onTap: () => _onItemTapped(3),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: TextStyle(
          color: PerseveranceColors.primary,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
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
      backgroundColor: PerseveranceColors.surfaceContainer,
      indicatorColor: PerseveranceColors.primary,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      elevation: 8,
      shadowColor: Colors.black12,
      surfaceTintColor: PerseveranceColors.surfaceContainer,
      indicatorShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      height: 80,
      animationDuration: const Duration(milliseconds: 300),
    );
  }

  String _getTitle() {
    switch (_selectedIndex) {
      case 0:
        return 'Home';
      case 1:
        return 'Team';
      case 2:
        return 'Build';
      case 3:
        return 'Games';
      default:
        return 'Team Perseverance';
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Only close drawer if it's open (when navigating from drawer)
    if (Scaffold.of(context).isDrawerOpen) {
      Navigator.pop(context);
    }
  }
} 