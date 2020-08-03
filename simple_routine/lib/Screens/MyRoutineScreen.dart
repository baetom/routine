import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_routine/Models/MyRoutineUIData.dart';
import 'package:simple_routine/Service/DataManager.dart';
import 'package:simple_routine/Utils/Const.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MyRoutineScreen extends StatefulWidget {
  @override
  _MyRoutineScreenState createState() => _MyRoutineScreenState();
}

class _MyRoutineScreenState extends State<MyRoutineScreen> {
  @override
  void initState() {
    // TODO: implement initState
    // _myData = _testData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<MyRoutineUIData> myData = context.watch<DataManager>().myRoutines;
    return Container(
        padding: EdgeInsets.only(top: 10),
        margin: EdgeInsets.only(left: 10, right: 10),
        color: Colors.white,
        child: ListView.builder(
            itemCount: myData != null ? myData.length : 0,
            itemBuilder: (context, position) {
              MyRoutineUIData item = myData[position];
              return GestureDetector(
                onTap: () => _onAlertButtonsPressed(context, position),
                child: Container(
                  padding: EdgeInsets.only(top: 2, bottom: 2),
                  child: Card(
                    elevation: 0,
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
                                Text(item.title,
                                    style: _titleTextStyle(item.isDone)),
                                Text('${item.passDays} Day',
                                    style: _dayTextStyle(item.isDone))
                              ],
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            _scheduleDate(
                                item.subTitle, item.routineTime, item.isDone)
                          ],
                        )),
                  ),
                ),
              );
            }));
  }

  Widget _scheduleDate(String schedule, String routinetime, bool isDone) {
    return Row(
      children: [
        if (schedule.length > 0) Text(schedule, style: _subTextStyle(isDone)),
        if (schedule.length > 0)
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
            routinetime,
            style: _subTextStyle(isDone),
          ),
      ],
    );
  }

  TextStyle _subTextStyle(bool isDone) {
    return TextStyle(
        fontSize: 12,
        decoration: isDone ? TextDecoration.lineThrough : null,
        // decorationColor: isDone ? Colors.red : null,
        decorationThickness: 1);
  }

  TextStyle _titleTextStyle(bool isDone) {
    return TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 18,
        color: Colors.black,
        decoration: isDone ? TextDecoration.lineThrough : null,
        // decorationColor: isDone ? Colors.red : null,
        decorationThickness: 1);
  }

  TextStyle _dayTextStyle(bool isDone) {
    return TextStyle(
        decoration: isDone ? TextDecoration.lineThrough : null,
        // decorationColor: isDone ? Colors.red : null,
        decorationThickness: 1,
        fontWeight: FontWeight.w300,
        fontSize: 18,
        color: Colors.black87);
  }

  _onAlertButtonsPressed(BuildContext context, int index) {
    DataManager manager = context.read<DataManager>();
    Alert(
      context: context,
      type: AlertType.none,
      title: "안내",
      desc: "완료하시겠습니까?",
      buttons: [
        DialogButton(
          child: Text(
            "예",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
            manager.myRoutineDone(index);
          },
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          child: Text(
            "아니요",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0)
          ]),
        )
      ],
    ).show();
  }

  void _deleteRountine() {}

  void _modifyRoutine() {}
}
