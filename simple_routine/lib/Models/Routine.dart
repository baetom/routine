import 'RoutineType.dart';

// 루틴 아이템
class Routine {
  String title; // 제목
  String descrption; // 내용
}

// 루틴 반복 데이터
class RTRepeat {
  RTRepeatType type;    // 반복 타입
  List<int> dayofweek;  // 반복요일
  DateTime start;       // 시작일 시작시간..
  DateTime end;         // 종료일..
}

// 등록된 루틴...
class MyRoutine {
  Routine routine;
  RTRepeat repeat;
  List<int> notificationId;
  bool isDone; // 완료여부..
}

enum RTRepeatType {
  once, // 한번만
  daily, // 매일 반복
  weekly, // 매주 반복
  dayofweek // 특정 요일 반복(복수 가능..)
}

class MyRoutineHistory {
  List<MyRoutine> historyRoutines;
}
