import 'package:flutter/material.dart';
import 'package:tugas4/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Bantuan extends StatelessWidget {
  const Bantuan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Bantuan Cara Menggunakan Aplikasi Ini",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Login",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "Login dilakukan dengan menggunakan username 123 dan password 123",
              overflow: TextOverflow.clip,
            ),
            Text(
              "Gunakan Bottom Navigation Bar di bawah untuk berpindah antara Halaman Utama, Stopwatch dengan Bantuan",
              overflow: TextOverflow.clip,
            ),
            SizedBox(height: 10),
            Text(
              "Halaman Utama",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text("Pada Halaman Utama Terdapat 4 Menu utama yaitu : "),
            Text("1. Daftar Anggota "),
            Text("Untuk melihat anggota kelompok pembuat aplikasi "),
            Text("2. Daftar Rekomendasi Film"),
            Text(
              "Halaman ini digunakan untuk melihat film-film yang direkomendasikan pembuat, terdapat dua tombol yaitu untuk menambahkan ke Favorit dan tombol untuk membuka link film",
              overflow: TextOverflow.clip,
            ),
            Text("3. Favorite"),
            Text(
              "Halaman ini digunakan untuk melihat film-film yang telah dimasukkan ke daftar favorite dan terdapat tombol untuk membuka link film",
              overflow: TextOverflow.clip,
            ),
            Text("4. Bilangan Prima"),
            Text(
              "Aplikasi ini adalah alat sederhana yang dirancang untuk menampilkan bilangan prima. Dengan aplikasi ini, pengguna dapat memasukkan rentang bilangan yang diinginkan, dan kemudian aplikasi akan menampilkan semua bilangan prima yang berada dalam rentang tersebut. Aplikasi ini dapat membantu pengguna untuk dengan mudah mengidentifikasi dan menampilkan bilangan prima tanpa perlu melakukan perhitungan secara manual.",
              overflow: TextOverflow.clip,
            ),
            Text("5. Kalkulator Segitiga Sederhana"),
            Text(
              "Aplikasi ini adalah kalkulator segitiga yang sederhana namun efektif, dirancang khusus untuk menghitung luas dan keliling segitiga. Pengguna dapat memasukkan panjang sisi-sisi segitiga atau panjang dua sisi dan sudut di antaranya, dan aplikasi akan secara otomatis menghitung luas dan keliling segitiga tersebut",
              overflow: TextOverflow.clip,
            ),
            SizedBox(height: 10),
            Text(
              "Sub Menu Stopwatch",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "Untuk menghitung waktu, terdapat tombol start untuk memulai jalannya waktu, tombol stop untuk menghentikan eaktu dan tombol reset untuk mereset waktu",
              overflow: TextOverflow.clip,
            ),
            SizedBox(height: 10),
            Text(
              "Bantuan",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
                "Bantuan berisikan cara-cara untuk menggunakan aplikasi dan tombol LogOut"),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  exit(context);
                },
                child: Text("Log Out"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void exit(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('isLoggedIn'); // menghapus status sesi saat logout

  AlertDialog alert = AlertDialog(
    title: Text("Log Out"),
    content: Container(
      child: Text("Apakah Anda Yakin Ingin Log Out ?"),
    ),
    actions: [
      TextButton(
        child: Text('Yes'),
        onPressed: () {
          Navigator.pushReplacement(
            // gunakan pushReplacement agar tidak bisa kembali ke halaman logout
            context,
            MaterialPageRoute(builder: (context) => MyApp()),
          );
        },
      ),
      TextButton(
        child: Text('No'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ],
  );
  showDialog(context: context, builder: (context) => alert);
}
