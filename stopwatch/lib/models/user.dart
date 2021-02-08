/*
* Stop Watch version 2.0
* User Model version 2.0
* Jim Nguyen
* February 7, 2021
* User acts as a Model
*/
import 'package:flutter/foundation.dart';

class User {
  final String email;
  final String password;

  // Default constructor
  User({
    @required this.email,
    @required this.password,
  });
}
