import 'package:flutter/material.dart';
import 'package:simple_routine/Utils/Const.dart';
import 'package:simple_routine/Utils/Utils.dart';

import 'RoutineType.dart';
import 'package:json_annotation/json_annotation.dart';

// // 루틴 아이템
// class Routine {
//   String title; // 제목
//   String descrption; // 내용
// }

// // 루틴 반복 데이터
// class RTRepeat {
//   RTRepeatType type;    // 반복 타입
//   List<int> dayofweek;  // 반복요일
//   DateTime start;       // 시작일 시작시간..
//   DateTime end;         // 종료일..
// }

// // 등록된 루틴...
// class MyRoutine {
//   Routine routine;
//   RTRepeat repeat;
//   List<int> notificationId;
//   bool isDone; // 완료여부..
// }

// class MyActiveRoutine{

// }

enum RTRepeatType {
  once, // 한번만
  daily, // 매일 반복
  weekly, // 매주 반복
  dayofweek // 특정 요일 반복(복수 가능..)
}

// class MyRoutineHistory {
//   List<MyRoutine> historyRoutines;
// }

// // 등록한 루딩 데이터
// @JsonSerializable(nullable: true)
// class MyRoutineData {
//   // RTRepeatType type;
//   bool isRepeat; // 반복여부..
//   bool isNotification; // 알림여부..
//   String title;
//   String subTitle;
//   String routineTime;
//   int colorIndex;
//   List<int> weekOfDay; // 반복 요일..
//   List<int> notificationIds;
//   DateTime startDateTime;
//   DateTime endDateTime;

//   MyRoutineData();

//   MyRoutineUIData createTodayRoutine() {
//     return MyRoutineUIData("책일기 10장", "월,화,수", "오전 09:00", 0, 30, false);
//   }

//   // factory MyRoutineData.fromJson(Map<String, dynamic> json) =>
//   //     _$MyRoutineDataFromJson(json);
//   // Map<String, dynamic> toJson() => _$MyRoutineDataToJson(this);

//   // MyRoutineData.fromJson(Map<String, dynamic> json)
//   //     : isRepeat = json['isRepeat'],
//   //       isNotification = json['isNotification'],
//   //       title = json['title'],
//   //       subTitle = json['subTitle'],
//   //       routineTime = json['routineTime'],
//   //       colorIndex = json['colorIndex'],
//   //       notificationIds = json['notificationIds'],
//   //       startDateTime = json['startDateTime'],
//   //       endDateTime = json['endDateTime'];

//   // Map<String, dynamic> toJson() => {
//   //       'isRepeat': isRepeat,
//   //       'isNotification': isNotification,
//   //       'title': title,
//   //       'subTitle': subTitle,
//   //       'routineTime': routineTime,
//   //       'colorIndex': colorIndex,
//   //       'weekOfDay': weekOfDay,
//   //       'notificationIds': notificationIds,
//   //       'startDateTime': startDateTime,
//   //       'endDateTime': endDateTime,
//   //     };

//   MyRoutineUIData createMyRoutinUIData() {
//     DateTime today = DateTime.now();
//     int passedDays = 10;
//     // 반복이 없으면 날짜만 체크.. 오늘 날짜
//     if (weekOfDay.length == 0) {
//       if (Utils.isEqualyyyyMMdd(today, startDateTime)) {
//         return MyRoutineUIData(
//             title, subTitle, routineTime, colorIndex, passedDays, false);
//       } else {
//         return null;
//       }
//     } else {
//       // 반복이 있으면 날짜와 요일체크

//       if (startDateTime.isBefore(today) &&
//           (endDateTime != null ? endDateTime.isAfter(today) : true) &&
//           weekOfDay.contains(today.weekday - 1)) {
//         return MyRoutineUIData(
//             title, _subTitle(), routineTime, colorIndex, passedDays, false);
//       } else {
//         return null;
//       }
//     }
//   }

//   String _subTitle() {
//     if (weekOfDay.length == 7) {
//       return '매일';
//     } else {
//       List<String> weekDayStrings = weekOfDay.map((e) {
//         return Const.dayofweek[e];
//       }).toList();
//       return weekDayStrings.join(',');
//     }
//   }
// }

class TestData {
  String name;
  String age;
  String location;
  TestData();

  TestData.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'],
        location = json['location'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
        'location': location,
      };
}
