import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:simple_routine/Models/Routine.dart';



class DataManager with ChangeNotifier, DiagnosticableTreeMixin {
  int _count = 0;
  int get count => _count;

  List<MyRoutineUIData> _myRountines = [];
  List<MyRoutineUIData> get myRoutines => _myRountines;



  void increment() {
    _count++;
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
  }
}