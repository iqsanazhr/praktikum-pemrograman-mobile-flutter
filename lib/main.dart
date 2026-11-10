import 'package:flutter/material.dart';
import 'ui/produk_page.dart';
import 'ui/login_page.dart';
import 'ui/registrasi_page.dart';
import 'ui/produk_form.dart';
import 'ui/produk_detail.dart';
import 'model/produk.dart';
import 'hello_world.dart';
import 'column_widget.dart';
import 'row_widget.dart';
import 'login_page.dart' as modul3;
import 'home_page.dart' as modul3_home;
import 'about_page.dart' as modul3_about;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Kita',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/hello':
            return MaterialPageRoute(builder: (_) => const HelloWorld());
          case '/column':
            return MaterialPageRoute(builder: (_) => const ColumnWidget());
          case '/row':
            return MaterialPageRoute(builder: (_) => const RowWidget());
          case '/login_modul3':
            return MaterialPageRoute(builder: (_) => const modul3.LoginPage());
          case '/home_modul3':
            return MaterialPageRoute(builder: (_) => const modul3_home.HomePage());
          case '/about_modul3':
            return MaterialPageRoute(builder: (_) => const modul3_about.AboutPage());
          case '/login':
            return MaterialPageRoute(builder: (_) => const LoginPage());
          case '/registrasi':
            return MaterialPageRoute(builder: (_) => const RegistrasiPage());
          case '/produk_form':
            return MaterialPageRoute(builder: (_) => const ProdukForm());
          case '/produk_detail':
            return MaterialPageRoute(
              builder: (_) => ProdukDetail(
                produk: Produk(
                  id: 1,
                  kodeProduk: 'A001',
                  namaProduk: 'Kamera',
                  hargaProduk: 5000000,
                ),
              ),
            );
          case '/produk_edit':
            return MaterialPageRoute(
              builder: (_) => ProdukForm(
                produk: Produk(
                  id: 1,
                  kodeProduk: 'A001',
                  namaProduk: 'Kamera',
                  hargaProduk: 5000000,
                ),
              ),
            );
          default:
            return MaterialPageRoute(builder: (_) => const ProdukPage());
        }
      },
    );
  }
}
