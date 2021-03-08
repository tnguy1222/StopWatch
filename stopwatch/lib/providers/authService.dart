/*
* Stop Watch version 3.0
* Authencation Service version 3.0
* Jim Nguyen
* March 7, 2021
* Authentication Service
*/
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:stopwatch/models/user.dart';
import 'package:stopwatch/utility/http_exception.dart';
import 'package:stopwatch/models/credential.dart';
import '../models/user.dart';
import '../models/credential.dart';

class AuthService with ChangeNotifier {
  // authentication token
  String token;

  //expiration date
  DateTime expDate;

  //user id
  String userId;

  List<User> _user = [];

  List<User> get user {
    return [..._user];
  }

  User findById(String id) {
    print('id:' + id);
    // print('Get to findById');
    return _user.firstWhere((userInfo) => userInfo.id == id);
  }

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
  Future<void> signup(Credential credential) async {
    // firebase url connection
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBMOPjky-RNTZj91jNw_zInVT-nc-UY6QY';
    try {
      final response = await http.post(
        url,

        // bind  object properties
        body: jsonEncode(
          {
            'email': credential.email,
            'password': credential.password,
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
  Future<void> login(Credential credential) async {
    // firebase url connection
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBMOPjky-RNTZj91jNw_zInVT-nc-UY6QY';
    try {
      // validate user credential with firebase database using http request api
      final response = await http.post(
        url,
        // bind  object properties
        body: jsonEncode(
          {
            'email': credential.email,
            'password': credential.password,
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
      print("Token:" + authToken.toString());
      print("User id" + userId);
      // catch error exception, print to console and thorws exception
    } catch (error) {
      return Future.error(error);
    }
  }

  /* addProfile function takes user object and enters user information into data base
  * @param user
  * 
  */
  Future<void> addProfile(User user) async {
    // firebase url connection
    final url =
        'https://stop-watch-e07b8.firebaseio.com/users.json?auth=$authToken';
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'creatorId': userId,
          'firstname': user.firstName,
          'lastname': user.lastName,
          'phonenumber': user.phoneNumber,
        }),
      );
      final newProfile = User(
        id: userId,
        firstName: user.firstName,
        lastName: user.lastName,
        phoneNumber: user.phoneNumber,
      );
      print(newProfile);
      notifyListeners();

      // catch error exception, print to console and thorws exception
    } catch (error) {
      print(error);
      throw error;
    }
  }

  /* updateProfile function takes user object and id and update user information into data base
  * @param id, user
  * 
  */
  Future<void> updateProfile(String id, User user) async {
    final userIndex = _user.indexWhere((userInfo) => userInfo.id == id);
    print(userIndex);
    if (userIndex >= 0) {
      // firebase url connection
      final url =
          'https://stop-watch-e07b8.firebaseio.com/users/$id.json?auth=$authToken';
      await http.patch(
        url,
        body: json.encode(
          {
            'firstname': user.firstName,
            'lastname': user.lastName,
            'phonenumber': user.phoneNumber,
          },
        ),
      );
      _user[userIndex] = user;
      notifyListeners();
      print(user.firstName + user.lastName + user.phoneNumber);
    } else {
      print('...');
    }
  }

  /* signUp function takes user object and enters user information into data base
  * @param user
  * 
  */
  Future<void> fetchAndSetUsers() async {
    print('testing for query');
    var url =
        'https://stop-watch-e07b8.firebaseio.com/users.json?auth=$authToken&orderBy="creatorId"&equalTo="$userId"';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      final List<User> foundUser = [];
      extractedData.forEach(
        (foundUserId, foundUserData) {
          foundUser.add(
            User(
              id: foundUserId,
              firstName: foundUserData['firstname'],
              lastName: foundUserData['lastname'],
              phoneNumber: foundUserData['phonenumber'],
            ),
          );
        },
      );
      _user = foundUser;

      // catch error exception, print to console and thorws exception
    } catch (error) {
      //throw (error);
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
