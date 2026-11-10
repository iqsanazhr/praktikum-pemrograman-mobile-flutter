import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:router_flutter/main.dart';

void main() {
  testWidgets('MyApp smoke test displays ProdukPage', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Verify AppBar title 'List Produk'
    expect(find.text('List Produk'), findsOneWidget);

    // Verify product items exist
    expect(find.text('Kamera'), findsOneWidget);
    expect(find.text('Kulkas'), findsOneWidget);
    expect(find.text('Mesin Cuci'), findsOneWidget);

    // Verify add icon
    expect(find.byIcon(Icons.add), findsOneWidget);
  });
}
