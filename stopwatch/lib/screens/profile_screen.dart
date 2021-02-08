/*
* Stop Watch version 2.0
* Profile Screen version 2.0
* Jim Nguyen
* February 7, 2021
* Profile Screen
*/
import 'package:flutter/material.dart';
import 'package:stopwatch/widgets/nagivation_bar.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile-screen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text(
          'Info Page',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      // Bottom navigation bar
      bottomNavigationBar: NavigationBar(),
    );
  }
}
