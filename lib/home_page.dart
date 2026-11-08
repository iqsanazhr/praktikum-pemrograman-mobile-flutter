import 'package:flutter/material.dart';
import 'package:router_flutter/sidemenu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: prefer_typing_uninitialized_variables
  var namauser;

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  void _loadUsername() async {
    // Inisialisasi share preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Ambil Username yang sudah tersimpan
    String? storedUser = prefs.getString('username');
    if (mounted && namauser != storedUser) {
      setState(() {
        namauser = storedUser;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Text('Ini adalah halaman User ${namauser ?? ""}'),
      ),
      drawer: const Sidemenu(),
    );
  }
}
