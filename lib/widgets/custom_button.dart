import 'package:flutter/material.dart';

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