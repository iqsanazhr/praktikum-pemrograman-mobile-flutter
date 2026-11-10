import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:router_flutter/login_page.dart';
import 'package:router_flutter/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('Modul 3: Login Success Flow', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    // Enter admin credentials
    await tester.enterText(
        find.widgetWithText(TextField, 'Masukkan Username'), 'admin');
    await tester.enterText(
        find.widgetWithText(TextField, 'Masukkan Password'), 'admin');

    // Tap Login button
    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
    await tester.pumpAndSettle();

    // Verify dialog appears
    expect(find.text('Anda Berhasil Login'), findsOneWidget);

    // Tap OK on dialog
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    // Verify HomePage is displayed with username admin
    expect(find.text('Home Page'), findsOneWidget);
    expect(find.text('Ini adalah halaman User admin'), findsOneWidget);
  });

  testWidgets('Modul 3: Login Failed Flow', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    // Enter wrong credentials
    await tester.enterText(
        find.widgetWithText(TextField, 'Masukkan Username'), 'user');
    await tester.enterText(
        find.widgetWithText(TextField, 'Masukkan Password'), '1234');

    // Tap Login button
    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
    await tester.pumpAndSettle();

    // Verify error dialog appears
    expect(find.text('Username dan Password Salah'), findsOneWidget);
  });

  testWidgets('Modul 3: HomePage Drawer and AboutPage navigation', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({'username': 'admin'});
    await tester.pumpWidget(const MaterialApp(home: HomePage()));
    await tester.pumpAndSettle();

    expect(find.text('Home Page'), findsOneWidget);
    expect(find.text('Ini adalah halaman User admin'), findsOneWidget);

    // Open Drawer
    final ScaffoldState state = tester.firstState(find.byType(Scaffold));
    state.openDrawer();
    await tester.pumpAndSettle();

    // Verify Drawer Header and menu items
    expect(find.text('Sidemenu'), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('About'), findsOneWidget);

    // Tap About menu item
    await tester.tap(find.text('About'));
    await tester.pumpAndSettle();

    // Verify AboutPage is displayed
    expect(find.text('About Page'), findsOneWidget);
    expect(find.text('Ini adalah halaman About'), findsOneWidget);
  });
}
