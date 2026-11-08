import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:router_flutter/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('LoginPage smoke test and validation', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    await tester.pumpWidget(const MyApp());

    // Verify AppBar title 'Login'
    expect(find.text('Login'), findsWidgets);

    // Verify input fields
    expect(find.widgetWithText(TextField, 'Masukkan Username'), findsOneWidget);
    expect(find.widgetWithText(TextField, 'Masukkan Password'), findsOneWidget);

    // Verify Login button
    expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
  });
}
