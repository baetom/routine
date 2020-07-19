import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_routine/Models/Routine.dart';
import 'package:simple_routine/Screens/AddMyRoutineScreen.dart';
import 'package:simple_routine/Utils/Const.dart';

class MyRoutineScreen extends StatefulWidget {
  @override
  _MyRoutineScreenState createState() => _MyRoutineScreenState();
}

class _MyRoutineScreenState extends State<MyRoutineScreen> {
  List<MyRoutineUIData> _myData;

  List<MyRoutineUIData> _testData() {
    return [
      MyRoutineUIData("책일기 10장", "월,화,수", "오전 09:00", 0, 30, false),
      MyRoutineUIData("책일기 20장", "매일", "", 1, 10, false),
      MyRoutineUIData("운동 10분하기", "월", "", 2, 10, false),
      MyRoutineUIData("책일기 30장", "목", "", 3, 30, true),
      MyRoutineUIData("자전거 1시간 타기", "토", "", 4, 16, false),
      MyRoutineUIData("사랑한다 10번하기", "매일", "", 5, 10, false),
      MyRoutineUIData("휴가 내기", "일", "", 6, 99, false)
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    _myData = _testData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10),
        margin: EdgeInsets.only(left: 10, right: 10),
        color: Colors.white,
        child: ListView.builder(
            itemCount: _myData != null ? _myData.length : 0,
            itemBuilder: (context, position) {
              MyRoutineUIData item = _myData[position];
              int passedDays = item.passDays;
              return Container(
                padding: EdgeInsets.only(top: 2, bottom: 2),
                child: Card(
                  color: Const.colors[item.colorIndex],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Container(
                      margin: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(item.title, style: _titleTextStyle()),
                              Text('$passedDays Day', style: _dayTextStyle())
                            ],
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          _scheduleDate(item.subTitle, item.routineTime)
                        ],
                      )),
                ),
              );
            }));
  }

  Widget _scheduleDate(String schedule, String routinetime) {
    return Row(
      children: [
        Text(schedule, style: _subTextStyle()),
        SizedBox(
          width: 10,
        ),
        if (routinetime.length > 0)
          Icon(
            Icons.notifications_none,
            color: Colors.red[300],
            size: 16,
          ),
        if (routinetime.length > 0)
          Text(
            '오전 09:00',
            style: _subTextStyle(),
          ),
      ],
    );
  }

  TextStyle _subTextStyle() {
    return TextStyle(fontSize: 12);
  }

  TextStyle _titleTextStyle() {
    return TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 18,
        color: Colors.black,
        // decoration: TextDecoration.lineThrough,
        // decorationColor: Colors.red,
        decorationThickness: 2);
  }

  TextStyle _dayTextStyle() {
    return TextStyle(
        fontWeight: FontWeight.w300, fontSize: 18, color: Colors.black87);
  }

  void _addRoutine(BuildContext context) {
    Navigator.of(context).push(CupertinoPageRoute(
        fullscreenDialog: true, builder: (context) => AddMyRoutineScreen()));
  }

  void _deleteRountine() {}

  void _modifyRoutine() {}
}
