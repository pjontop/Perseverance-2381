import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/competition/task_model.dart';
import '../models/competition/team_recommendation_model.dart';
import '../models/competition/match_strategy_model.dart';
import '../models/competition/inventory_alert_model.dart';

class AIService {
  static const String baseUrl = 'https://ai.hackclub.com';
  static const String apiKey = 'your-ai-api-key'; // TODO: Replace with actual API key

  // Smart task prioritization
  static Future<List<Task>> prioritizeTasks(List<Task> tasks) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/prioritize-tasks'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          'tasks': tasks.map((task) => task.toJson()).toList(),
          'context': {
            'competition_date': DateTime.now().add(const Duration(days: 30)).toIso8601String(),
            'team_capacity': 10,
            'current_workload': 0.7,
          },
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return (data['prioritized_tasks'] as List)
            .map((taskJson) => Task.fromJson(taskJson))
            .toList();
      } else {
        // Fallback to local prioritization
        return _localPrioritizeTasks(tasks);
      }
    } catch (e) {
      // Fallback to local prioritization
      return _localPrioritizeTasks(tasks);
    }
  }

  // Alliance partner recommendations
  static Future<List<TeamRecommendation>> suggestAlliances(
    List<Map<String, dynamic>> availableTeams,
    Map<String, dynamic> ourPerformance,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/suggest-alliances'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          'available_teams': availableTeams,
          'our_performance': ourPerformance,
          'preferences': {
            'playstyle': 'aggressive',
            'strengths': ['autonomous', 'driver_skills'],
            'weaknesses': ['endgame'],
          },
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return (data['recommendations'] as List)
            .map((recJson) => TeamRecommendation.fromJson(recJson))
            .toList();
      } else {
        // Fallback to local recommendations
        return _localSuggestAlliances(availableTeams, ourPerformance);
      }
    } catch (e) {
      // Fallback to local recommendations
      return _localSuggestAlliances(availableTeams, ourPerformance);
    }
  }

  // Match strategy suggestions
  static Future<String> generateMatchStrategy(
    Map<String, dynamic> opponent,
    Map<String, dynamic> field,
    List<Map<String, dynamic>> history,
  ) async {
    try {
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
          'our_capabilities': {
            'autonomous_score': 15,
            'driver_skills': 'high',
            'endgame': 'medium',
          },
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['strategy'] ?? 'Focus on autonomous and driver skills';
      } else {
        // Fallback to local strategy
        return _localGenerateStrategy(opponent, field, history);
      }
    } catch (e) {
      // Fallback to local strategy
      return _localGenerateStrategy(opponent, field, history);
    }
  }

  // Intelligent inventory alerts
  static Future<List<InventoryAlert>> analyzeInventory(
    List<Map<String, dynamic>> items,
    List<Map<String, dynamic>> events,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/analyze-inventory'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          'inventory': items,
          'upcoming_events': events,
          'usage_patterns': {
            'high_usage_items': ['motors', 'gears', 'screws'],
            'critical_items': ['batteries', 'controllers'],
          },
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return (data['alerts'] as List)
            .map((alertJson) => InventoryAlert.fromJson(alertJson))
            .toList();
      } else {
        // Fallback to local analysis
        return _localAnalyzeInventory(items, events);
      }
    } catch (e) {
      // Fallback to local analysis
      return _localAnalyzeInventory(items, events);
    }
  }

  // Performance insights
  static Future<Map<String, dynamic>> analyzePerformance(
    List<Map<String, dynamic>> matches,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/analyze-performance'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          'matches': matches,
          'analysis_type': 'comprehensive',
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        // Fallback to local analysis
        return _localAnalyzePerformance(matches);
      }
    } catch (e) {
      // Fallback to local analysis
      return _localAnalyzePerformance(matches);
    }
  }

  // Smart notification timing
  static Future<DateTime> getOptimalNotificationTime(
    String taskType,
    DateTime deadline,
    Map<String, dynamic> userPreferences,
  ) async {
    try {
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
        // Fallback to local calculation
        return _localGetOptimalNotificationTime(taskType, deadline);
      }
    } catch (e) {
      // Fallback to local calculation
      return _localGetOptimalNotificationTime(taskType, deadline);
    }
  }

  // Timeline predictions
  static Future<Map<String, dynamic>> predictTimeline(
    List<Task> tasks,
    Map<String, dynamic> teamCapacity,
  ) async {
    try {
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
        final data = jsonDecode(response.body);
        return data;
      } else {
        // Fallback to local prediction
        return _localPredictTimeline(tasks, teamCapacity);
      }
    } catch (e) {
      // Fallback to local prediction
      return _localPredictTimeline(tasks, teamCapacity);
    }
  }

  // Risk assessment
  static Future<List<Map<String, dynamic>>> assessRisks(
    Map<String, dynamic> competition,
    Map<String, dynamic> teamStatus,
  ) async {
    try {
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
        // Fallback to local assessment
        return _localAssessRisks(competition, teamStatus);
      }
    } catch (e) {
      // Fallback to local assessment
      return _localAssessRisks(competition, teamStatus);
    }
  }

  // Local fallback methods
  static List<Task> _localPrioritizeTasks(List<Task> tasks) {
    // Simple local prioritization based on deadline and importance
    tasks.sort((a, b) {
      if (a.priority != b.priority) {
        return b.priority.index.compareTo(a.priority.index);
      }
      return a.deadline.compareTo(b.deadline);
    });
    return tasks;
  }

  static List<TeamRecommendation> _localSuggestAlliances(
    List<Map<String, dynamic>> availableTeams,
    Map<String, dynamic> ourPerformance,
  ) {
    // Simple local alliance suggestions
    return availableTeams.take(3).map((team) {
      final score = (team['performanceMetrics']?['averageScore'] ?? 0) as int;
      return TeamRecommendation(
        teamId: team['id'],
        teamName: team['name'],
        compatibilityScore: score / 100.0,
        reasoning: 'Based on performance metrics',
        strengths: team['strengths'] ?? [],
        weaknesses: team['weaknesses'] ?? [],
      );
    }).toList();
  }

  static String _localGenerateStrategy(
    Map<String, dynamic> opponent,
    Map<String, dynamic> field,
    List<Map<String, dynamic>> history,
  ) {
    // Simple local strategy generation
    final opponentScore = opponent['performanceMetrics']?['averageScore'] ?? 0;
    if (opponentScore > 90) {
      return 'Focus on autonomous and driver skills. Play defensively.';
    } else if (opponentScore > 70) {
      return 'Balanced approach. Focus on scoring opportunities.';
    } else {
      return 'Aggressive strategy. Maximize scoring potential.';
    }
  }

  static List<InventoryAlert> _localAnalyzeInventory(
    List<Map<String, dynamic>> items,
    List<Map<String, dynamic>> events,
  ) {
    // Simple local inventory analysis
    final alerts = <InventoryAlert>[];
    
    for (final item in items) {
      final quantity = item['quantity'] ?? 0;
      final minimumStock = item['minimumStock'] ?? 5;
      
      if (quantity <= minimumStock) {
        alerts.add(InventoryAlert(
          itemId: item['id'],
          itemName: item['name'],
          alertType: AlertType.lowStock,
          message: 'Low stock: ${item['name']}',
          priority: Priority.high,
          suggestedAction: 'Order more ${item['name']}',
        ));
      }
    }
    
    return alerts;
  }

  static Map<String, dynamic> _localAnalyzePerformance(
    List<Map<String, dynamic>> matches,
  ) {
    // Simple local performance analysis
    if (matches.isEmpty) return {};
    
    final totalScore = matches.fold<int>(0, (sum, match) => 
      sum + (match['scores']?['total'] ?? 0));
    final averageScore = totalScore / matches.length;
    
    return {
      'average_score': averageScore,
      'total_matches': matches.length,
      'trend': averageScore > 80 ? 'improving' : 'needs_work',
      'recommendations': [
        'Focus on autonomous phase',
        'Improve driver skills',
        'Practice endgame scenarios',
      ],
    };
  }

  static DateTime _localGetOptimalNotificationTime(
    String taskType,
    DateTime deadline,
  ) {
    // Simple local notification timing
    switch (taskType) {
      case 'critical':
        return deadline.subtract(const Duration(days: 7));
      case 'important':
        return deadline.subtract(const Duration(days: 3));
      default:
        return deadline.subtract(const Duration(days: 1));
    }
  }

  static Map<String, dynamic> _localPredictTimeline(
    List<Task> tasks,
    Map<String, dynamic> teamCapacity,
  ) {
    // Simple local timeline prediction
    final totalHours = tasks.fold<int>(0, (sum, task) => sum + task.estimatedHours);
    final availableHours = teamCapacity['available_hours'] ?? 40;
    final weeksNeeded = (totalHours / availableHours).ceil();
    
    return {
      'estimated_completion': DateTime.now().add(Duration(weeks: weeksNeeded)),
      'total_hours': totalHours,
      'available_hours': availableHours,
      'confidence': 0.8,
    };
  }

  static List<Map<String, dynamic>> _localAssessRisks(
    Map<String, dynamic> competition,
    Map<String, dynamic> teamStatus,
  ) {
    // Simple local risk assessment
    final risks = <Map<String, dynamic>>[];
    
    if (teamStatus['robot_ready'] == false) {
      risks.add({
        'type': 'robot_not_ready',
        'severity': 'high',
        'description': 'Robot not ready for competition',
        'mitigation': 'Accelerate robot completion',
      });
    }
    
    if (teamStatus['registration_complete'] == false) {
      risks.add({
        'type': 'registration_incomplete',
        'severity': 'critical',
        'description': 'Registration not completed',
        'mitigation': 'Complete registration immediately',
      });
    }
    
    return risks;
  }
} 