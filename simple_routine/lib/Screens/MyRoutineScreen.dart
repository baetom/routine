import 'package:flutter/material.dart';

class MyRoutineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: EdgeInsets.only(left: 10, right: 10),
        child: ListView.separated(
            separatorBuilder: (context, position) {
              return Divider(
                color: Colors.black45,
              );
            },
            itemCount: 100,
            itemBuilder: (context, position) {
              return ListTile(
                leading: Text('완료'),
                title: Text('할일이다. $position'),
                trailing: Text(
                  '10시50분',
                  textAlign: TextAlign.right,
                ),
              );
            }));
  }
}
