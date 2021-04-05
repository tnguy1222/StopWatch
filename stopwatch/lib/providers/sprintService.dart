/*
* Stop Watch version 4.0
* Sprint Service version 4.0
* Jim Nguyen
* April 4,2021
* Sprint Service
*/
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:stopwatch/models/sprint.dart';
import 'package:http/http.dart' as http;
import 'package:stopwatch/utility/http_exception.dart';

class SprintService with ChangeNotifier {
  // initilize private sprint list
  List<Sprint> _sprints = [];
  // authToken
  final String authToken;
  // userId
  final String userId;
  //SprintService constructor
  SprintService(this.authToken, this.userId, this._sprints);

  /* getter function returns sprint list  
  */
  List<Sprint> get sprints {
    return [..._sprints];
  }

  /* findById function takes id and return sprintobject
  * @param id
  * 
  */
  Sprint findById(String id) {
    return _sprints.firstWhere((sprint) => sprint.id == id);
  }

  /* addSprint function takes sprint object
  * @param sprint
  * 
  */
  Future<void> addSprint(Sprint sprint) async {
    // firebase url connection
    final url =
        'https://stop-watch-9482c-default-rtdb.firebaseio.com/sprints.json?auth=$authToken';
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
          'creatorId': userId,
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

  /* getAllSprints function get all existing sprints belong to user
  * @param 
  * return _sprints
  */
  Future<void> getAllSprints() async {
    // firebase url connection
    var url =
        'https://stop-watch-9482c-default-rtdb.firebaseio.com/sprints.json?auth=$authToken&orderBy="creatorId"&equalTo="$userId"';
    try {
      // get sprintinfomation to database using http get request api
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      print(jsonDecode(response.body));
      final List<Sprint> completedSprints = [];
      extractedData.forEach(
        (sprintId, sprintData) {
          completedSprints.add(Sprint(
            id: sprintId,
            title: sprintData['title'],
            duration: sprintData['duration'],
            dateTime: sprintData['datetime'],
            quote: sprintData['quote'],
          ));
        },
      );
      print(json.decode(response.body));
      _sprints = completedSprints;
      notifyListeners();

      // catch error exception, print to console and thorws exception
    } catch (error) {
      print(error.toString());
      throw (error);
    }
  }

  /* deleteSprint function delete selected sprint object
  * @param id
  * 
  */
  Future<void> deleteSprint(String id) async {
    // firebase url connection
    final url =
        'https://stop-watch-9482c-default-rtdb.firebaseio.com/sprints/$id.json?auth=$authToken';
    final existingSprintIndex = _sprints.indexWhere((s) => s.id == id);
    // remove sprint at selected index
    var existingSprint = _sprints[existingSprintIndex];
    _sprints.removeAt(existingSprintIndex);
    notifyListeners();
    final response = await http.delete(url);

    // exception handler
    if (response.statusCode >= 400) {
      _sprints.insert(existingSprintIndex, existingSprint);
      notifyListeners();
      throw HttpException('Could not delete product.');
    }
    // return empty existingSprint after delete
    existingSprint = null;
  }
}
