import 'package:flutter/material.dart';
import '../utils/colors.dart';

/// Custom Button Widget
/// 
/// This file will contain reusable custom button widgets.
/// TODO: Implement custom button widgets with Perseverance styling.
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isPrimary;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isPrimary = true,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Implement custom button with Perseverance styling
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

class PerseveranceButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final String? tooltip;
  final bool autofocus;
  final String? semanticsLabel;

  const PerseveranceButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.tooltip,
    this.autofocus = false,
    this.semanticsLabel,
  });

  @override
  Widget build(BuildContext context) {
    final button = FilledButton(
      onPressed: onPressed,
      autofocus: autofocus,
      style: FilledButton.styleFrom(
        backgroundColor: PerseveranceColors.buttonFill,
        foregroundColor: PerseveranceColors.primaryButtonText,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
      ),
      child: child,
    );
    return Tooltip(
      message: tooltip ?? semanticsLabel ?? '',
      child: Semantics(
        label: semanticsLabel,
        button: true,
        child: Focus(
          child: button,
        ),
      ),
    );
  }
} 