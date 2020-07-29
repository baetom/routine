import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_routine/Models/Routine.dart';
import 'package:simple_routine/Service/DataManager.dart';
import 'package:simple_routine/Utils/Const.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:simple_routine/Utils/Utils.dart';

class AddMyRoutineScreen extends StatefulWidget {
  @override
  _AddMyRoutineScreenState createState() => _AddMyRoutineScreenState();
}

class _AddMyRoutineScreenState extends State<AddMyRoutineScreen> {
  bool _enableTime = false; //시간 설정여부
  bool _enableNotification = false; //알림 설정 여부

  final _routineTitleTextController = TextEditingController();
  final _routineTimeTextController = TextEditingController();
  double _pickerItemSize = 45;
  Set<int> _dayofweekValue = Set();
  int _selectedColorIndex = 0;

  @override
  Widget build(BuildContext context) {
    _pickerItemSize = MediaQuery.of(context).size.width * 0.105;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.black,
          ),
          onPressed: () {
            _closeScreen(context);
          },
        ),
        actions: [
          FlatButton(
            textColor: Colors.black,
            onPressed: () {
              _saveRoutine(context);
            },
            child: Text(
              "저장",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          )
        ],
      ),
      body: GestureDetector(
        child: ListView(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(left: 24, right: 24),
                child: Column(
                  children: [
                    TextField(
                      controller: _routineTitleTextController,
                      decoration: InputDecoration(
                          hintText: "5분 독서하기",
                          hintStyle:
                              TextStyle(fontSize: 20, color: Colors.black38),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black38, width: 2)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2))),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                '반복',
                                style: _sectionStyle(),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          _dayofweekWidget()
                        ],
                      ),
                    ),
                    _timeWidget(),
                    _notificationWidget(),
                    _colorPickerWidget()
                  ],
                ))
          ],
        ),
        onTap: () {
          _hideKeyboard(context);
        },
      ),
      backgroundColor: Colors.white,
    );
  }

  void _closeScreen(BuildContext context) {
    Navigator.of(context).pop(context);
  }

  void _saveRoutine(BuildContext context) {
    MyRoutineData routine = MyRoutineData();
    //반복여부..
    routine.isRepeat = (_dayofweekValue.length > 0);
    // 알림여부
    routine.isNotification = _enableNotification;
    // 타이틀
    routine.title = _routineTitleTextController.text;
    // 서브타이틀
    routine.subTitle = "";

    // 루틴 시간
    routine.routineTime = _routineTimeTextController.text;

    // 선택된 요일들
    routine.weekOfDay = _dayofweekValue.toList();

    // 루틴 시작
    routine.startDateTime = DateTime.now();

    // 반복이 있다면 null, 없으면 종료일 지정..
    routine.endDateTime =
        Utils.calcRoutinEndDateTime(routine.isRepeat, routine.weekOfDay);

    // 색상
    routine.colorIndex = _selectedColorIndex;

    context.read<DataManager>().addMyRoutine(routine);

    _closeScreen(context);
  }

  void _hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  TextStyle _sectionStyle() {
    return TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
  }

  Widget _dayofweekWidget() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(Const.dayofweek.length,
            (index) => _circleButton(Const.dayofweek[index], index)));
  }

  Widget _circleButton(String text, int index) {
    return GestureDetector(
      onTap: () {
        if (_dayofweekValue.contains(index)) {
          //이미 선택이 되어있는경우
          setState(() {
            _dayofweekValue.remove(index);
          });
        } else {
          //선택이 되어있지 않는 경우
          setState(() {
            _dayofweekValue.add(index);
            print(_dayofweekValue.toList());
          });
        }
      },
      child: ClipOval(
          child: Container(
        decoration: BoxDecoration(
            color: Color(0xFF888888),
            borderRadius:
                BorderRadius.all(Radius.circular(_pickerItemSize / 2)),
            border: _dayofweekValue.contains(index)
                ? Border.all(
                    width: 2,
                    color: Color(0xffe66259),
                    style: BorderStyle.solid)
                : null),
        height: _pickerItemSize,
        width: _pickerItemSize,
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
        ),
      )),
    );
  }

// 시간 설정
  Widget _timeWidget() {
    return Container(
      margin: EdgeInsets.only(top: 25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '시간',
                style: _sectionStyle(),
              ),
              CupertinoSwitch(
                activeColor: Colors.redAccent,
                value: _enableTime,
                onChanged: (bool value) {
                  setState(() {
                    _enableTime = value;
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          if (_enableTime)
            TextField(
              onTap: () => _showTimePicker(),
              readOnly: true,
              controller: _routineTimeTextController,
              decoration: InputDecoration(
                  hintText: "5분 독서하기",
                  hintStyle: TextStyle(fontSize: 20, color: Colors.black38),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38, width: 2)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2))),
            ),
        ],
      ),
    );
  }

// 알림 설정
  Widget _notificationWidget() {
    return Container(
      margin: EdgeInsets.only(top: 25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '알림',
                style: _sectionStyle(),
              ),
              CupertinoSwitch(
                activeColor: Colors.redAccent,
                value: _enableNotification,
                onChanged: (bool value) {
                  setState(() {
                    _enableNotification = value;
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [Text('설정한 시간에 알림을 받습니다.')],
          )
        ],
      ),
    );
  }

  // 색상설정
  Widget _colorPickerWidget() {
    return Container(
      margin: EdgeInsets.only(top: 25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '색상',
                style: _sectionStyle(),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          _colorPicker()
        ],
      ),
    );
  }

  Widget _colorPicker() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          Const.colors.length,
          (index) => GestureDetector(
              onTap: () {
                setState(() {
                  _selectedColorIndex = index;
                });
              },
              child: ClipOval(
                  child: Container(
                decoration: BoxDecoration(
                    color: Const.colors[index],
                    borderRadius:
                        BorderRadius.all(Radius.circular(_pickerItemSize / 2)),
                    border: (index == _selectedColorIndex)
                        ? Border.all(
                            width: 2,
                            color: Color(0xffe66259),
                            style: BorderStyle.solid)
                        : null),
                height: _pickerItemSize,
                width: _pickerItemSize,
              ))),
        ));
  }

  void _showTimePicker() {
    // DatePicker.showTimePicker(context,
    //     showTitleActions: true, onChanged: (date) {}, onConfirm: (date) {
    //   _routineTimeTextController.text =
    //       Utils.covertDateTimeToString(date, 'HH:mm');
    // }, currentTime: DateTime.now());
  }
}
