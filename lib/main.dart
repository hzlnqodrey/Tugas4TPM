import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.light,
      /* ThemeMode.system to follow system theme, 
              ThemeMode.light for light theme, 
              ThemeMode.dark for dark theme
            */
      home: FutureBuilder<bool>(
        future: isLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // menampilkan loading indicator jika sedang memeriksa status sesi
          } else {
            if (snapshot.data == true) {
              return HomePage(); // jika sudah login, arahkan ke HomePage
            } else {
              return LoginPage(); // jika belum login, arahkan ke LoginPage
            }
          }
        },
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Log In',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.lightBlue,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: username,
                maxLines: 1,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Username",
                  hintText: "Masukkan Username",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: password,
                maxLines: 1,
                obscureText: true, //inputan tidak terlihat
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Masukkan Password",
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(height: 25),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                  onPressed: () => submit(
                    context,
                    username.text,
                    password.text,
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> saveSession() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('isLoggedIn', true); // sesi disimpan saat login berhasil
}

Future<bool> isLoggedIn() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isLoggedIn') ?? false; // defaultnya tidak login
}

void submit(BuildContext context, String username, String password) async {
  if ((username == '123') && (password == '123')) {
    await saveSession(); // menyimpan status sesi
    Navigator.pushReplacement(
      // menggunakan pushReplacement agar tidak bisa kembali ke halaman login
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  } else {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 5),
      content: Text("Username atau Password Salah!!!"),
      backgroundColor: Colors.red,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return;
  }
}
