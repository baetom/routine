import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_routine/Models/Routine.dart';
import 'package:simple_routine/Screens/AddMyRoutineScreen.dart';

class MyRoutineScreen extends StatelessWidget {
  List<MyRoutine> myRoutines = List();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10),
        margin: EdgeInsets.only(left: 10, right: 10),
        color: Colors.white,
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, position) {
              return Container(
                padding: EdgeInsets.only(top: 2, bottom: 2),
                child: Card(
                  color: Colors.deepPurple[100],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Container(
                      margin: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('책읽기 10장', style: _titleTextStyle()),
                              Text('32 Day', style: _dayTextStyle())
                            ],
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          _scheduleDate()
                        ],
                      )),
                ),
              );
            }));
  }

  Widget _scheduleDate() {
    return Row(
      children: [
        Text('월', style: _subTextStyle()),
        Text(',', style: _subTextStyle()),
        Text('화', style: _subTextStyle()),
        Text(',', style: _subTextStyle()),
        Text('수', style: _subTextStyle()),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.notifications_none,
          color: Colors.red[300],
          size: 16,
        ),
        Text(
          '오전 09:00',
          style: _subTextStyle(),
        ),
      ],
    );
  }

  TextStyle _subTextStyle() {
    return TextStyle(fontSize: 13);
  }

  TextStyle _titleTextStyle() {
    return TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18,
        color: Colors.black,
        decoration: TextDecoration.lineThrough,
        decorationColor: Colors.red,
        decorationThickness: 2);
  }

  TextStyle _dayTextStyle() {
    return TextStyle(
        fontWeight: FontWeight.w400, fontSize: 18, color: Colors.black87);
  }

  void _addRoutine(BuildContext context) {
    Navigator.of(context).push(CupertinoPageRoute(
        fullscreenDialog: true, builder: (context) => AddMyRoutineScreen()));
  }

  void _deleteRountine() {}

  void _modifyRoutine() {}
}
