import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  const AppTheme._();

  static const _flexSchemeColorLight = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF6750A4),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFEADDFF),
    onPrimaryContainer: Color(0xFF4F378B),
    primaryFixed: Color(0xFFEADDFF),
    primaryFixedDim: Color(0xFFD0BCFF),
    onPrimaryFixed: Color(0xFF21005D),
    onPrimaryFixedVariant: Color(0xFF4F378B),
    secondary: Color(0xFF625B71),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFE8DEF8),
    onSecondaryContainer: Color(0xFF4A4458),
    secondaryFixed: Color(0xFFE8DEF8),
    secondaryFixedDim: Color(0xFFCCC2DC),
    onSecondaryFixed: Color(0xFF1D192B),
    onSecondaryFixedVariant: Color(0xFF4A4458),
    tertiary: Color(0xFF7D5260),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFFFD8E4),
    onTertiaryContainer: Color(0xFF633B48),
    tertiaryFixed: Color(0xFFFFD8E4),
    tertiaryFixedDim: Color(0xFFEFB8C8),
    onTertiaryFixed: Color(0xFF31111D),
    onTertiaryFixedVariant: Color(0xFF633B48),
    error: Color(0xFFB3261E),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFF9DEDC),
    onErrorContainer: Color(0xFF8C1D18),
    surface: Color(0xFFFEF7FF),
    surfaceBright: Color(0xFFFEF7FF),
    surfaceContainerLowest: Color(0xFFFFFFFF),
    surfaceContainerLow: Color(0xFFF7F2FA),
    surfaceContainer: Color(0xFFF3EDF7),
    surfaceContainerHigh: Color(0xFFECE6F0),
    surfaceContainerHighest: Color(0xFFE6E0E9),
    surfaceDim: Color(0xFFDED8E1),
    onSurface: Color(0xFF1D1B20),
    onSurfaceVariant: Color(0xFF49454F),
    outline: Color(0xFF79747E),
    outlineVariant: Color(0xFFCAC4D0),
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    inverseSurface: Color(0xFF322F35),
    onInverseSurface: Color(0xFFF5EFF7),
    inversePrimary: Color(0xFFD0BCFF),
    // The surfaceTint color is set to the same color as the primary.
    surfaceTint: Color(0xFF6750A4),
  );

  static const _flexSchemeColorDark = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFD0BCFF),
    onPrimary: Color(0xFF381E72),
    primaryContainer: Color(0xFF4F378B),
    onPrimaryContainer: Color(0xFFEADDFF),
    primaryFixed: Color(0xFFEADDFF),
    primaryFixedDim: Color(0xFFD0BCFF),
    onPrimaryFixed: Color(0xFF21005D),
    onPrimaryFixedVariant: Color(0xFF4F378B),
    secondary: Color(0xFFCCC2DC),
    onSecondary: Color(0xFF332D41),
    secondaryContainer: Color(0xFF4A4458),
    onSecondaryContainer: Color(0xFFE8DEF8),
    secondaryFixed: Color(0xFFE8DEF8),
    secondaryFixedDim: Color(0xFFCCC2DC),
    onSecondaryFixed: Color(0xFF1D192B),
    onSecondaryFixedVariant: Color(0xFF4A4458),
    tertiary: Color(0xFFEFB8C8),
    onTertiary: Color(0xFF492532),
    tertiaryContainer: Color(0xFF633B48),
    onTertiaryContainer: Color(0xFFFFD8E4),
    tertiaryFixed: Color(0xFFFFD8E4),
    tertiaryFixedDim: Color(0xFFEFB8C8),
    onTertiaryFixed: Color(0xFF31111D),
    onTertiaryFixedVariant: Color(0xFF633B48),
    error: Color(0xFFF2B8B5),
    onError: Color(0xFF601410),
    errorContainer: Color(0xFF8C1D18),
    onErrorContainer: Color(0xFFF9DEDC),
    surface: Color(0xFF141218),
    surfaceBright: Color(0xFF3B383E),
    surfaceContainerLowest: Color(0xFF0F0D13),
    surfaceContainerLow: Color(0xFF1D1B20),
    surfaceContainer: Color(0xFF211F26),
    surfaceContainerHigh: Color(0xFF2B2930),
    surfaceContainerHighest: Color(0xFF36343B),
    surfaceDim: Color(0xFF141218),
    onSurface: Color(0xFFE6E0E9),
    onSurfaceVariant: Color(0xFFCAC4D0),
    outline: Color(0xFF938F99),
    outlineVariant: Color(0xFF49454F),
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    inverseSurface: Color(0xFFE6E0E9),
    onInverseSurface: Color(0xFF322F35),
    inversePrimary: Color(0xFF6750A4),
    // The surfaceTint color is set to the same color as the primary.
    surfaceTint: Color(0xFFD0BCFF),
  );

  static ThemeData get lightTheme => FlexThemeData.light(
    colorScheme: _flexSchemeColorLight,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 7,
    scaffoldBackground: _flexSchemeColorLight.surface,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 10,
      blendOnColors: false,
      useTextTheme: true,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
    ),
    textTheme: TextTheme(
      labelLarge: TextStyle(
        color: _flexSchemeColorLight.onPrimary,
        fontSize: 17.sp,
      ),
      bodyLarge: TextStyle(
        color: _flexSchemeColorLight.onPrimaryContainer,
        fontSize: 16.sp,
      ),
      titleLarge: TextStyle(
        color: _flexSchemeColorLight.onSurface,
        fontSize: 21.sp,
      ),
      titleMedium: TextStyle(
        color: _flexSchemeColorLight.onPrimaryContainer,
        fontSize: 16.sp,
      ),
      headlineLarge: TextStyle(
        color: _flexSchemeColorLight.onSecondary,
        fontSize: 30.sp,
      ),
      headlineMedium: TextStyle(
        color: _flexSchemeColorLight.onSecondary,
        fontSize: 17.sp,
      ),
      displayLarge: TextStyle(
        color: _flexSchemeColorLight.onSecondary,
        fontSize: 16.sp,
      ),
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      },
    ),
  );

  static ThemeData get darkTheme => FlexThemeData.dark(
    colorScheme: _flexSchemeColorDark,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    scaffoldBackground: _flexSchemeColorDark.surface,
    blendLevel: 7,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 10,
      blendOnColors: false,
      useTextTheme: true,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
    ),
    textTheme: TextTheme(
      labelLarge: TextStyle(
        color: _flexSchemeColorDark.onSurface,
        fontSize: 17.sp,
      ),
      bodyLarge: TextStyle(
        color: _flexSchemeColorDark.onSurface,
        fontSize: 16.sp,
      ),
      titleLarge: TextStyle(
        color: _flexSchemeColorDark.onSurface,
        fontSize: 21.sp,
      ),
      titleMedium: TextStyle(
        color: _flexSchemeColorDark.onSurface,
        fontSize: 16.sp,
      ),
      headlineLarge: TextStyle(
        color: _flexSchemeColorDark.onPrimaryContainer,
        fontSize: 30.sp,
      ),
      headlineMedium: TextStyle(
        color: _flexSchemeColorDark.onPrimaryContainer,
        fontSize: 17.sp,
      ),
      displayLarge: TextStyle(
        color: _flexSchemeColorDark.onSurface,
        fontSize: 16.sp,
      ),
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      },
    ),
  );
}
