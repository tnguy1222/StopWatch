/*
* Stop Watch version 2.0
* Dashboard Screen version 2.0
* Jim Nguyen
* February 7, 2021
* Dashboard Screen
*/
import 'package:flutter/material.dart';
import 'package:stopwatch/widgets/nagivation_bar.dart';

class DashboardScreen extends StatelessWidget {
  static const routeName = '/dashboard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stop Watch'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text(
          'Welcome To Stop Watch',
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
