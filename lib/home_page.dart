import 'package:flutter/material.dart';
import 'penjumlahan_pengurangan.dart'; // Import baru
import 'ganjil_genap.dart'; // Import baru
import 'data_mahasiswa_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueGrey[900],
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Selamat Datang!',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 20),
                Text(
                  'Silahkan Memilih Menu Utama:',
                  style: TextStyle(fontSize: 18, color: Colors.white54),
                ),
                SizedBox(height: 40),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      _buildMenuItem(context, 'Data Mahasiswa', DataMahasiswaPage()),
                      _buildMenuItem(context, 'Penjumlahan dan Pengurangan', PenjumlahanPenguranganPage()), // Update
                      _buildMenuItem(context, 'Bilangan Ganjil/Genap', GanjilGenapPage()), // Update
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, Widget page) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => page)),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 2)),
          ],
        ),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          trailing: Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}