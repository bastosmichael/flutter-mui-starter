
import 'package:flutter/material.dart';
import 'package:semper_made/config/router.dart';
import 'package:semper_made/theme/color_themes.dart';
import 'package:semper_made/theme/text_themes.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() => runApp(const SemperMadeApp());

/// The main app.
class SemperMadeApp extends StatelessWidget {
  /// Constructs a [SemperMadeApp]
  const SemperMadeApp({super.key, this.textThemeOverride});

  /// Optional override for the app text theme (useful for testing without
  /// google_fonts asset loading).
  final TextTheme? textThemeOverride;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'SemperMade Demo',
      routerConfig: router,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          textTheme: textThemeOverride ?? textTheme),
      darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
          textTheme: textThemeOverride ?? textTheme),
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
    );
  }
}
