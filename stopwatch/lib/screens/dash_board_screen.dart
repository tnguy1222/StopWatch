/*
* Stop Watch version 3.0
* Dashboard Screen version 3.0
* Jim Nguyen
* March 7, 2021
* Dashboard Screen
*/
import 'package:flutter/material.dart';
import 'package:stopwatch/widgets/app_drawer.dart';
import 'package:stopwatch/widgets/nagivation_bar.dart';

class DashboardScreen extends StatelessWidget {
  static const routeName = '/dashboard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stop Watch'),
      ),
      drawer: AppDrawer(),
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
