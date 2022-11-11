import 'package:flutter/material.dart';

class BPage extends StatelessWidget {
  const BPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ImageBrowse(title: '動漫新作'),
    );
  }
}

class ImageBrowse extends StatefulWidget {
  const ImageBrowse({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<ImageBrowse> createState() => _ImageBrowseState();
}

class _ImageBrowseState extends State<ImageBrowse> {
  var images=['assets/image/5.jpg','assets/image/6.jpg','assets/image/7.jpg','assets/image/8.jpg'];
  int imageindex=1;
  String defult_image="assets/image/5.jpg";

  void previous (){
    if(imageindex<=0){imageindex=4;}
    defult_image = images[imageindex-1];
    imageindex--;
  }
  void next (){
    if(imageindex>=3){imageindex=-1;}
    defult_image = images[imageindex+1];
    imageindex++;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap:(){
                const snackBar = SnackBar(
                  content: Text('點選了圖片',
                    textScaleFactor: 1.2,
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: SizedBox(
                height: 400,
                width: 400,
                child: Image.asset(defult_image),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: (){
                      setState(() {
                        previous();
                      });
                    },
                    child: const Text("上一頁",
                      textScaleFactor:1.5,)
                ),
                const SizedBox(width: 100,),
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      next();
                    });
                  },
                  child: const Text("下一頁",
                    textScaleFactor:1.5,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

