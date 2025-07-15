import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'utils/theme.dart';
import 'screens/startup_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Load environment variables with error handling
  try {
    await dotenv.load();
  } catch (e) {
    // Continue without .env file for development
    print('Warning: Could not load .env file: $e');
    print('Using default configuration values');
  }
  
  runApp(
    const ProviderScope(
      child: PerseveranceApp(),
    ),
  );
}

class PerseveranceApp extends StatelessWidget {
  const PerseveranceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Team Perseverance',
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: ThemeMode.system,
      home: const StartupScreen(),
      debugShowCheckedModeBanner: false,
      // Add error handling for widget tree
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
    );
  }
}
