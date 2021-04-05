/*
* Stop Watch version 4.0
* User Model version 4.0
* Jim Nguyen
* April 4, 2021
* User acts as a Model
*/
import 'package:flutter/foundation.dart';

class User {
  final String id;
  final String firstName;
  final String lastName;
  final String phoneNumber;

  // Default constructor
  User({
    @required this.id,
    @required this.firstName,
    @required this.lastName,
    @required this.phoneNumber,
  });
}
