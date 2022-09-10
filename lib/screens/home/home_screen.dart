import 'dart:math';

import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/models/grocery_item.dart';
import 'package:grocery_app/screens/product_details/product_details_screen.dart';
import 'package:grocery_app/styles/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/widgets/grocery_item_card_widget.dart';
import 'package:grocery_app/widgets/search_bar_widget.dart';

import '1.dart';
import '2scroll.dart';
import 'grocery_featured_Item_widget.dart';
import 'home_banner_widget.dart';
import 'map.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key key}) : super(key: key);

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<HomeScreen> {

  CalendarAgendaController _calendarAgendaControllerAppBar =
  CalendarAgendaController();
  CalendarAgendaController _calendarAgendaControllerNotAppBar =
  CalendarAgendaController();

   DateTime _selectedDateAppBBar;
   DateTime _selectedDateNotAppBBar;

  Random random = new Random();

  @override
  void initState() {
    super.initState();
    _selectedDateAppBBar = DateTime.now();
    _selectedDateNotAppBBar = DateTime.now();
  }

  //初期値
  //住所変数
  String  kenmei1 = 'お住まいの地域';

  //画面遷移
  int _currentIndex=0;
  //final List _screens=[HomePage(),AddToCart(price: 0.0,name: '',),Login(),];

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalendarAgenda(
        controller: _calendarAgendaControllerAppBar,
        appbar: true,
        selectedDayPosition: SelectedDayPosition.left,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {_calendarAgendaControllerAppBar.goToDay(DateTime.now());},
        ),
        weekDay: WeekDay.long,
        fullCalendarScroll: FullCalendarScroll.horizontal,
        fullCalendarDay: WeekDay.long,
        selectedDateColor: Colors.green.shade900,
        locale: 'ja_JP',
        initialDate: DateTime.now(),
        calendarEventColor: Colors.green,
        firstDate: DateTime.now().subtract(Duration(days: 0)),
        lastDate: DateTime.now().add(Duration(days: 180)),
        events: List.generate(
            100,
                (index) => DateTime.now()
                .subtract(Duration(days: index * random.nextInt(5)))),
        onDateSelected: (date) {
          setState(() {
            _selectedDateAppBBar = date;
          });
        },
        calendarLogo: Image.network(
          'https://www.kindpng.com/picc/m/355-3557482_flutter-logo-png-transparent-png.png',
          scale: 5.0,
        ),
        selectedDayLogo: NetworkImage(
          'https://www.kindpng.com/picc/m/355-3557482_flutter-logo-png-transparent-png.png',
          scale: 15.0,
        ),
      ),


      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),






                  //住所ボタン
                  OutlinedButton(
                    child: Text(kenmei1, textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                    ,
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
                          builder: (context) => map1(),
                        ),
                      );

                      //setState(()  => this.value = newValue);

                    },

                  ),



                  SizedBox(
                    height: 15,
                  ),

                  //料理
                  Text("★あなた様が必要とされています！！"),
                  getHorizontalItemSlider(exclusiveOffers),
                  SizedBox(
                    height: 15,
                  ),
                  getHorizontalItemSlider(groceries1),
                  SizedBox(
                    height: 15,
                  ),
                  getHorizontalItemSlider(bestSelling),
                  SizedBox(
                    height: 15,
                  ),
                  getHorizontalItemSlider(groceries),
                  SizedBox(
                    height: 15,
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  getHorizontalItemSlider(groceries1),
                  SizedBox(
                    height: 15,
                  ),
                  getHorizontalItemSlider(groceries),
                  SizedBox(
                    height: 15,
                  ),





                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget padded(Widget widget) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: widget,
    );
  }

  Widget getHorizontalItemSlider(List<GroceryItem> items) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 250,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              onItemClicked(context, items[index]);
            },
            child: GroceryItemCardWidget(
              item: items[index],
              heroSuffix: "home_screen",
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 20,
          );
        },
      ),
    );
  }

  void onItemClicked(BuildContext context, GroceryItem groceryItem) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ProductDetailsScreen(
                groceryItem,
                heroSuffix: "home_screen",
              )),
    );
  }

 /* Widget subTitle(String text) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Text(
          "See All",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor),
        ),
      ],
    );
  }*/

  Widget locationWidget() {
    String locationIconPath = "assets/icons/location_icon.svg";
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          locationIconPath,
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          "Khartoum,Sudan",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
