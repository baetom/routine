import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_routine/Models/MyRoutineData.dart';
import 'package:simple_routine/Models/MyRoutineUIData.dart';
import 'package:simple_routine/Models/Routine.dart';
import 'package:simple_routine/Utils/Utils.dart';

class DataManager with ChangeNotifier, DiagnosticableTreeMixin {
  // int _count = 0;
  // int get count => _count;
  final String DATA_KEY = "myroutines_datas";

  List<MyRoutineData> _myRountineDatas = [];
  List<MyRoutineUIData> _myRountines = [];
  List<MyRoutineUIData> get myRoutines => _myRountines; // 사용데이터...

  // 타이틀
  String _todayTitle = "";
  String get todayTitle => _todayTitle;

// 생성자
  DataManager() {
    // 나의 루틴 데이터를 불러온다.

    // 나의 루틴 UI데이터를 만든다.
  }

  void addMyRoutine(MyRoutineData data) {
    // 루틴 데이터 저장한다.
    _myRountineDatas.add(data);
    // _saveDataToPreference();

    // 루틴 UI 데이터 생성
    MyRoutineUIData routine = data.createMyRoutinUIData();
    if (routine != null) {
      _addMyRoutineUI(routine);
    }
  }

  void myRoutineDone(int index) {
    _myRountines[index].isDone = !_myRountines[index].isDone;
    notifyListeners();
  }

  void _addMyRoutineUI(MyRoutineUIData data) {
    _myRountines.add(data);
    notifyListeners();
  }

  // 저장
  Future<void> _saveDataToPreference() async {
    // object to jsonString
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(_myRountineDatas);
    prefs.setString(DATA_KEY, jsonString);
  }

  // 불러오기.
  Future<List<MyRoutineData>> _loadDataFromPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = prefs.getString(DATA_KEY);
    List<MyRoutineData> dataes = jsonDecode(jsonString);

    return dataes;
  }

  Future<List<MyRoutineUIData>> _createMyRoutineUIData() async {
    return null;
  }

  // void increment() {
  //   _count++;
  //   notifyListeners();
  // }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    // properties.add(IntProperty('count', count));
  }

  void _testSave(TestData data) async {
    String jsonString = json.encode(data);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(DATA_KEY, jsonString);
  }

  void _testload() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    TestData data = TestData.fromJson(json.decode(prefs.getString(DATA_KEY)));

    print(data);
  }

  void dataSave() {
    var data = TestData();
    data.age = '10';
    data.name = '배연성';
    // data.location = '김포입니다.';
    _testSave(data);
  }

  void dataRead() {
    _testload();
  }
}
