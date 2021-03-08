/*
* Stop Watch version 3.0
* Profile Screen version 3.0
* Jim Nguyen
* MArch 7, 2021
* Sprint Detail Screen
*/
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch/providers/sprintService.dart';

class SprintDetailScreen extends StatelessWidget {
  static const routeName = '/sprint-detail';
  @override
  Widget build(BuildContext context) {
    final sprintId = ModalRoute.of(context).settings.arguments as String;
    final completedSprint =
        Provider.of<SprintService>(context, listen: false).findById(sprintId);

    return Scaffold(
        appBar: AppBar(
          title: Text(completedSprint.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Text(
                '${completedSprint.title} Sprint Information',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 26,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Sprint Title',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 40,
                ),
              ),
              Text(
                '${completedSprint.title}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Duration',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 40,
                ),
              ),
              Text(
                '${completedSprint.duration}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Quote',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 40,
                ),
              ),
              Container(
                height: 50,
                width: double.infinity,
                child: Text(
                  completedSprint.quote,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40),
                  softWrap: true,
                ),
              ),
              Text(
                'Time Saved',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 40,
                ),
              ),
              Text(
                '${completedSprint.dateTime.substring(0, 16)}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                ),
              ),
            ],
          ),
        ));
  }
}
