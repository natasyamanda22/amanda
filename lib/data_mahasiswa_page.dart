import 'package:flutter/material.dart';

class DataMahasiswaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Data Mahasiswa')),
      body: DataTable(
        columns: [
          DataColumn(label: Text('NIM')),
          DataColumn(label: Text('Nama')),
          DataColumn(label: Text('Kelas')),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text('124220026')),
            DataCell(Text('Intan Merlinda')),
            DataCell(Text('Pemrograman Aplikasi Mobile SI - C')),
          ]),
          DataRow(cells: [
            DataCell(Text('124220030')),
            DataCell(Text('Amanda Tri Ayu Natasya')),
            DataCell(Text('Pemrograman Aplikasi Mobile SI - C')),
          ]),
        ],
      ),
    );
  }
}