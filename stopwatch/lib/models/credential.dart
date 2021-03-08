/*
* Stop Watch version 3.0
* Credential Model version 3.0
* Jim Nguyen
* March 7, 2021
* Credential acts as a Model
*/
import 'package:flutter/foundation.dart';

class Credential {
  final String email;
  final String password;

  // Default constructor
  Credential({
    @required this.email,
    @required this.password,
  });
}
