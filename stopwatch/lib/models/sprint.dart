/*
* Stop Watch version 4.0
* Sprint Model version 4.0
* Jim Nguyen
* April 4, 2021
* Sprint class acts as a Model
*/
import 'package:flutter/foundation.dart';

class Sprint {
  final String id;
  final String title;
  final int duration;
  final String dateTime;
  final String quote;

  // Default constructor
  Sprint({
    @required this.id,
    @required this.title,
    @required this.duration,
    @required this.dateTime,
    @required this.quote,
  });
}
