/*
* Stop Watch version 2.0
* Authencation Service version 2.0
* Jim Nguyen
* February 7, 2021
* Authentication Service
*/
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:stopwatch/utility/http_exception.dart';
import 'package:stopwatch/models/user.dart';

class AuthService with ChangeNotifier {
  // authentication token
  String token;

  //expiration date
  DateTime expDate;

  //user id
  String userId;

  // default constructor
  AuthService({this.token, this.expDate, this.userId});

  // isAuth getter method sets authentication token
  bool get isAuth {
    return token != null;
  }

  //getUserId getter method returns userId
  String get getUserId {
    return userId;
  }

  //authToken returns authentication token
  String get authToken {
    if (expDate != null && expDate.isAfter(DateTime.now()) && token != null) {
      return token;
    }
    return null;
  }

  /* signUp function takes user object and enters user information into data base
  * @param user
  * 
  */
  Future<void> signup(User user) async {
    // url acts as connection string
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBMOPjky-RNTZj91jNw_zInVT-nc-UY6QY';
    try {
      final response = await http.post(
        url,

        // bind  object properties
        body: jsonEncode(
          {
            'email': user.email,
            'password': user.password,
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body);

      // throw exception error
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }

      notifyListeners();
      print(json.decode(response.body));
    } catch (error) {
      return Future.error(error);
    }
  }

  /* login function takes user object and validates user information into data base
  * @param user
  * 
  */
  Future<void> login(User user) async {
    // url acts as connection string
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBMOPjky-RNTZj91jNw_zInVT-nc-UY6QY';
    try {
      // validate user credential with firebase database using http request api
      final response = await http.post(
        url,
        // bind  object properties
        body: jsonEncode(
          {
            'email': user.email,
            'password': user.password,
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body);
      // throw exception error
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      token = responseData['idToken'];
      userId = responseData['localId'];
      expDate = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responseData['expiresIn'],
          ),
        ),
      );
      //notify listener
      notifyListeners();
      print(json.decode(response.body));
      // catch error exception error
    } catch (error) {
      return Future.error(error);
    }
  }

  /* logout functions that logs user out, clear token, expDate and userId values
  *
  *
  */
  void logout() {
    token = null;
    userId = null;
    expDate = null;
    notifyListeners();
  }
}
