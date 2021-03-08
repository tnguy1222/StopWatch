/*
* Stop Watch version 3.0
* User Model version 3.0
* Jim Nguyen
* March 7, 2021
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
