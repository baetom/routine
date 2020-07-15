import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:simple_routine/Models/Routine.dart';

class MyRoutineScreen extends StatelessWidget {
  List<MyRoutine> myRoutines = List();

  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: EdgeInsets.only(left: 10, right: 10),
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, position) {
              return DottedBorder(
                child: Card(
                  child: ListTile(
                    leading: Text('완료'),
                    title: Text('할일이다. $position'),
                    trailing: Text(
                      '10시50분',
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              );
            }));
  }

  void _addRoutine() {}

  void _deleteRountine() {}

  void _modifyRoutine() {}
}
