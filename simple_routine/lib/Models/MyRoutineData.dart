import 'package:json_annotation/json_annotation.dart';
import 'package:simple_routine/Utils/Const.dart';
import 'package:simple_routine/Utils/Utils.dart';

import 'MyRoutineUIData.dart';
part 'MyRoutineData.g.dart';

// 등록한 루딩 데이터
@JsonSerializable(nullable: true)
class MyRoutineData {
  // RTRepeatType type;
  bool isRepeat; // 반복여부..
  bool isNotification; // 알림여부..
  String title;
  String subTitle;
  String routineTime;
  int colorIndex;
  List<int> weekOfDay; // 반복 요일..
  List<int> notificationIds;
  DateTime startDateTime;
  DateTime endDateTime;

  MyRoutineData();

  factory MyRoutineData.fromJson(Map<String, dynamic> json) =>
      _$MyRoutineDataFromJson(json);
  Map<String, dynamic> toJson() => _$MyRoutineDataToJson(this);

  MyRoutineUIData createMyRoutinUIData() {
    DateTime today = DateTime.now();
    int passedDays = 10;
    // 반복이 없으면 날짜만 체크.. 오늘 날짜
    if (weekOfDay.length == 0) {
      if (Utils.isEqualyyyyMMdd(today, startDateTime)) {
        return MyRoutineUIData(
            title, subTitle, routineTime, colorIndex, passedDays, false);
      } else {
        return null;
      }
    } else {
      // 반복이 있으면 날짜와 요일체크

      if (startDateTime.isBefore(today) &&
          (endDateTime != null ? endDateTime.isAfter(today) : true) &&
          weekOfDay.contains(today.weekday - 1)) {
        return MyRoutineUIData(
            title, _subTitle(), routineTime, colorIndex, passedDays, false);
      } else {
        return null;
      }
    }
  }

  String _subTitle() {
    if (weekOfDay.length == 7) {
      return '매일';
    } else {
      List<String> weekDayStrings = weekOfDay.map((e) {
        return Const.dayofweek[e];
      }).toList();
      return weekDayStrings.join(',');
    }
  }
}
