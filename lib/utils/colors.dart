import 'package:flutter/material.dart';

/// Perseverance Colors
/// 
/// This file contains the color scheme for the VEX Robotics Team Perseverance app
/// using the new Material Design 3 theme colors.
class PerseveranceColors {
  // Private constructor to prevent instantiation
  PerseveranceColors._();

  // Primary Colors
  static const Color primary = Color(0xff4c662b);
  static const Color onPrimary = Color(0xffffffff);
  static const Color primaryContainer = Color(0xffcdeda3);
  static const Color onPrimaryContainer = Color(0xff354e16);

  // Secondary Colors
  static const Color secondary = Color(0xff586249);
  static const Color onSecondary = Color(0xffffffff);
  static const Color secondaryContainer = Color(0xffdce7c8);
  static const Color onSecondaryContainer = Color(0xff404a33);

  // Tertiary Colors
  static const Color tertiary = Color(0xff386663);
  static const Color onTertiary = Color(0xffffffff);
  static const Color tertiaryContainer = Color(0xffbcece7);
  static const Color onTertiaryContainer = Color(0xff1f4e4b);

  // Error Colors
  static const Color error = Color(0xffba1a1a);
  static const Color onError = Color(0xffffffff);
  static const Color errorContainer = Color(0xffffdad6);
  static const Color onErrorContainer = Color(0xff93000a);

  // Surface Colors
  static const Color surface = Color(0xfff9faef);
  static const Color onSurface = Color(0xff1a1c16);
  static const Color onSurfaceVariant = Color(0xff44483d);
  static const Color surfaceDim = Color(0xffdadbd0);
  static const Color surfaceBright = Color(0xfff9faef);
  static const Color surfaceContainerLowest = Color(0xffffffff);
  static const Color surfaceContainerLow = Color(0xfff3f4e9);
  static const Color surfaceContainer = Color(0xffeeefe3);
  static const Color surfaceContainerHigh = Color(0xffe8e9de);
  static const Color surfaceContainerHighest = Color(0xffe2e3d8);

  // Outline Colors
  static const Color outline = Color(0xff75796c);
  static const Color outlineVariant = Color(0xffc5c8ba);

  // Shadow and Scrim
  static const Color shadow = Color(0xff000000);
  static const Color scrim = Color(0xff000000);

  // Inverse Colors
  static const Color inverseSurface = Color(0xff2f312a);
  static const Color inversePrimary = Color(0xffb1d18a);

  // Fixed Colors
  static const Color primaryFixed = Color(0xffcdeda3);
  static const Color onPrimaryFixed = Color(0xff102000);
  static const Color primaryFixedDim = Color(0xffb1d18a);
  static const Color onPrimaryFixedVariant = Color(0xff354e16);
  static const Color secondaryFixed = Color(0xffdce7c8);
  static const Color onSecondaryFixed = Color(0xff151e0b);
  static const Color secondaryFixedDim = Color(0xffbfcbad);
  static const Color onSecondaryFixedVariant = Color(0xff404a33);
  static const Color tertiaryFixed = Color(0xffbcece7);
  static const Color onTertiaryFixed = Color(0xff00201e);
  static const Color tertiaryFixedDim = Color(0xffa0d0cb);
  static const Color onTertiaryFixedVariant = Color(0xff1f4e4b);

  // Legacy color names for backward compatibility
  static const Color buttonFill = primary;
  static const Color primaryButtonText = onPrimary;
  static const Color secondaryButtonText = secondary;
  static const Color background = surface;
  static const Color secondaryText = onSurfaceVariant;

  /// Light Color Scheme
  static ColorScheme get colorScheme => const ColorScheme(
    brightness: Brightness.light,
    primary: primary,
    surfaceTint: primary,
    onPrimary: onPrimary,
    primaryContainer: primaryContainer,
    onPrimaryContainer: onPrimaryContainer,
    secondary: secondary,
    onSecondary: onSecondary,
    secondaryContainer: secondaryContainer,
    onSecondaryContainer: onSecondaryContainer,
    tertiary: tertiary,
    onTertiary: onTertiary,
    tertiaryContainer: tertiaryContainer,
    onTertiaryContainer: onTertiaryContainer,
    error: error,
    onError: onError,
    errorContainer: errorContainer,
    onErrorContainer: onErrorContainer,
    surface: surface,
    onSurface: onSurface,
    onSurfaceVariant: onSurfaceVariant,
    outline: outline,
    outlineVariant: outlineVariant,
    shadow: shadow,
    scrim: scrim,
    inverseSurface: inverseSurface,
    inversePrimary: inversePrimary,
    primaryFixed: primaryFixed,
    onPrimaryFixed: onPrimaryFixed,
    primaryFixedDim: primaryFixedDim,
    onPrimaryFixedVariant: onPrimaryFixedVariant,
    secondaryFixed: secondaryFixed,
    onSecondaryFixed: onSecondaryFixed,
    secondaryFixedDim: secondaryFixedDim,
    onSecondaryFixedVariant: onSecondaryFixedVariant,
    tertiaryFixed: tertiaryFixed,
    onTertiaryFixed: onTertiaryFixed,
    tertiaryFixedDim: tertiaryFixedDim,
    onTertiaryFixedVariant: onTertiaryFixedVariant,
    surfaceDim: surfaceDim,
    surfaceBright: surfaceBright,
    surfaceContainerLowest: surfaceContainerLowest,
    surfaceContainerLow: surfaceContainerLow,
    surfaceContainer: surfaceContainer,
    surfaceContainerHigh: surfaceContainerHigh,
    surfaceContainerHighest: surfaceContainerHighest,
  );

  /// Dark Color Scheme
  static ColorScheme get darkColorScheme => const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xffb1d18a),
    surfaceTint: Color(0xffb1d18a),
    onPrimary: Color(0xff1f3701),
    primaryContainer: Color(0xff354e16),
    onPrimaryContainer: Color(0xffcdeda3),
    secondary: Color(0xffbfcbad),
    onSecondary: Color(0xff2a331e),
    secondaryContainer: Color(0xff404a33),
    onSecondaryContainer: Color(0xffdce7c8),
    tertiary: Color(0xffa0d0cb),
    onTertiary: Color(0xff003735),
    tertiaryContainer: Color(0xff1f4e4b),
    onTertiaryContainer: Color(0xffbcece7),
    error: Color(0xffffb4ab),
    onError: Color(0xff690005),
    errorContainer: Color(0xff93000a),
    onErrorContainer: Color(0xffffdad6),
    surface: Color(0xff12140e),
    onSurface: Color(0xffe2e3d8),
    onSurfaceVariant: Color(0xffc5c8ba),
    outline: Color(0xff8f9285),
    outlineVariant: Color(0xff44483d),
    shadow: Color(0xff000000),
    scrim: Color(0xff000000),
    inverseSurface: Color(0xffe2e3d8),
    inversePrimary: Color(0xff4c662b),
    primaryFixed: Color(0xffcdeda3),
    onPrimaryFixed: Color(0xff102000),
    primaryFixedDim: Color(0xffb1d18a),
    onPrimaryFixedVariant: Color(0xff354e16),
    secondaryFixed: Color(0xffdce7c8),
    onSecondaryFixed: Color(0xff151e0b),
    secondaryFixedDim: Color(0xffbfcbad),
    onSecondaryFixedVariant: Color(0xff404a33),
    tertiaryFixed: Color(0xffbcece7),
    onTertiaryFixed: Color(0xff00201e),
    tertiaryFixedDim: Color(0xffa0d0cb),
    onTertiaryFixedVariant: Color(0xff1f4e4b),
    surfaceDim: Color(0xff12140e),
    surfaceBright: Color(0xff383a32),
    surfaceContainerLowest: Color(0xff0c0f09),
    surfaceContainerLow: Color(0xff1a1c16),
    surfaceContainer: Color(0xff1e201a),
    surfaceContainerHigh: Color(0xff282b24),
    surfaceContainerHighest: Color(0xff33362e),
  );
} 