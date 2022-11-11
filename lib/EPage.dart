import 'package:flutter/material.dart';
import 'main.dart';
import 'DPage.dart';
import 'CPage.dart';
import 'BPage.dart';



class EPage extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<EPage> {
  //目前選擇頁索引值
  int _currentIndex = 0; //預設值

  final pages = [HomePage(), const BPage(), CPage(), DPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer UI'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            //設定用户名稱
            const UserAccountsDrawerHeader(
              accountName: Text("Kayi",),
              //設定Email
              accountEmail: Text("Kayi@gmail.com",),
              //設定大頭照
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/1.jpg"),
              ),
            ),
            //選單
            ListTile(
              leading: const CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
              title: const Text('動漫新作'),
              onTap: () {
                _onItemClick(0);
              },
            ),
            ListTile(
              leading: const CircleAvatar(child: Icon(Icons.code)),
              title: const Text('遊戲畫面'),
              onTap: () {
                _onItemClick(1);
              },
            ),
            ListTile(
              leading: const CircleAvatar(child: Icon(Icons.computer)),
              title: const Text('網路圖像'),
              onTap: () {
                _onItemClick(2);
              },
            ),
          ],
        ),
      ),
      body: pages[_currentIndex],
    );
  }

  void _onItemClick(int index) {
    setState(() {
      _currentIndex = index;
      Navigator.of(context).pop();
    });
  }
}