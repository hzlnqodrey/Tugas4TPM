import 'package:flutter/material.dart';
import 'dart:math';

class SegitigaApp extends StatefulWidget {
  @override
  _SegitigaState createState() => _SegitigaState();
}

class _SegitigaState extends State<SegitigaApp> {
  final TextEditingController alasController = TextEditingController();
  final TextEditingController tinggiController = TextEditingController();
  double? luas;
  double? keliling;

  void hitungSegitiga() {
    try {
      double alas = double.parse(alasController.text);
      double tinggi = double.parse(tinggiController.text);

      if (alas <= 0 || tinggi <= 0) {
        throw Exception('Alas dan tinggi harus lebih dari 0.');
      }

      double sisiMiring = sqrt(alas * alas + tinggi * tinggi);
      double kelilingSegitiga = alas + tinggi + sisiMiring;

      setState(() {
        luas = 0.5 * alas * tinggi;
        keliling = kelilingSegitiga;
      });

      _showResultDialog();
    } catch (e) {
      _showErrorDialog('Error', e.toString());
    }
  }

  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hasil Perhitungan'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Luas Segitiga: $luas'),
              SizedBox(height: 8.0),
              Text('Keliling Segitiga: $keliling'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator Segitiga'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: alasController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Alas',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: tinggiController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Tinggi',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                hitungSegitiga();
              },
              child: Text('Hitung'),
            ),
          ],
        ),
      ),
    );
  }
}
