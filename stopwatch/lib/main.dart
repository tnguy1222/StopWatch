/*
* Stop Watch
* Account Controller version 2.0
* Jim Nguyen
* February 7, 2021
* Main function
*/
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:stopwatch/providers/sprintService.dart';
import 'package:stopwatch/screens/auth_screen.dart';
import 'package:stopwatch/screens/count_down_screen.dart';
import 'package:stopwatch/screens/dash_board_screen.dart';
import 'package:stopwatch/screens/profile_screen.dart';
import 'package:stopwatch/screens/sprint_screen.dart';

import 'providers/authService.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // Providers lists
      providers: [
        ChangeNotifierProvider.value(
          value: AuthService(),
        ),
        ChangeNotifierProvider.value(
          value: SprintService(),
        ),
      ],
      child: Consumer<AuthService>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'Stop Watch',

          //App Theme styling
          theme: ThemeData(
            primarySwatch: Colors.lightBlue,
            backgroundColor: Colors.white,
            accentColor: Colors.lightBlue,
            accentColorBrightness: Brightness.dark,
            buttonTheme: ButtonTheme.of(context).copyWith(
              buttonColor: Colors.redAccent,
              textTheme: ButtonTextTheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          home: auth.isAuth ? DashboardScreen() : AuthScreen(),
          routes: {
            //this route is mapped to Authentication Screen
            AuthScreen.routeName: (ctx) => AuthScreen(),
            //this route is mapped to Sprint Screen
            SprintScreen.routeName: (ctx) => SprintScreen(),
            //this route is mapped to Count Down Screen
            CountDownScreen.routeName: (ctx) => CountDownScreen(),
            //this route is mapped to Dashboard Screen
            DashboardScreen.routeName: (ctx) => DashboardScreen(),
            //this route is mapped to Profile Screen
            ProfileScreen.routeName: (ctx) => ProfileScreen(),
          },
        ),
      ),
    );
  }
}
