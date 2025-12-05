// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_mui_starter/main.dart';


void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    const manifestJson = '''
{
  "packages/google_fonts/google_fonts/Roboto-Regular.ttf": ["packages/google_fonts/google_fonts/Roboto-Regular.ttf"],
  "packages/google_fonts/google_fonts/Roboto-Medium.ttf": ["packages/google_fonts/google_fonts/Roboto-Medium.ttf"],
  "packages/google_fonts/google_fonts/Roboto-Light.ttf": ["packages/google_fonts/google_fonts/Roboto-Light.ttf"]
}
''';

    final manifestByteData = utf8.encoder
        .convert(manifestJson)
        .buffer
        .asByteData();

    final defaultMessenger =
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;

    defaultMessenger.setMockMessageHandler('flutter/assets', (message) async {
      if (message == null) return null;

      final key = utf8.decode(message.buffer.asUint8List());

      if (key == 'AssetManifest.json') {
        return manifestByteData;
      }

      // Allow tests to proceed even if fonts are not available.
      if (key.startsWith('packages/google_fonts')) {
        return ByteData(0);
      }

      return null;
    });

    GoogleFonts.config.allowRuntimeFetching = false;
  });

  tearDownAll(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMessageHandler('flutter/assets', null);
  });

  testWidgets('FlutterMuiStarterApp renders without errors', (tester) async {
    await tester.pumpWidget(
      FlutterMuiStarterApp(
        textThemeOverride: Typography.material2021().black,
      ),
    );

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
