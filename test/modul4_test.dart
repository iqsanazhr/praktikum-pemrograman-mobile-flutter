import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:router_flutter/model/login.dart';
import 'package:router_flutter/model/registrasi.dart';
import 'package:router_flutter/model/produk.dart';
import 'package:router_flutter/ui/registrasi_page.dart';
import 'package:router_flutter/ui/login_page.dart';
import 'package:router_flutter/ui/produk_form.dart';
import 'package:router_flutter/ui/produk_detail.dart';

void main() {
  group('Modul 4 Models Test', () {
    test('Login fromJson parsing', () {
      final json = {
        'code': 200,
        'status': true,
        'data': {
          'token': 'test_token_123',
          'user': {'id': 1, 'email': 'admin@admin.com'}
        }
      };
      final login = Login.fromJson(json);
      expect(login.code, 200);
      expect(login.status, true);
      expect(login.token, 'test_token_123');
      expect(login.userID, 1);
      expect(login.userEmail, 'admin@admin.com');
    });

    test('Registrasi fromJson parsing', () {
      final json = {
        'code': 200,
        'status': true,
        'data': 'Registrasi Berhasil'
      };
      final reg = Registrasi.fromJson(json);
      expect(reg.code, 200);
      expect(reg.status, true);
      expect(reg.data, 'Registrasi Berhasil');
    });

    test('Produk fromJson parsing', () {
      final json = {
        'id': 10,
        'kode_produk': 'P01',
        'nama_produk': 'Laptop',
        'harga': 12000000
      };
      final produk = Produk.fromJson(json);
      expect(produk.id, 10);
      expect(produk.kodeProduk, 'P01');
      expect(produk.namaProduk, 'Laptop');
      expect(produk.hargaProduk, 12000000);
    });
  });

  group('Modul 4 UI Widgets Test', () {
    testWidgets('RegistrasiPage validation test', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: RegistrasiPage()));

      expect(find.text('Registrasi'), findsWidgets);

      // Trigger empty validation
      await tester.tap(find.widgetWithText(ElevatedButton, 'Registrasi'));
      await tester.pumpAndSettle();

      expect(find.text('Nama harus diisi minimal 3 karakter'), findsOneWidget);
      expect(find.text('Email harus diisi'), findsOneWidget);
      expect(find.text('Password harus diisi minimal 6 karakter'), findsOneWidget);
    });

    testWidgets('LoginPage validation test', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoginPage()));

      expect(find.text('Login'), findsWidgets);
      expect(find.text('Registrasi'), findsOneWidget);

      // Trigger empty validation
      await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
      await tester.pumpAndSettle();

      expect(find.text('Email harus diisi'), findsOneWidget);
      expect(find.text('Password harus diisi'), findsOneWidget);
    });

    testWidgets('ProdukForm tambah dan ubah test', (WidgetTester tester) async {
      // Test mode Tambah
      await tester.pumpWidget(const MaterialApp(home: ProdukForm()));
      expect(find.text('TAMBAH PRODUK'), findsOneWidget);
      expect(find.text('SIMPAN'), findsOneWidget);

      // Test mode Ubah
      final editProduk = Produk(
        id: 1,
        kodeProduk: 'A001',
        namaProduk: 'Kamera',
        hargaProduk: 5000000,
      );
      await tester.pumpWidget(MaterialApp(home: ProdukForm(produk: editProduk)));
      await tester.pumpAndSettle();
      expect(find.text('UBAH PRODUK'), findsOneWidget);
      expect(find.text('UBAH'), findsOneWidget);
      expect(find.text('A001'), findsOneWidget);
      expect(find.text('Kamera'), findsOneWidget);
      expect(find.text('5000000'), findsOneWidget);
    });

    testWidgets('ProdukDetail displays info and delete confirmation', (WidgetTester tester) async {
      final detailProduk = Produk(
        id: 2,
        kodeProduk: 'A002',
        namaProduk: 'Kulkas',
        hargaProduk: 2500000,
      );
      await tester.pumpWidget(MaterialApp(home: ProdukDetail(produk: detailProduk)));

      expect(find.text('Detail Produk'), findsOneWidget);
      expect(find.text('Kode : A002'), findsOneWidget);
      expect(find.text('Nama : Kulkas'), findsOneWidget);
      expect(find.text('Harga : Rp. 2500000'), findsOneWidget);
      expect(find.text('EDIT'), findsOneWidget);
      expect(find.text('DELETE'), findsOneWidget);

      // Tap DELETE
      await tester.tap(find.text('DELETE'));
      await tester.pumpAndSettle();

      expect(find.text('Yakin ingin menghapus data ini?'), findsOneWidget);
      expect(find.text('Ya'), findsOneWidget);
      expect(find.text('Batal'), findsOneWidget);
    });
  });
}
