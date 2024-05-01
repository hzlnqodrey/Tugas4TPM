import 'package:flutter/material.dart';

class DaftarAnggota extends StatelessWidget {
  const DaftarAnggota({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Anggota'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(30),
        alignment: Alignment.center,
        child: Column(
          children: [
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.3,
                    height: MediaQuery.of(context).size.height / 2,
                    child: Image.network(
                      "https://media.licdn.com/dms/image/D5603AQEweEBTBEMLEg/profile-displayphoto-shrink_200_200/0/1685436195204?e=2147483647&v=beta&t=cV_YAOWJkOBi7EBBz-7GYQRKdBWY4VV7qc5enX58PLk",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 80),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Center(
                        child: Text(
                          'Hazlan Muhammad Qodri',
                          style: TextStyle(fontSize: 16),
                          maxLines: 1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Center(
                        child: Text(
                          '123190080',
                          style: TextStyle(fontSize: 16),
                          maxLines: 1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
