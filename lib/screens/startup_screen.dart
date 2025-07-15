import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/colors.dart';
import '../config/appwrite_config.dart';
import 'main_navigation.dart';
import '../widgets/custom_button.dart';

class StartupScreen extends ConsumerStatefulWidget {
  const StartupScreen({super.key});

  @override
  ConsumerState<StartupScreen> createState() => _StartupScreenState();
}

class _StartupScreenState extends ConsumerState<StartupScreen> {
  bool _isLoading = true;
  String _status = 'Initializing...';
  Map<String, dynamic>? _configStatus;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    try {
      setState(() {
        _status = 'Loading configuration...';
      });

      setState(() {
        _status = 'Checking services...';
      });

      // Get configuration status
      _configStatus = AppwriteConfig.configSummary;

      setState(() {
        _status = 'Ready!';
        _isLoading = false;
      });

      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MainNavigation()),
        );
      }
    } catch (e) {
      setState(() {
        _status = 'Error: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PerseveranceColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Logo/Icon
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: PerseveranceColors.primary,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(
                  Icons.engineering,
                  size: 60,
                  color: PerseveranceColors.onPrimary,
                ),
              ),
              const SizedBox(height: 32),
              
              // App Title
              const Text(
                'Team Perseverance',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: PerseveranceColors.onSurface,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'VEX Robotics Management',
                style: TextStyle(
                  fontSize: 16,
                  color: PerseveranceColors.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 48),
              
              // Status
              Text(
                _status,
                style: const TextStyle(
                  fontSize: 16,
                  color: PerseveranceColors.onSurface,
                ),
              ),
              const SizedBox(height: 16),
              
              // Loading indicator
              if (_isLoading)
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(PerseveranceColors.primary),
                ),
              
              const SizedBox(height: 32),
              
              // Configuration status
              if (_configStatus != null) ...[
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: PerseveranceColors.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: PerseveranceColors.outline,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Configuration Status',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: PerseveranceColors.onSurface,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildConfigItem('Appwrite Configured', _configStatus!['isConfigured']),
                      _buildConfigItem('Development Mode', _configStatus!['isDevelopment']),
                      _buildConfigItem('Debug Logs', _configStatus!['enableDebugLogs']),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                
                // Help text for configuration issues
                if (!_configStatus!['isConfigured'])
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: PerseveranceColors.errorContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Configuration Required',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: PerseveranceColors.onErrorContainer,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Please create a .env file in your project root with your Appwrite configuration. See the README for setup instructions.',
                          style: TextStyle(
                            fontSize: 12,
                            color: PerseveranceColors.onErrorContainer,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildConfigItem(String label, bool value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            value ? Icons.check_circle : Icons.error,
            size: 16,
            color: value ? Colors.green : Colors.red,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: PerseveranceColors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
} 