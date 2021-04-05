/*
* Stop Watch version 4.0
* App Drawer widget version 4.0
* Jim Nguyen
* April 4,2021
* App Drawer widget
*/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch/providers/authService.dart';
import 'package:stopwatch/screens/new_profile_screen.dart';
import 'package:stopwatch/screens/user_sprint_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthService>(context);

    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hello'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.assignment),
            title: Text('Your Completed Sprints'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(UserSprintScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('User Profile'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(NewProfileScreen.routeName);
            },
          )
        ],
      ),
    );
  }
}
