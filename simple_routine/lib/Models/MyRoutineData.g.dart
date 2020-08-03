// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MyRoutineData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyRoutineData _$MyRoutineDataFromJson(Map<String, dynamic> json) {
  return MyRoutineData()
    ..isRepeat = json['isRepeat'] as bool
    ..isNotification = json['isNotification'] as bool
    ..title = json['title'] as String
    ..subTitle = json['subTitle'] as String
    ..routineTime = json['routineTime'] as String
    ..colorIndex = json['colorIndex'] as int
    ..weekOfDay = (json['weekOfDay'] as List)?.map((e) => e as int)?.toList()
    ..notificationIds =
        (json['notificationIds'] as List)?.map((e) => e as int)?.toList()
    ..startDateTime = json['startDateTime'] == null
        ? null
        : DateTime.parse(json['startDateTime'] as String)
    ..endDateTime = json['endDateTime'] == null
        ? null
        : DateTime.parse(json['endDateTime'] as String);
}

Map<String, dynamic> _$MyRoutineDataToJson(MyRoutineData instance) =>
    <String, dynamic>{
      'isRepeat': instance.isRepeat,
      'isNotification': instance.isNotification,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'routineTime': instance.routineTime,
      'colorIndex': instance.colorIndex,
      'weekOfDay': instance.weekOfDay,
      'notificationIds': instance.notificationIds,
      'startDateTime': instance.startDateTime?.toIso8601String(),
      'endDateTime': instance.endDateTime?.toIso8601String(),
    };
