import 'package:flutter/material.dart';
import '../utils/colors.dart';

/// Home Page Screen
/// 
/// The main home screen for the VEX Robotics Team Perseverance app.
/// Features a clean Material Design 3 AppBar and welcome content.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Team Perseverance',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: PerseveranceColors.secondaryText,
          ),
        ),
        backgroundColor: PerseveranceColors.background,
        foregroundColor: PerseveranceColors.secondaryText,
        elevation: 0,
        centerTitle: true,
        scrolledUnderElevation: 0,
      ),
      backgroundColor: PerseveranceColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              // Welcome Section
              Text(
                'Welcome to',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: PerseveranceColors.secondaryText,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Team Perseverance',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: PerseveranceColors.buttonFill,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'VEX Robotics Team Management System',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: PerseveranceColors.secondaryText,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 48),
              
              // Quick Actions Card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.rocket_launch,
                            color: PerseveranceColors.background,
                            size: 28,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Quick Actions',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: PerseveranceColors.primaryButtonText,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      
                      // Action Buttons
                      _buildActionButton(
                        context,
                        icon: Icons.people,
                        title: 'Team Members',
                        subtitle: 'Manage team roster and roles',
                        onTap: () {
                          // TODO: Navigate to team members screen
                        },
                      ),
                      const SizedBox(height: 16),
                      
                      _buildActionButton(
                        context,
                        icon: Icons.schedule,
                        title: 'Events & Competitions',
                        subtitle: 'View upcoming events and results',
                        onTap: () {
                          // TODO: Navigate to events screen
                        },
                      ),
                      const SizedBox(height: 16),
                      
                      _buildActionButton(
                        context,
                        icon: Icons.engineering,
                        title: 'Robot Management',
                        subtitle: 'Track robot builds and maintenance',
                        onTap: () {
                          // TODO: Navigate to robot management screen
                        },
                      ),
                      const SizedBox(height: 16),
                      
                      _buildActionButton(
                        context,
                        icon: Icons.analytics,
                        title: 'Performance Analytics',
                        subtitle: 'View team statistics and progress',
                        onTap: () {
                          // TODO: Navigate to analytics screen
                        },
                      ),
                    ],
                  ),
                ),
              ),
              
              const Spacer(),
              
              // Footer
              Center(
                child: Text(
                  'Built with ❤️ for VEX Robotics',
                                     style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                     color: PerseveranceColors.secondaryText.withValues(alpha: 0.7),
                     fontWeight: FontWeight.w400,
                   ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Add new item or quick action
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  /// Builds an action button for the home screen
  Widget _buildActionButton(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
                 decoration: BoxDecoration(
           color: PerseveranceColors.secondaryText.withValues(alpha: 0.05),
           borderRadius: BorderRadius.circular(12),
           border: Border.all(
             color: PerseveranceColors.background.withValues(alpha: 0.1),
             width: 1,
           ),
         ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: PerseveranceColors.buttonFill,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: PerseveranceColors.primaryButtonText,
                size: 20,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: PerseveranceColors.primaryButtonText,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: PerseveranceColors.secondaryButtonText,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
                         Icon(
               Icons.arrow_forward_ios,
               color: PerseveranceColors.background.withValues(alpha: 0.5),
               size: 16,
             ),
          ],
        ),
      ),
    );
  }
} 