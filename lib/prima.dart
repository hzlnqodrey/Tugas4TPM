import 'package:flutter/material.dart';

class Prima extends StatefulWidget {
  const Prima({Key? key}) : super(key: key);

  @override
  _PrimaState createState() => _PrimaState();
}

class _PrimaState extends State<Prima> {
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();
  List<int> primeNumbers = [];

  void generatePrimes(int start, int end) {
    setState(() {
      primeNumbers.clear();
      for (int i = start; i <= end; i++) {
        if (_isPrime(i)) {
          primeNumbers.add(i);
        }
      }
    });
  }

  bool _isPrime(int n) {
    if (n <= 1) return false;
    for (int i = 2; i * i <= n; i++) {
      if (n % i == 0) return false;
    }
    return true;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Menampilkan Bilangan Prima",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: startController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Mulai Dari (Start)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: endController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Sampai Dengan (End)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                try {
                  int start = int.parse(startController.text);
                  int end = int.parse(endController.text);

                  if (start < 0 || end < 0) {
                    throw Exception('Bilangan Prima harus positif');
                  }

                  if (start >= end) {
                    throw Exception(
                        'Start seharusnya lebih kecil daripada end.');
                  }

                  if (end - start > 100000) {
                    throw Exception('Angka terlalu besar. Mohon diperkecil');
                  }

                  generatePrimes(start, end);
                } catch (e) {
                  _showErrorDialog('Error', e.toString());
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  'Tampilkan Bilangan Prima',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: primeNumbers.isEmpty
                    ? Center(
                        child:
                            Text('Tidak ada bilangan prima untuk ditampilkan'))
                    : ListView.builder(
                        itemCount: primeNumbers.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              'Bil. Prima ${index + 1}: ${primeNumbers[index]}',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
