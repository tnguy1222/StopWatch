/*
* Stop Watch version 2.0
* Sprint Service version 2.0
* Jim Nguyen
* February 7, 2021
* Sprint Service
*/
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:stopwatch/models/sprint.dart';
import 'package:http/http.dart' as http;

class SprintService with ChangeNotifier {
  /* addSprint function takes sprint object
  * @param sprint
  * 
  */
  Future<void> addSprint(Sprint sprint) async {
    // url acts as connection string
    final url = 'https://stop-watch-e07b8.firebaseio.com/sprints.json';
    try {
      // add sprintinfomation to database using http request api
      final reponse = await http.post(
        url,
        body: json.encode({
          // bind  object properties
          'title': sprint.title,
          'duration': sprint.duration,
          'datetime': sprint.dateTime,
          'quote': sprint.quote,
        }),
      );
      final newSprint = Sprint(
        title: sprint.title,
        duration: sprint.duration,
        dateTime: sprint.dateTime,
        quote: sprint.quote,
        id: json.decode(reponse.body)['name'],
      );
      print(newSprint.toString());

      // notify listener to make changes
      notifyListeners();

      // catch error exception, print to console and thorws exception
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
