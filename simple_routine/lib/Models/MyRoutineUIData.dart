// 화면에 표시를 위한 데이터..
class MyRoutineUIData {
  String title;
  String subTitle;
  String routineTime;
  int colorIndex;
  int passDays; // 등록후 몇번째 루팅
  bool isNotification; // 알림 여부
  bool isDone; // 완료 여부

  MyRoutineUIData(String title, String subTitle, String routineTime,
      int colorIndex, int passedDays, bool isDone) {
    this.title = title;
    this.subTitle = subTitle;
    this.routineTime = routineTime;
    this.colorIndex = colorIndex;
    this.passDays = passedDays;
    this.isDone = isDone;
  }
}
