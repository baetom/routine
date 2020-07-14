import 'RoutineType.dart';

class Routine {
  RoutineType type;     // 루틴 타입  메일반복,매주반복,매월반복, 특정요일반복
  String title;         // 제목
  String descrption;    // 내용
  DateTime startDate;   // 시작일
  DateTime endDate;     // 종료일
  String repeatWeekDay; // mon,tue
}