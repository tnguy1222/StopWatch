/*
* Stop Watch version 4.0
* Count Down Screen version 4.0
* Jim Nguyen
* April 4,2021
* Count Down Screen
*/
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:provider/provider.dart';
import 'package:rich_alert/rich_alert.dart';
import 'package:stopwatch/models/sprint.dart';
import 'package:stopwatch/providers/sprintService.dart';
import 'package:stopwatch/screens/dash_board_screen.dart';

class CountDownScreen extends StatelessWidget {
  static const routeName = '/count-down-screen';

  CountDownScreen({Key key, @required this.sprint}) : super(key: key);
  final Sprint sprint;

  CountDownController _controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    final sprintService = Provider.of<SprintService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Count Down Screen'),
        actions: <Widget>[
          FlatButton(
              child: Icon(
                Icons.close,
                color: Colors.red,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // Pops up dailog that alerts user have completed a sprint,
                    // Save Sprint button calls addSprint method in Sprint Service and
                    return RichAlertDialog(
                      alertTitle: richTitle("Alert"),
                      alertSubtitle:
                          richSubtitle("Are you sure you want to stop?"),
                      alertType: RichAlertType.SUCCESS,
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(DashboardScreen.routeName);
                          },
                          child: Text('Yes'),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('No'),
                        ),
                      ],
                    );
                  },
                );
              })
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Text(
            sprint.title.toUpperCase(),
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          Expanded(
            child: Center(
              child: CircularCountDownTimer(
                // Countdown duration in Seconds.
                duration: sprint.duration * 60,

                // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
                controller: _controller,

                // Width of the Countdown Widget.
                width: MediaQuery.of(context).size.width / 2,

                // Height of the Countdown Widget.
                height: MediaQuery.of(context).size.height / 2,

                // Ring Color for Countdown Widget.
                color: Colors.grey[300],

                // Filling Color for Countdown Widget.

                fillColor: Colors.orange[900],

                // Background Color for Countdown Widget.
                backgroundColor: Colors.blueAccent[200],

                // Border Thickness of the Countdown Ring.
                strokeWidth: 20.0,

                // Begin and end contours with a flat edge and no extension.
                strokeCap: StrokeCap.round,

                // Text Style for Countdown Text.
                textStyle: TextStyle(
                    fontSize: 33.0,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),

                // Format for the Countdown Text.
                textFormat: CountdownTextFormat.HH_MM_SS,

                // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
                isReverse: true,

                // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
                isReverseAnimation: false,

                // Handles visibility of the Countdown Text.
                isTimerTextShown: true,

                // Handles the timer start.
                autoStart: false,

                // This Callback will execute when the Countdown Starts.
                onStart: () {
                  print('Countdown Started');
                },

                // This Callback will execute when the Countdown Ends.
                onComplete: () {
                  print('Countdown Ended');
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      // Pops up dailog that alerts user have completed a sprint,
                      // Save Sprint button calls addSprint method in Sprint Service and
                      return RichAlertDialog(
                        alertTitle: richTitle("Alert"),
                        alertSubtitle: richSubtitle('"You completed a sprint'),
                        alertType: RichAlertType.SUCCESS,
                        actions: <Widget>[
                          FlatButton(
                            onPressed: () {
                              sprintService.addSprint(sprint);
                              Navigator.of(context).pop();
                            },
                            child: Text('Save Sprint'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 30,
          ),
          // Start button that starts the timer
          _button(title: "Start", onPressed: () => _controller.start()),
          SizedBox(
            width: 10,
          ),
          // Pause button that pauses the timer
          _button(title: "Pause", onPressed: () => _controller.pause()),
          SizedBox(
            width: 10,
          ),
          // Resume button that resumes the timer
          _button(title: "Resume", onPressed: () => _controller.resume()),
          SizedBox(
            width: 10,
          ),
          // Restart button that restarts the timer
          _button(
              title: "Restart",
              onPressed: () => _controller.restart(duration: sprint.duration))
        ],
      ),
    );
  }

  // button objects that takes title and onPress actions as parameters
  // button objects enable action for floating action button above
  _button({String title, VoidCallback onPressed}) {
    return Expanded(
      child: RaisedButton(
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: onPressed,
        color: Colors.blue,
      ),
    );
  }
}
