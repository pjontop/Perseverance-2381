import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/colors.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import '../../widgets/custom_button.dart';

/// Welcome Screen
/// 
/// The initial screen users see when opening the app.
/// Provides branding, app description, and authentication options.
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PerseveranceColors.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Spacer(),
              
              // Team Logo and Branding
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: PerseveranceColors.primary,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Icon(
                  Icons.engineering,
                  size: 60,
                  color: PerseveranceColors.onPrimary,
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Team Name
              Text(
                'Team Perseverance',
                style: GoogleFonts.inter(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: PerseveranceColors.onPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 8),
              
              // Subtitle
              Text(
                'VEX Robotics',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: PerseveranceColors.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 32),
              
              // App Description
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: PerseveranceColors.surfaceContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Text(
                      'Complete Team Management',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: PerseveranceColors.onSurface,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Manage your VEX robotics team with real-time collaboration, task tracking, build documentation, and competition scouting.',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: PerseveranceColors.onSurfaceVariant,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Key Features
              _buildFeatureItem(Icons.people, 'Team Collaboration'),
              _buildFeatureItem(Icons.build, 'Build Documentation'),
              _buildFeatureItem(Icons.track_changes, 'Competition Scouting'),
              _buildFeatureItem(Icons.analytics, 'Performance Analytics'),
              
              const Spacer(),
              
              // Authentication Buttons
              Column(
                children: [
                  PerseveranceButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    },
                    label: 'Get Started',
                    tooltip: 'Sign up for a new account',
                    semanticsLabel: 'Sign up for a new account',
                  ),
                  
                  const SizedBox(height: 16),
                  
                  PerseveranceButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    label: 'Sign In',
                    tooltip: 'Sign in to your existing account',
                    semanticsLabel: 'Sign in to your existing account',
                    outlined: true,
                  ),
                ],
              ),
              
              const SizedBox(height: 24),
              
              // Version and Links
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PerseveranceButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Terms of Service'),
                          content: Text('Terms of Service content goes here.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Close'),
                            ),
                          ],
                        ),
                      );
                    },
                    label: 'Terms',
                    tooltip: 'View terms of service',
                    semanticsLabel: 'View terms of service',
                    textStyle: GoogleFonts.inter(
                      color: PerseveranceColors.onSurfaceVariant,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'v1.0.0',
                    style: GoogleFonts.inter(
                      color: PerseveranceColors.onSurfaceVariant,
                      fontSize: 14,
                    ),
                  ),
                  PerseveranceButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Privacy Policy'),
                          content: Text('Privacy Policy content goes here.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Close'),
                            ),
                          ],
                        ),
                      );
                    },
                    label: 'Privacy',
                    tooltip: 'View privacy policy',
                    semanticsLabel: 'View privacy policy',
                    textStyle: GoogleFonts.inter(
                      color: PerseveranceColors.onSurfaceVariant,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            icon,
            color: PerseveranceColors.primary,
            size: 20,
          ),
          const SizedBox(width: 12),
          Text(
            text,
            style: GoogleFonts.inter(
              fontSize: 16,
              color: PerseveranceColors.onSurface,
            ),
          ),
        ],
      ),
    );
  }
} 