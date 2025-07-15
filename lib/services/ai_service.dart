import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/competition/task_model.dart';
import '../models/competition/team_recommendation_model.dart';
import '../models/competition/match_strategy_model.dart';
import '../models/competition/inventory_alert_model.dart';
import '../config/appwrite_config.dart';

class AIService {
  static String get baseUrl => AppwriteConfig.aiBaseUrl;
  static String get apiKey => AppwriteConfig.aiApiKey;

  // Smart task prioritization
  static Future<List<Task>> prioritizeTasks(List<Task> tasks) async {
    final response = await http.post(
      Uri.parse('$baseUrl/prioritize-tasks'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'tasks': tasks.map((task) => task.toJson()).toList(),
      }),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['prioritized_tasks'] as List)
          .map((taskJson) => Task.fromJson(taskJson))
          .toList();
    } else {
      throw Exception('AI task prioritization failed: ${response.body}');
    }
  }

  // Alliance partner recommendations
  static Future<List<TeamRecommendation>> suggestAlliances(
    List<Map<String, dynamic>> availableTeams,
    Map<String, dynamic> ourPerformance,
  ) async {
    final response = await http.post(
      Uri.parse('$baseUrl/suggest-alliances'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'available_teams': availableTeams,
        'our_performance': ourPerformance,
      }),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['recommendations'] as List)
          .map((recJson) => TeamRecommendation.fromJson(recJson))
          .toList();
    } else {
      throw Exception('AI alliance recommendation failed: ${response.body}');
    }
  }

  // Match strategy suggestions
  static Future<String> generateMatchStrategy(
    Map<String, dynamic> opponent,
    Map<String, dynamic> field,
    List<Map<String, dynamic>> history,
  ) async {
    final response = await http.post(
      Uri.parse('$baseUrl/generate-strategy'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'opponent': opponent,
        'field': field,
        'history': history,
      }),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['strategy'] ?? '';
    } else {
      throw Exception('AI match strategy failed: ${response.body}');
    }
  }

  // Intelligent inventory alerts
  static Future<List<InventoryAlert>> analyzeInventory(
    List<Map<String, dynamic>> items,
    List<Map<String, dynamic>> events,
  ) async {
    final response = await http.post(
      Uri.parse('$baseUrl/analyze-inventory'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'inventory': items,
        'upcoming_events': events,
      }),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['alerts'] as List)
          .map((alertJson) => InventoryAlert.fromJson(alertJson))
          .toList();
    } else {
      throw Exception('AI inventory analysis failed: ${response.body}');
    }
  }

  // Performance insights
  static Future<Map<String, dynamic>> analyzePerformance(
    List<Map<String, dynamic>> matches,
  ) async {
    final response = await http.post(
      Uri.parse('$baseUrl/analyze-performance'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'matches': matches,
      }),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('AI performance analysis failed: ${response.body}');
    }
  }

  // Smart notification timing
  static Future<DateTime> getOptimalNotificationTime(
    String taskType,
    DateTime deadline,
    Map<String, dynamic> userPreferences,
  ) async {
    final response = await http.post(
      Uri.parse('$baseUrl/optimal-notification'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'task_type': taskType,
        'deadline': deadline.toIso8601String(),
        'user_preferences': userPreferences,
      }),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return DateTime.parse(data['optimal_time']);
    } else {
      throw Exception('AI notification timing failed: ${response.body}');
    }
  }

  // Timeline predictions
  static Future<Map<String, dynamic>> predictTimeline(
    List<Task> tasks,
    Map<String, dynamic> teamCapacity,
  ) async {
    final response = await http.post(
      Uri.parse('$baseUrl/predict-timeline'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'tasks': tasks.map((task) => task.toJson()).toList(),
        'team_capacity': teamCapacity,
      }),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('AI timeline prediction failed: ${response.body}');
    }
  }

  // Risk assessment
  static Future<List<Map<String, dynamic>>> assessRisks(
    Map<String, dynamic> competition,
    Map<String, dynamic> teamStatus,
  ) async {
    final response = await http.post(
      Uri.parse('$baseUrl/assess-risks'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'competition': competition,
        'team_status': teamStatus,
      }),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(data['risks']);
    } else {
      throw Exception('AI risk assessment failed: ${response.body}');
    }
  }
} 