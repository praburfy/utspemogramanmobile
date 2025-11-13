// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pj1/main.dart';

void main() {
  testWidgets('App builds and shows title', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Wait for splash screen to finish
    await tester.pumpAndSettle(const Duration(seconds: 6));

    // Verify the app built and the old UTS label does not appear
    expect(find.byType(MyApp), findsOneWidget);
    expect(find.text('UTS Mobile App'), findsNothing);
  });

  testWidgets('Dashboard displays menu items', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Wait for splash screen
    await tester.pumpAndSettle(const Duration(seconds: 6));

    // Verify drawer menu items exist
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    expect(find.text('Biodata'), findsWidgets);
    expect(find.text('Kontak'), findsWidgets);
    expect(find.text('Kalkulator'), findsWidgets);
    expect(find.text('Cuaca'), findsWidgets);
    expect(find.text('Berita'), findsWidgets);
  });
}
