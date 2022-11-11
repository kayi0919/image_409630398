import 'package:flutter/material.dart';
import 'BPage.dart';
import 'CPage.dart';
import 'DPage.dart';
import 'EPage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('首頁'),
          backgroundColor: Colors.green,
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        TextButton(
          child: const Icon(Icons.videogame_asset ,size:100),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const BPage())
            );
          },
        ),
        ElevatedButton(
          child: const Icon(Icons.menu_book ,size:100),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CPage())
            );
          },
        ),
        OutlinedButton(
          child: const Icon(Icons.image ,size:100),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => DPage())
            );
          },
        ),
        TextButton(
          child: const Icon(Icons.book ,size:100),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => EPage())
            );
          },
        ),
      ],

    );

  }
}