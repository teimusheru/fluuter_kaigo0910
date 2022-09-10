import 'package:flutter/material.dart';

import 'home_screen.dart';



void main() => runApp(map1());

class map1 extends StatefulWidget {
  @override
  _ListViewAppState createState() => _ListViewAppState();
}

class _ListViewAppState extends State<map1> {

  final List<String> list = <String>['大阪府','和歌山県'];
  final List<int> colorCodes = <int>[600, 500, 100];
  @override
  Widget build(BuildContext context) {
    //entries.sort();  //並びかえ

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("お住いの地域"),
        ),
          body: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return _messageItem(list[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return separatorItem();
            },
            itemCount: list.length,
          )
      )
    );
  }
  Widget separatorItem() {
    return Container(
      height: 15,
      color: Colors.greenAccent[100],
    );
  }

  Widget _messageItem(String title) {
    return Container(
      decoration: new BoxDecoration(
          border: new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
      ),
      child:ListTile(
        title: Text(
          title,
          style: TextStyle(
              color:Colors.black,
              fontSize: 18.0
          ),
        ),
        onTap:  () async {
          final newValue =
          await Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );

          //setState(()  => this.value = newValue);

        },// タップ
        /*onLongPress: () {
          print("onLongTap called.");
        },*/ // 長押し
      ),
    );
  }
}
