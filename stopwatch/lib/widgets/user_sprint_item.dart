/*
* Stop Watch version 3.0
* User Sprint Item Widget version 3.0
* Jim Nguyen
* March 7, 2021
* User Sprint Item Widget 
*/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch/providers/sprintService.dart';
import 'package:stopwatch/screens/sprint_detail_screen.dart';

class UserSprintItem extends StatelessWidget {
  // intialize id variable
  final String id;
  // intialize title variable
  final String title;
  // intialize dutation variable
  final int duration;
  // intialize dateTime variable
  final String dateTime;
  // intialize quote variable
  final String quote;

  // User Sprint Item Constructor
  UserSprintItem(this.id, this.title, this.duration, this.dateTime, this.quote);

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold.of(context);
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        child: Text(
          duration.toString(),
        ),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(SprintDetailScreen.routeName, arguments: id);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                try {
                  await Provider.of<SprintService>(context, listen: false)
                      .deleteSprint(id);
                } catch (error) {
                  scaffold.showSnackBar(
                    SnackBar(
                      content: Text(
                        'Deleting failed!',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }
              },
              color: Theme.of(context).errorColor,
            )
          ],
        ),
      ),
    );
  }
}
