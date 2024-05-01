import 'package:flutter/material.dart';
import 'homeMenu.dart';
import 'bantuan.dart';
import 'stopwatch.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  Widget bodyFunction() {
    switch (_page) {
      case 0:
        return HomeMenu();
        break;
      case 1:
        return StopwatchPage();
        break;
      case 2:
        return Bantuan();
        break;
      default:
        return Container(color: Colors.white);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tugas 4 - Mobile Layout",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.lightBlue,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              exit(context); // panggil fungsi exit saat tombol logout ditekan
            },
          ),
        ],
      ),
      body: bodyFunction(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'HALAMAN UTAMA',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.watch_rounded),
            label: 'Stopwatch',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'BANTUAN',
          ),
        ],
        currentIndex: _page,
        selectedItemColor: Colors.green[800],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}
