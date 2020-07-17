import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddMyRoutineScreen extends StatelessWidget {

final List<String> _dayofweek = ['월','화','수','목','금','토','일'];

  @override
  Widget build(BuildContext context) {
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
      ),
      body: GestureDetector(
        child: Container(
            margin: EdgeInsets.only(left: 24, right: 24),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      hintText: "5분 독서하기",
                      hintStyle: TextStyle(fontSize: 20, color: Colors.black38),
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black38, width: 2)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2))),
                ),
                Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Row(
                    children: [
                      Text(
                        '반복',
                        style: _sectionStyle(),
                      )
                    ],
                  ),
                )
              ],
            )),
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

  void _hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  TextStyle _sectionStyle() {
    return TextStyle(fontSize: 24, fontWeight: FontWeight.w500);
  }

  Widget _dayofweekWidget() {
    return Row(
      children: [_dayofweek.map((day) {
        return _circleButton(day);
      })]
    );
  }

  Widget _circleButton(String text) {
    return ClipOval(
      child: Material(
        color: Colors.blue, // button color
        child: InkWell(
          splashColor: Colors.red, // inkwell color
          child: SizedBox(width: 56, height: 56, child: Icon(Icons.menu)),
          onTap: () {},
        ),
      ),
    );
  }
}
