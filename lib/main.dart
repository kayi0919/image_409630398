import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = '409630398_image';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatelessWidget(),
      ),
    );
  }
}

/// stateless widget that the main application instantiates
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const SizedBox(height: 30),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    final snackBar = SnackBar(
                      content: const Text('上一頁'),
                      action: SnackBarAction(
                        label: '神魔之塔',
                        onPressed: () => Fluttertoast.showToast(
                            msg:'你按下上一頁',
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 30.0),
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: const Text('上一頁'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final snackBar = SnackBar(
                      content: const Text('下一頁'),
                      action: SnackBarAction(
                        label: '神魔之塔',
                        onPressed: () => Fluttertoast.showToast(
                            msg:'你按下下一頁',
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 30.0),
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: const Text('下一頁'),
                ),
              ],
            )
          ],
        )
    );
  }
}