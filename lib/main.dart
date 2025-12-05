
import 'package:flutter/material.dart';
import 'package:flutter_mui_starter/config/router.dart';
import 'package:flutter_mui_starter/theme/color_themes.dart';
import 'package:flutter_mui_starter/theme/text_themes.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() => runApp(const FlutterMuiStarterApp());

/// The main app.
class FlutterMuiStarterApp extends StatelessWidget {
  /// Constructs a [FlutterMuiStarterApp]
  const FlutterMuiStarterApp({super.key, this.textThemeOverride});

  /// Optional override for the app text theme (useful for testing without
  /// google_fonts asset loading).
  final TextTheme? textThemeOverride;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'FlutterMuiStarter Demo',
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
