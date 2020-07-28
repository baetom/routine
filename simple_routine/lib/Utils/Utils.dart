import 'package:intl/intl.dart';

class Utils {
  // 반복이 없다면 무조건 7일후 종료일로 정한다.
  static DateTime calcRoutinEndDateTime(bool isRepeat, List<int> dayOfweeks) {
    if (dayOfweeks.length > 0 && !isRepeat) {
      DateTime today = DateTime.now(); // 오늘
      DateTime endDateTime = today.add(Duration(days: 7));
      return endDateTime;
    } else {
      return null;
    }
  }

  static bool isEqualyyyyMMdd(DateTime dateTime, DateTime compareDateTime) {
    Duration duration = dateTime.difference(compareDateTime);
    if (duration.inDays == 0) {
      return true;
    }

    return false;
  }

  static String covertDateTimeToString(DateTime dateTime, String format){
    return DateFormat(format).format(dateTime);
  }
}
