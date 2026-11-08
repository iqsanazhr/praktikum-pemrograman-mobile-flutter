import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:router_flutter/hello_world.dart';
import 'package:router_flutter/column_widget.dart';
import 'package:router_flutter/row_widget.dart';
import 'package:router_flutter/ui/produk_form.dart';
import 'package:router_flutter/ui/produk_page.dart';

void main() {
  testWidgets('HelloWorld renders properly', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HelloWorld()));
    expect(find.text('Belajar Flutter'), findsOneWidget);
    expect(find.text('Hello World'), findsOneWidget);
  });

  testWidgets('ColumnWidget renders all columns', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ColumnWidget()));
    expect(find.text('Widget Column'), findsOneWidget);
    expect(find.text('Kolom 1'), findsOneWidget);
    expect(find.text('Kolom 2'), findsOneWidget);
    expect(find.text('Kolom 3'), findsOneWidget);
    expect(find.text('Kolom 4'), findsOneWidget);
  });

  testWidgets('RowWidget renders all rows', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: RowWidget()));
    expect(find.text('Widget Row'), findsOneWidget);
    expect(find.text('Row 1'), findsOneWidget);
    expect(find.text('Row 2'), findsOneWidget);
    expect(find.text('Row 3'), findsOneWidget);
    expect(find.text('Row 4'), findsOneWidget);
  });

  testWidgets('ProdukPage renders product cards', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ProdukPage()));
    expect(find.text('List Data Produk'), findsOneWidget);
    expect(find.text('Kulkas'), findsOneWidget);
    expect(find.text('Playstation'), findsOneWidget);
    expect(find.text('Radio'), findsOneWidget);
  });

  testWidgets('ProdukForm input and navigation to ProdukDetail', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ProdukForm()));

    // Verify fields
    expect(find.text('Form Produk'), findsOneWidget);
    expect(find.widgetWithText(TextField, 'Kode Produk'), findsOneWidget);
    expect(find.widgetWithText(TextField, 'Nama Produk'), findsOneWidget);
    expect(find.widgetWithText(TextField, 'Harga'), findsOneWidget);

    // Enter text
    await tester.enterText(find.widgetWithText(TextField, 'Kode Produk'), 'A001');
    await tester.enterText(find.widgetWithText(TextField, 'Nama Produk'), 'Laptop ASUS');
    await tester.enterText(find.widgetWithText(TextField, 'Harga'), '7500000');

    // Tap Simpan
    await tester.tap(find.widgetWithText(ElevatedButton, 'Simpan'));
    await tester.pumpAndSettle();

    // Verify navigation to ProdukDetail
    expect(find.text('Detail Produk'), findsOneWidget);
    expect(find.text('Kode Produk : A001'), findsOneWidget);
    expect(find.text('Nama Produk : Laptop ASUS'), findsOneWidget);
    expect(find.text('Harga Produk : 7500000'), findsOneWidget);
  });
}
