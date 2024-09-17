import 'dart:ui';
import 'package:flutter/material.dart';

class PenjumlahanPenguranganPage extends StatelessWidget {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();

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
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Penjumlahan dan Pengurangan',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  _buildTextField(num1Controller, 'Masukkan Angka Pertama'),
                  SizedBox(height: 20),
                  _buildTextField(num2Controller, 'Masukkan Angka Kedua'),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Mengambil input dan memeriksa validitas
                      String? num1Text = num1Controller.text;
                      String? num2Text = num2Controller.text;
                      if (_isNumeric(num1Text) && _isNumeric(num2Text)) {
                        int num1 = int.parse(num1Text);
                        int num2 = int.parse(num2Text);
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              title: Text('Hasil'),
                              content: Text(
                                'Penjumlahan: ${num1 + num2}\nPengurangan: ${num1 - num2}',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        // Menampilkan pesan kesalahan jika input tidak valid
                        _showErrorDialog(context);
                      }
                    },
                    child: Text('Hitung'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _isNumeric(String? str) {
    // Fungsi untuk memeriksa apakah string dapat diubah menjadi angka
    if (str == null) return false;
    return double.tryParse(str) != null;
  }

  void _showErrorDialog(BuildContext context) {
    // Menampilkan dialog kesalahan
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text('Kesalahan'),
          content: Text('Silakan masukkan angka yang valid.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(labelText: label, border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none)),
        keyboardType: TextInputType.number,
      ),
    );
  }
}