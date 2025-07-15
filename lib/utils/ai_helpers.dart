import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../services/ai_service.dart';
import '../config/appwrite_config.dart';

/// AI Helper Utilities
/// 
/// Provides utility functions for invisible AI integration features
/// that enhance UX without visible AI chat interface.
class AIHelpers {
  static String get _baseUrl => AppwriteConfig.aiBaseUrl;
  static String get _apiKey => AppwriteConfig.aiApiKey;

  /// Smart notification timing based on AI analysis
  static Future<DateTime> getOptimalNotificationTime(
    String taskType,
    DateTime deadline,
    Map<String, dynamic> userPreferences,
  ) async {
    return await AIService.getOptimalNotificationTime(taskType, deadline, userPreferences);
  }

  /// AI-enhanced task prioritization
  static Future<List<Map<String, dynamic>>> prioritizeTasks(
    List<Map<String, dynamic>> tasks,
  ) async {
    // You may need to convert to Task model if required by AIService
    // For now, assume tasks are already in the correct format
    return (await AIService.prioritizeTasks(tasks.map((t) => t as Task).toList()))
        .map((t) => t.toJson())
        .toList();
  }

  /// AI-powered alliance recommendations
  static Future<List<Map<String, dynamic>>> suggestAlliances(
    List<Map<String, dynamic>> availableTeams,
    Map<String, dynamic> ourPerformance,
  ) async {
    final recommendations = await AIService.suggestAlliances(availableTeams, ourPerformance);
    return recommendations.map((rec) => rec.toJson()).toList();
  }

  /// AI-generated match strategies
  static Future<String> generateMatchStrategy(
    Map<String, dynamic> opponent,
    Map<String, dynamic> field,
    List<Map<String, dynamic>> history,
  ) async {
    return await AIService.generateMatchStrategy(opponent, field, history);
  }

  /// AI-enhanced inventory analysis
  static Future<List<Map<String, dynamic>>> analyzeInventory(
    List<Map<String, dynamic>> items,
    List<Map<String, dynamic>> events,
  ) async {
    final alerts = await AIService.analyzeInventory(items, events);
    return alerts.map((alert) => alert.toJson()).toList();
  }

  /// AI performance insights
  static Future<Map<String, dynamic>> analyzePerformance(
    List<Map<String, dynamic>> matches,
  ) async {
    return await AIService.analyzePerformance(matches);
  }

  /// AI timeline predictions
  static Future<Map<String, dynamic>> predictTimeline(
    List<Map<String, dynamic>> tasks,
    Map<String, dynamic> teamCapacity,
  ) async {
    // You may need to convert to Task model if required by AIService
    return await AIService.predictTimeline(tasks.map((t) => t as Task).toList(), teamCapacity);
  }

  /// AI risk assessment
  static Future<List<Map<String, dynamic>>> assessRisks(
    Map<String, dynamic> competition,
    Map<String, dynamic> teamStatus,
  ) async {
    return await AIService.assessRisks(competition, teamStatus);
  }

  /// Smart text completion for common tasks
  static Future<String> getTextCompletion(String partialText, String context) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/complete-text'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      },
      body: jsonEncode({
        'partial_text': partialText,
        'context': context,
      }),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['completion'] ?? partialText;
    } else {
      throw Exception('AI text completion failed: ${response.body}');
    }
  }

  /// AI-powered resource optimization suggestions
  static Future<List<Map<String, dynamic>>> optimizeResources(
    Map<String, dynamic> currentResources,
    List<Map<String, dynamic>> upcomingEvents,
  ) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/optimize-resources'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      },
      body: jsonEncode({
        'current_resources': currentResources,
        'upcoming_events': upcomingEvents,
      }),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(data['suggestions']);
    } else {
      throw Exception('AI resource optimization failed: ${response.body}');
    }
  }
} 