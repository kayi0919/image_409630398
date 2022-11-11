import 'package:flutter/material.dart';
import 'main.dart';

class DPage extends StatefulWidget {

  @override
  _DPage createState() => _DPage();
}



class _DPage extends State<DPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text("網路圖像"),
          ),
          body: const BackgroundImgDemo()),
    );
  }
}
class MyWidgetsBinding extends WidgetsFlutterBinding {
  @override
  ImageCache createImageCache() => MyImageCache();
}

class MyImageCache extends ImageCache{

}

class BackgroundImgDemo extends StatefulWidget {
  const BackgroundImgDemo({Key? key}) : super(key: key);

  @override
  _BackgroundImgDemoState createState() => _BackgroundImgDemoState();
}

class _BackgroundImgDemoState extends State<BackgroundImgDemo> {
  String imgUrl1 = "https://unsplash.it/1440/3040?random";

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              "$imgUrl1$count",
            ),
          ),
        ),
        child: Container(
            margin: const EdgeInsets.only(top: 600.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const SizedBox(height: 30),
                  const SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.blue),
                            foregroundColor: MaterialStateProperty.all(
                                Colors.yellow),
                          ),
                          child: const Text("上一頁"),
                          onPressed: () async {
                            setState(() {
                              count++;
                            });
                          },
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.blue),
                            foregroundColor: MaterialStateProperty.all(
                                Colors.yellow),
                          ),
                          child: const Text("回首頁"),
                          onPressed: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => HomePage())
                            );
                          },
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.yellow),
                            foregroundColor: MaterialStateProperty.all(
                                Colors.black),
                          ),
                          child: const Text("下一頁"),
                          onPressed: () async {
                            setState(() {
                              count--;
                            });
                          },
                        )
                      ]
                  ),
                ]
            )
        )
    );

  }
}
