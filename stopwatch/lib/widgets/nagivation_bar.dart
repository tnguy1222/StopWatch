/*
* Stop Watch version 3.0
* Navigation bar version 3.0
* Jim Nguyen
* March 7, 2021
* Navigation Bar widget
*/
import 'package:flutter/material.dart';
import 'package:navigation_dot_bar/navigation_dot_bar.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch/Screens/count_down_screen.dart';
import 'package:stopwatch/Screens/dash_board_screen.dart';
import 'package:stopwatch/providers/authService.dart';
import 'package:stopwatch/screens/auth_screen.dart';
import 'package:stopwatch/screens/sprint_screen.dart';
import 'package:stopwatch/screens/user_sprint_screen.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isNewRouteSameAsCurrent = false;
    // Navigation bar lists
    return BottomNavigationDotBar(
      items: <BottomNavigationDotBarItem>[
        // Home button that navigates to Home Screen
        BottomNavigationDotBarItem(
          icon: Icons.home,
          onTap: () {
            // Navigates to predefined screen, if clicks on the same screen ignore
            Navigator.popUntil(
              context,
              (route) {
                if (route.settings.name == DashboardScreen.routeName) {
                  isNewRouteSameAsCurrent = true;
                }
                return true;
              },
            );

            if (!isNewRouteSameAsCurrent) {
              Navigator.of(context)
                  .pushReplacementNamed(DashboardScreen.routeName);
            }
          },
        ),
        // Sprint button that navigates to Sprint Screen
        BottomNavigationDotBarItem(
          icon: Icons.timer,
          onTap: () {
            // Navigates to predefined screen, if clicks on the same screen ignore
            Navigator.popUntil(context, (route) {
              if (route.settings.name == CountDownScreen.routeName) {
                isNewRouteSameAsCurrent = true;
              }
              return true;
            });

            if (!isNewRouteSameAsCurrent) {
              Navigator.of(context)
                  .pushReplacementNamed(SprintScreen.routeName);
            }
          },
        ),
        // Button that navigates to User Sprint Screen
        BottomNavigationDotBarItem(
          icon: Icons.info,
          onTap: () {
            // Navigates to predefined screen, if clicks on the same screen ignore
            Navigator.popUntil(context, (route) {
              if (route.settings.name == UserSprintScreen.routeName) {
                isNewRouteSameAsCurrent = true;
              }
              return true;
            });
            if (!isNewRouteSameAsCurrent) {
              Navigator.of(context)
                  .pushReplacementNamed(UserSprintScreen.routeName);
            }
          },
        ),
        // Log Out button that logs user out
        BottomNavigationDotBarItem(
          icon: Icons.exit_to_app,
          onTap: () {
            // calls logout function in AuthService

            Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
            Provider.of<AuthService>(context, listen: false).logout();
          },
        ),
      ],
    );
  }
}
