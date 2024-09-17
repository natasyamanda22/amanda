import 'package:flutter/material.dart';

class GanjilGenapPage extends StatelessWidget {
  final TextEditingController numberController = TextEditingController();

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
                  'Bilangan Ganjil/Genap',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 20),
                _buildTextField(numberController, 'Masukkan Angka'),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    int? number = int.tryParse(numberController.text);
                    if (number != null) {
                      String result = (number % 2 == 0) ? 'Genap' : 'Ganjil';
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            title: Text('Hasil'),
                            content: Text('$number adalah bilangan $result'),
                            actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: Text('OK'))],
                          );
                        },
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            title: Text('Kesalahan'),
                            content: Text('Silakan masukkan angka yang valid.'),
                            actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: Text('OK'))],
                          );
                        },
                      );
                    }
                  },
                  child: Text('Cek'),
                ),
              ],
            ),
          ),
        ),
      ),
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