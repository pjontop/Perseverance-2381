import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/colors.dart';
import '../services/haptic_service.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool _hapticEnabled = true;
  HapticIntensity _hapticIntensity = HapticIntensity.medium;
  bool _notificationsEnabled = true;
  bool _autoSyncEnabled = true;
  String _selectedTheme = 'Light';

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final settings = HapticService.getSettings();
    setState(() {
      _hapticEnabled = settings['enabled'] ?? true;
      _hapticIntensity = settings['intensity'] ?? HapticIntensity.medium;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            color: PerseveranceColors.buttonFill,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: PerseveranceColors.background,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildTeamSection(),
            const SizedBox(height: 16),
            _buildPreferencesSection(),
            const SizedBox(height: 16),
            _buildDataSection(),
            const SizedBox(height: 16),
            _buildAboutSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamSection() {
    return Card(
      color: PerseveranceColors.background,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Team Configuration',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
            const SizedBox(height: 16),
            _buildSettingTile(
              'Team Name',
              'Team Perseverance',
              Icons.group,
              onTap: () => _showTeamNameDialog(),
            ),
            _buildSettingTile(
              'Team Number',
              '1234A',
              Icons.numbers,
              onTap: () => _showTeamNumberDialog(),
            ),
            _buildSettingTile(
              'Coach',
              'Dr. Smith',
              Icons.person,
              onTap: () => _showCoachDialog(),
            ),
            _buildSettingTile(
              'School',
              'Perseverance High School',
              Icons.school,
              onTap: () => _showSchoolDialog(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPreferencesSection() {
    return Card(
      color: PerseveranceColors.background,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Preferences',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
            const SizedBox(height: 16),
            _buildSwitchTile(
              'Haptic Feedback',
              'Vibrate on interactions',
              Icons.vibration,
              _hapticEnabled,
              (value) {
                HapticService.settingsChange();
                setState(() {
                  _hapticEnabled = value;
                });
                HapticService.updateSettings(enabled: value);
              },
            ),
            _buildDropdownTile(
              'Haptic Intensity',
              _hapticIntensity.name,
              Icons.tune,
              ['light', 'medium', 'heavy'],
              (value) {
                HapticService.settingsChange();
                setState(() {
                  _hapticIntensity = HapticIntensity.values.firstWhere(
                    (e) => e.name == value,
                  );
                });
                HapticService.updateSettings(intensity: _hapticIntensity);
              },
            ),
            _buildSwitchTile(
              'Notifications',
              'Receive push notifications',
              Icons.notifications,
              _notificationsEnabled,
              (value) {
                HapticService.settingsChange();
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
            _buildSwitchTile(
              'Auto Sync',
              'Automatically sync data',
              Icons.sync,
              _autoSyncEnabled,
              (value) {
                HapticService.settingsChange();
                setState(() {
                  _autoSyncEnabled = value;
                });
              },
            ),
            _buildDropdownTile(
              'Theme',
              _selectedTheme,
              Icons.palette,
              ['Light', 'Dark', 'Auto'],
              (value) {
                HapticService.settingsChange();
                setState(() {
                  _selectedTheme = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataSection() {
    return Card(
      color: PerseveranceColors.background,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Data & Export',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
            const SizedBox(height: 16),
            _buildSettingTile(
              'Export Data',
              'Generate PDF reports',
              Icons.file_download,
              onTap: () => _exportData(),
            ),
            _buildSettingTile(
              'Backup Data',
              'Create backup to cloud',
              Icons.backup,
              onTap: () => _backupData(),
            ),
            _buildSettingTile(
              'Clear Cache',
              'Free up storage space',
              Icons.cleaning_services,
              onTap: () => _clearCache(),
            ),
            _buildSettingTile(
              'Reset App',
              'Clear all data',
              Icons.refresh,
              onTap: () => _resetApp(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutSection() {
    return Card(
      color: PerseveranceColors.background,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: PerseveranceColors.buttonFill,
              ),
            ),
            const SizedBox(height: 16),
            _buildSettingTile(
              'App Version',
              '1.0.0',
              Icons.info,
              onTap: () => _showAboutDialog(),
            ),
            _buildSettingTile(
              'Privacy Policy',
              'Read our privacy policy',
              Icons.privacy_tip,
              onTap: () => _showPrivacyPolicy(),
            ),
            _buildSettingTile(
              'Terms of Service',
              'Read our terms',
              Icons.description,
              onTap: () => _showTermsOfService(),
            ),
            _buildSettingTile(
              'Contact Support',
              'Get help and support',
              Icons.support_agent,
              onTap: () => _contactSupport(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingTile(String title, String subtitle, IconData icon, {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(
        icon,
        color: PerseveranceColors.buttonFill,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: PerseveranceColors.buttonFill,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: PerseveranceColors.secondaryText,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: PerseveranceColors.buttonFill,
      ),
      onTap: () {
        HapticService.lightTap();
        onTap?.call();
      },
    );
  }

  Widget _buildSwitchTile(String title, String subtitle, IconData icon, bool value, ValueChanged<bool> onChanged) {
    return ListTile(
      leading: Icon(
        icon,
        color: PerseveranceColors.buttonFill,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: PerseveranceColors.buttonFill,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: PerseveranceColors.secondaryText,
        ),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: PerseveranceColors.buttonFill,
      ),
    );
  }

  Widget _buildDropdownTile(String title, String currentValue, IconData icon, List<String> options, ValueChanged<String> onChanged) {
    return ListTile(
      leading: Icon(
        icon,
        color: PerseveranceColors.buttonFill,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: PerseveranceColors.buttonFill,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        currentValue,
        style: TextStyle(
          color: PerseveranceColors.secondaryText,
        ),
      ),
      trailing: PopupMenuButton<String>(
        onSelected: onChanged,
        itemBuilder: (context) => options.map((option) => PopupMenuItem(
          value: option,
          child: Text(option),
        )).toList(),
        child: Icon(
          Icons.arrow_drop_down,
          color: PerseveranceColors.buttonFill,
        ),
      ),
    );
  }

  void _showTeamNameDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Team Name'),
        content: TextField(
          decoration: InputDecoration(
            labelText: 'Team Name',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              HapticService.success();
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showTeamNumberDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Team Number'),
        content: TextField(
          decoration: InputDecoration(
            labelText: 'Team Number',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              HapticService.success();
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showCoachDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Coach'),
        content: TextField(
          decoration: InputDecoration(
            labelText: 'Coach Name',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              HapticService.success();
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showSchoolDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit School'),
        content: TextField(
          decoration: InputDecoration(
            labelText: 'School Name',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              HapticService.success();
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  void _exportData() {
    HapticService.export();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Export Data'),
        content: Text('Data exported successfully!'),
        actions: [
          ElevatedButton(
            onPressed: () {
              HapticService.success();
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _backupData() {
    HapticService.mediumTap();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Backup Data'),
        content: Text('Backup completed successfully!'),
        actions: [
          ElevatedButton(
            onPressed: () {
              HapticService.success();
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _clearCache() {
    HapticService.warning();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Clear Cache'),
        content: Text('Are you sure you want to clear the cache?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              HapticService.success();
              Navigator.pop(context);
            },
            child: Text('Clear'),
          ),
        ],
      ),
    );
  }

  void _resetApp() {
    HapticService.warning();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Reset App'),
        content: Text('This will clear all data. Are you sure?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              HapticService.success();
              Navigator.pop(context);
            },
            child: Text('Reset'),
          ),
        ],
      ),
    );
  }

  void _showAboutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('About'),
        content: Text('Team Perseverance App v1.0.0\n\nBuilt with Flutter and AI-enhanced features.'),
        actions: [
          ElevatedButton(
            onPressed: () {
              HapticService.lightTap();
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showPrivacyPolicy() {
    HapticService.lightTap();
    // Navigate to privacy policy
  }

  void _showTermsOfService() {
    HapticService.lightTap();
    // Navigate to terms of service
  }

  void _contactSupport() {
    HapticService.lightTap();
    // Navigate to support
  }
} 