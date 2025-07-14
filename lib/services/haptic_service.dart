import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Haptic Service
/// 
/// Provides comprehensive haptic feedback throughout the app
/// with configurable intensity and patterns.
class HapticService {
  static const String _hapticEnabledKey = 'haptic_enabled';
  static const String _hapticIntensityKey = 'haptic_intensity';
  
  static bool _isEnabled = true;
  static HapticIntensity _intensity = HapticIntensity.medium;

  /// Initialize haptic service with user preferences
  static Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    _isEnabled = prefs.getBool(_hapticEnabledKey) ?? true;
    _intensity = HapticIntensity.values[
      prefs.getInt(_hapticIntensityKey) ?? HapticIntensity.medium.index
    ];
  }

  /// Update haptic settings
  static Future<void> updateSettings({
    bool? enabled,
    HapticIntensity? intensity,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    
    if (enabled != null) {
      _isEnabled = enabled;
      await prefs.setBool(_hapticEnabledKey, enabled);
    }
    
    if (intensity != null) {
      _intensity = intensity;
      await prefs.setInt(_hapticIntensityKey, intensity.index);
    }
  }

  /// Get current haptic settings
  static Map<String, dynamic> getSettings() {
    return {
      'enabled': _isEnabled,
      'intensity': _intensity,
    };
  }

  /// Light tap for button presses, tab switches, list item taps
  static void lightTap() {
    if (!_isEnabled) return;
    _triggerHaptic(HapticFeedback.lightImpact);
  }

  /// Medium tap for task completion, form submissions, photo capture
  static void mediumTap() {
    if (!_isEnabled) return;
    _triggerHaptic(HapticFeedback.mediumImpact);
  }

  /// Heavy tap for important actions (delete, submit competition data)
  static void heavyTap() {
    if (!_isEnabled) return;
    _triggerHaptic(HapticFeedback.heavyImpact);
  }

  /// Success pattern for task completed, match won, goal achieved
  static void success() {
    if (!_isEnabled) return;
    _triggerHaptic(HapticFeedback.vibrate);
  }

  /// Error pattern for form validation errors, connection issues
  static void error() {
    if (!_isEnabled) return;
    _triggerHaptic(HapticFeedback.vibrate);
  }

  /// Custom pattern for match start countdown, competition alerts
  static void customPattern() {
    if (!_isEnabled) return;
    _triggerHaptic(() => HapticFeedback.vibrate());
  }

  /// Selection feedback for pickers, sliders, switches
  static void selection() {
    if (!_isEnabled) return;
    _triggerHaptic(HapticFeedback.selectionClick);
  }

  /// Warning feedback for destructive actions
  static void warning() {
    if (!_isEnabled) return;
    _triggerHaptic(() => HapticFeedback.heavyImpact());
  }

  /// Competition countdown pattern
  static void countdown() {
    if (!_isEnabled) return;
    Future.delayed(const Duration(milliseconds: 0), () {
      HapticFeedback.lightImpact();
    });
    Future.delayed(const Duration(milliseconds: 200), () {
      HapticFeedback.mediumImpact();
    });
    Future.delayed(const Duration(milliseconds: 400), () {
      HapticFeedback.heavyImpact();
    });
  }

  /// Match start pattern
  static void matchStart() {
    if (!_isEnabled) return;
    Future.delayed(const Duration(milliseconds: 0), () {
      HapticFeedback.heavyImpact();
    });
    Future.delayed(const Duration(milliseconds: 300), () {
      HapticFeedback.mediumImpact();
    });
    Future.delayed(const Duration(milliseconds: 600), () {
      HapticFeedback.lightImpact();
    });
  }

  /// Victory pattern
  static void victory() {
    if (!_isEnabled) return;
    for (int i = 0; i < 3; i++) {
      Future.delayed(Duration(milliseconds: i * 200), () {
        HapticFeedback.vibrate();
      });
    }
  }

  /// Defeat pattern
  static void defeat() {
    if (!_isEnabled) return;
    Future.delayed(const Duration(milliseconds: 0), () {
      HapticFeedback.heavyImpact();
    });
    Future.delayed(const Duration(milliseconds: 500), () {
      HapticFeedback.lightImpact();
    });
  }

  /// Data sync pattern
  static void dataSync() {
    if (!_isEnabled) return;
    Future.delayed(const Duration(milliseconds: 0), () {
      HapticFeedback.lightImpact();
    });
    Future.delayed(const Duration(milliseconds: 150), () {
      HapticFeedback.lightImpact();
    });
    Future.delayed(const Duration(milliseconds: 300), () {
      HapticFeedback.mediumImpact();
    });
  }

  /// Chart interaction pattern
  static void chartInteraction() {
    if (!_isEnabled) return;
    _triggerHaptic(HapticFeedback.selectionClick);
  }

  /// Form validation pattern
  static void formValidation(bool isValid) {
    if (!_isEnabled) return;
    if (isValid) {
      _triggerHaptic(HapticFeedback.lightImpact);
    } else {
      _triggerHaptic(HapticFeedback.vibrate);
    }
  }

  /// Navigation pattern
  static void navigation() {
    if (!_isEnabled) return;
    _triggerHaptic(HapticFeedback.selectionClick);
  }

  /// Refresh pattern
  static void refresh() {
    if (!_isEnabled) return;
    _triggerHaptic(HapticFeedback.lightImpact);
  }

  /// Export pattern
  static void export() {
    if (!_isEnabled) return;
    _triggerHaptic(HapticFeedback.mediumImpact);
  }

  /// Settings change pattern
  static void settingsChange() {
    if (!_isEnabled) return;
    _triggerHaptic(HapticFeedback.lightImpact);
  }

  /// Helper method to trigger haptic with intensity consideration
  static void _triggerHaptic(Function hapticFunction) {
    switch (_intensity) {
      case HapticIntensity.light:
        // Use lighter haptic for light intensity
        if (hapticFunction == HapticFeedback.heavyImpact) {
          HapticFeedback.mediumImpact();
        } else if (hapticFunction == HapticFeedback.mediumImpact) {
          HapticFeedback.lightImpact();
        } else {
          hapticFunction();
        }
        break;
      case HapticIntensity.medium:
        hapticFunction();
        break;
      case HapticIntensity.heavy:
        // Use heavier haptic for heavy intensity
        if (hapticFunction == HapticFeedback.lightImpact) {
          HapticFeedback.mediumImpact();
        } else if (hapticFunction == HapticFeedback.mediumImpact) {
          HapticFeedback.heavyImpact();
        } else {
          hapticFunction();
        }
        break;
    }
  }
}

/// Haptic intensity levels
enum HapticIntensity {
  light,
  medium,
  heavy,
} 