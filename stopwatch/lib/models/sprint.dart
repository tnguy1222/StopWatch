/*
* Stop Watch version 2.0
* Sprint Model version 2.0
* Jim Nguyen
* February 7, 2021
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
