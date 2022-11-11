import 'package:flutter/material.dart';


class EPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('模擬考時間表'),
          ),
          body: HomePage(),
        ));
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Table(
        columnWidths: const <int, TableColumnWidth>{
          //指定索引及固定列宽
          0: FixedColumnWidth(80.0),
          1: FixedColumnWidth(150.0),
          2: FixedColumnWidth(100.0),
        },
        //設定表格樣式
        border: TableBorder.all(
            color: Colors.black87, width: 2.0, style: BorderStyle.solid),
        children: const <TableRow>[
          TableRow(
            children: <Widget>[
              Text('考試名稱'),
              Text('時間'),
              Text('範圍'),
            ],
          ),
          TableRow(
            children: <Widget>[
              Text('國文'),
              Text('1/5  10:00~11:30'),
              Text('高一全'),
            ],
          ),
          TableRow(
            children: <Widget>[
              Text('作文'),
              Text('1/5  13:00~14:30'),
              Text('無'),
            ],
          ),
          TableRow(
            children: <Widget>[
              Text('自然'),
              Text('1/5  15:30~17:00'),
              Text('高一全'),
            ],
          ),
          TableRow(
            children: <Widget>[
              Text('數學'),
              Text('1/6  10:00~11:30'),
              Text('高一全'),
            ],
          ),
          TableRow(
            children: <Widget>[
              Text('英文'),
              Text('1/6  13:00~14:30'),
              Text('無'),
            ],
          ),
          TableRow(
            children: <Widget>[
              Text('社會'),
              Text('1/6  15:30~17:00'),
              Text('高一全'),
            ],
          ),
        ],
      ),
    );
  }
}