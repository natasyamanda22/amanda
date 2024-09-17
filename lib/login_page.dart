import 'dart:ui';
import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login(BuildContext context) {
    // Memeriksa kredensial login
    if (usernameController.text == 'admin' && passwordController.text == 'admin00') {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage())); // Arahkan pengguna ke halaman utama jika kredensial benar
    } else {
      // Menampilkan pesan kesalahan jika kredensial salah
      print("Username atau password salah."); // Pesan di console
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text('Kesalahan'),
            content: Text('Username atau password salah.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(), // Menutup dialog saat tombol ditekan
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(color: Colors.blueGrey[900]),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(color: Colors.transparent),
          ),
          Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 400),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white.withOpacity(0.9)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('LOGIN', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)),
                  SizedBox(height: 20),
                  _buildTextField(usernameController, 'Username', Icons.person),
                  SizedBox(height: 10),
                  _buildTextField(passwordController, 'Password', Icons.lock, obscureText: true),
                  SizedBox(height: 20),
                  ElevatedButton(onPressed: () => login(context), child: Text('Login')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon, {bool obscureText = false}) {
    return Row(
      children: [
        Icon(icon, color: Colors.black),
        SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(labelText: label, border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.black)), filled: true, fillColor: Colors.white),
            obscureText: obscureText,
          ),
        ),
      ],
    );
  }
}