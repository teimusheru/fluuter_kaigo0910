import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
/*
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'CalendarWeek Example',
    home: HomePage(),
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CalendarWeekController _controller = CalendarWeekController();

  @override
  Widget build(BuildContext context) => Scaffold(
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        _controller.jumpToDate(DateTime.now());
        setState(() {});
      },
      child: Icon(Icons.today),
    ),
    appBar: AppBar(
      elevation: 0,
      backgroundColor: Colors.blue,
      title: Text('CalendarWeek'),
    ),
    body: Column(children: [
      Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 1)
          ]),
          child: CalendarWeek(
            controller: _controller,
            height: 100,
            showMonth: true,
            minDate: DateTime.now().add(
              Duration(days: -365),
            ),
            maxDate: DateTime.now().add(
              Duration(days: 365),
            ),
            onDatePressed: (DateTime datetime) {
              // Do something
              setState(() {});
            },
            onDateLongPressed: (DateTime datetime) {
              // Do something
            },
            onWeekChanged: () {
              // Do something
            },
            monthViewBuilder: (DateTime time) => Align(
              alignment: FractionalOffset.center,
              child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    DateFormat.yMMMM().format(time),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w600),
                  )),
            ),

          )),
      Expanded(
        child: Center(
          child: Column(
            children: [
            SizedBox(
            height: 15,
          ),
              //住所ボタン
              OutlinedButton(
                child: Text("kenmei1", textAlign: TextAlign.left),
                style: OutlinedButton.styleFrom(
                  primary: Colors.black,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),

                  minimumSize: Size(350.0 ,50.0),
                  side: const BorderSide(color: Colors.amber),
                ),
                onPressed: () async {
                  final newValue =
                  await Navigator.of(context)
                      .push(
                    MaterialPageRoute(
                      builder: (context) => MyApp(),
                    ),
                  );

                  //setState(()  => this.value = newValue);

                },

              ),

          Text(
            '${_controller.selectedDate.day}/${_controller.selectedDate.month}/${_controller.selectedDate.year}',
            style: TextStyle(fontSize: 30),
          ),

          ],
          ),



        ),

      )
    ]),
  );
}   */


