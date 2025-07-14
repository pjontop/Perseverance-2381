import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../services/ai_service.dart';

/// AI Helper Utilities
/// 
/// Provides utility functions for invisible AI integration features
/// that enhance UX without visible AI chat interface.
class AIHelpers {
  static const String _baseUrl = 'https://ai.hackclub.com';
  static const String _apiKey = 'your-ai-api-key'; // TODO: Replace with actual API key

  /// Smart notification timing based on AI analysis
  static Future<DateTime> getOptimalNotificationTime(
    String taskType,
    DateTime deadline,
    Map<String, dynamic> userPreferences,
  ) async {
    try {
      return await AIService.getOptimalNotificationTime(taskType, deadline, userPreferences);
    } catch (e) {
      // Fallback to local calculation
      return _localGetOptimalNotificationTime(taskType, deadline);
    }
  }

  /// AI-enhanced task prioritization
  static Future<List<Map<String, dynamic>>> prioritizeTasks(
    List<Map<String, dynamic>> tasks,
  ) async {
    try {
      // For now, use local prioritization since Task model conversion is complex
      return _localPrioritizeTasks(tasks);
    } catch (e) {
      // Fallback to local prioritization
      return _localPrioritizeTasks(tasks);
    }
  }

  /// AI-powered alliance recommendations
  static Future<List<Map<String, dynamic>>> suggestAlliances(
    List<Map<String, dynamic>> availableTeams,
    Map<String, dynamic> ourPerformance,
  ) async {
    try {
      final recommendations = await AIService.suggestAlliances(availableTeams, ourPerformance);
      return recommendations.map((rec) => _recommendationToMap(rec)).toList();
    } catch (e) {
      // Fallback to local recommendations
      return _localSuggestAlliances(availableTeams, ourPerformance);
    }
  }

  /// AI-generated match strategies
  static Future<String> generateMatchStrategy(
    Map<String, dynamic> opponent,
    Map<String, dynamic> field,
    List<Map<String, dynamic>> history,
  ) async {
    try {
      return await AIService.generateMatchStrategy(opponent, field, history);
    } catch (e) {
      // Fallback to local strategy
      return _localGenerateStrategy(opponent, field, history);
    }
  }

  /// AI-enhanced inventory analysis
  static Future<List<Map<String, dynamic>>> analyzeInventory(
    List<Map<String, dynamic>> items,
    List<Map<String, dynamic>> events,
  ) async {
    try {
      final alerts = await AIService.analyzeInventory(items, events);
      return alerts.map((alert) => _alertToMap(alert)).toList();
    } catch (e) {
      // Fallback to local analysis
      return _localAnalyzeInventory(items, events);
    }
  }

  /// AI performance insights
  static Future<Map<String, dynamic>> analyzePerformance(
    List<Map<String, dynamic>> matches,
  ) async {
    try {
      return await AIService.analyzePerformance(matches);
    } catch (e) {
      // Fallback to local analysis
      return _localAnalyzePerformance(matches);
    }
  }

  /// AI timeline predictions
  static Future<Map<String, dynamic>> predictTimeline(
    List<Map<String, dynamic>> tasks,
    Map<String, dynamic> teamCapacity,
  ) async {
    try {
      // For now, use local prediction since Task model conversion is complex
      return _localPredictTimeline(tasks, teamCapacity);
    } catch (e) {
      // Fallback to local prediction
      return _localPredictTimeline(tasks, teamCapacity);
    }
  }

  /// AI risk assessment
  static Future<List<Map<String, dynamic>>> assessRisks(
    Map<String, dynamic> competition,
    Map<String, dynamic> teamStatus,
  ) async {
    try {
      return await AIService.assessRisks(competition, teamStatus);
    } catch (e) {
      // Fallback to local assessment
      return _localAssessRisks(competition, teamStatus);
    }
  }

  /// Smart text completion for common tasks
  static Future<String> getTextCompletion(String partialText, String context) async {
    try {
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
        return partialText;
      }
    } catch (e) {
      return partialText;
    }
  }

  /// AI-powered resource optimization suggestions
  static Future<List<Map<String, dynamic>>> optimizeResources(
    Map<String, dynamic> currentResources,
    List<Map<String, dynamic>> upcomingEvents,
  ) async {
    try {
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
        return _localOptimizeResources(currentResources, upcomingEvents);
      }
    } catch (e) {
      return _localOptimizeResources(currentResources, upcomingEvents);
    }
  }

  // Helper methods for data conversion
  static dynamic _mapToTask(Map<String, dynamic> map) {
    // This would need to be implemented based on your Task model
    return map;
  }

  static Map<String, dynamic> _taskToMap(dynamic task) {
    // This would need to be implemented based on your Task model
    return task.toJson();
  }

  static Map<String, dynamic> _recommendationToMap(dynamic recommendation) {
    // This would need to be implemented based on your TeamRecommendation model
    return recommendation.toJson();
  }

  static Map<String, dynamic> _alertToMap(dynamic alert) {
    // This would need to be implemented based on your InventoryAlert model
    return alert.toJson();
  }

  // Local fallback methods
  static DateTime _localGetOptimalNotificationTime(String taskType, DateTime deadline) {
    switch (taskType) {
      case 'critical':
        return deadline.subtract(const Duration(days: 7));
      case 'important':
        return deadline.subtract(const Duration(days: 3));
      default:
        return deadline.subtract(const Duration(days: 1));
    }
  }

  static List<Map<String, dynamic>> _localPrioritizeTasks(List<Map<String, dynamic>> tasks) {
    tasks.sort((a, b) {
      final priorityA = a['priority'] ?? 'medium';
      final priorityB = b['priority'] ?? 'medium';
      final priorityOrder = {'critical': 4, 'high': 3, 'medium': 2, 'low': 1};
      return priorityOrder[priorityB]!.compareTo(priorityOrder[priorityA]!);
    });
    return tasks;
  }

  static List<Map<String, dynamic>> _localSuggestAlliances(
    List<Map<String, dynamic>> availableTeams,
    Map<String, dynamic> ourPerformance,
  ) {
    return availableTeams.take(3).map((team) {
      final score = (team['performanceMetrics']?['averageScore'] ?? 0) as int;
      return {
        'teamId': team['id'],
        'teamName': team['name'],
        'compatibilityScore': score / 100.0,
        'reasoning': 'Based on performance metrics',
        'strengths': team['strengths'] ?? [],
        'weaknesses': team['weaknesses'] ?? [],
      };
    }).toList();
  }

  static String _localGenerateStrategy(
    Map<String, dynamic> opponent,
    Map<String, dynamic> field,
    List<Map<String, dynamic>> history,
  ) {
    final opponentScore = opponent['performanceMetrics']?['averageScore'] ?? 0;
    if (opponentScore > 90) {
      return 'Focus on autonomous and driver skills. Play defensively.';
    } else if (opponentScore > 70) {
      return 'Balanced approach. Focus on scoring opportunities.';
    } else {
      return 'Aggressive strategy. Maximize scoring potential.';
    }
  }

  static List<Map<String, dynamic>> _localAnalyzeInventory(
    List<Map<String, dynamic>> items,
    List<Map<String, dynamic>> events,
  ) {
    final alerts = <Map<String, dynamic>>[];
    
    for (final item in items) {
      final quantity = item['quantity'] ?? 0;
      final minimumStock = item['minimumStock'] ?? 5;
      
      if (quantity <= minimumStock) {
        alerts.add({
          'itemId': item['id'],
          'itemName': item['name'],
          'alertType': 'lowStock',
          'message': 'Low stock: ${item['name']}',
          'priority': 'high',
          'suggestedAction': 'Order more ${item['name']}',
        });
      }
    }
    
    return alerts;
  }

  static Map<String, dynamic> _localAnalyzePerformance(List<Map<String, dynamic>> matches) {
    if (matches.isEmpty) return {};
    
    final totalScore = matches.fold<int>(0, (sum, match) => 
      sum + ((match['scores']?['total'] ?? 0) as int));
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

  static Map<String, dynamic> _localPredictTimeline(
    List<Map<String, dynamic>> tasks,
    Map<String, dynamic> teamCapacity,
  ) {
    final totalHours = tasks.fold<int>(0, (sum, task) => sum + ((task['estimatedHours'] ?? 0) as int));
    final availableHours = teamCapacity['available_hours'] ?? 40;
    final weeksNeeded = (totalHours / availableHours).ceil();
    
    return {
      'estimated_completion': DateTime.now().add(Duration(days: weeksNeeded * 7)),
      'total_hours': totalHours,
      'available_hours': availableHours,
      'confidence': 0.8,
    };
  }

  static List<Map<String, dynamic>> _localAssessRisks(
    Map<String, dynamic> competition,
    Map<String, dynamic> teamStatus,
  ) {
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

  static List<Map<String, dynamic>> _localOptimizeResources(
    Map<String, dynamic> currentResources,
    List<Map<String, dynamic>> upcomingEvents,
  ) {
    return [
      {
        'type': 'resource_allocation',
        'suggestion': 'Reallocate 20% of practice time to autonomous testing',
        'impact': 'high',
        'reasoning': 'Based on upcoming competition requirements',
      },
      {
        'type': 'inventory_management',
        'suggestion': 'Order additional motors for backup',
        'impact': 'medium',
        'reasoning': 'Current stock may not last through next competition',
      },
    ];
  }
} 