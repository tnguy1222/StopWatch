/*
* Stop Watch version 3.0
* Sprint Item Widget version 3.0
* Jim Nguyen
* March 7, 2021
* Sprint Item Widget
*/
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch/models/sprint.dart';
import 'package:stopwatch/providers/authService.dart';
import 'package:stopwatch/screens/sprint_detail_screen.dart';

class SprintItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sprint = Provider.of<Sprint>(context, listen: false);
    final authData = Provider.of<AuthService>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              SprintDetailScreen.routeName,
              arguments: sprint.id,
            );
          },
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Sprint>(
            builder: (ctx, sprint, _) => IconButton(
              icon: Icon(Icons.favorite),
            ),
          ),
          title: Expanded(
            child: Text(
              sprint.title,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
