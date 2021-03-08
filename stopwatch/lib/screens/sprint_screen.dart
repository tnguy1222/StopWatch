/*
* Stop Watch version 3.0
* Sprint Screen version 3.0
* Jim Nguyen
* March 7, 2021
* Sprint Screen
*/
import 'package:flutter/material.dart';
import 'package:stopwatch/models/sprint.dart';
import 'package:stopwatch/screens/count_down_screen.dart';
import 'package:stopwatch/widgets/nagivation_bar.dart';

class SprintScreen extends StatefulWidget {
  static const routeName = '/sprint-screen';

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<SprintScreen> {
  final _titleFocusNode = FocusNode();
  final _durationFocusNode = FocusNode();
  final _quoteFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();

  // initinalizes initial values as place holders for text fields
  var _initValues = {
    'title': '',
    'duration': '',
    'quote': '',
  };

  // initializes inputSprint as private object of Print model
  var _inputSprint = Sprint(
    id: null,
    title: '',
    duration: 0,
    dateTime: '',
    quote: '',
  );

  // addSprint private asynchronous validates and passes sprint model to Count Down Screen
  void _addSprint() async {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CountDownScreen(
          //durationInput: _inputSprint.duration,
          sprint: Sprint(
              id: null,
              title: _inputSprint.title,
              duration: _inputSprint.duration,
              dateTime: DateTime.now().toString(),
              quote: _inputSprint.quote),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // New sprint screen that takes Title, Duration and Quote as input
    return Scaffold(
      appBar: AppBar(
        title: Text('New Sprint Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              // Text form field that takes title as input
              TextFormField(
                initialValue: _initValues['title'],
                decoration: InputDecoration(labelText: 'Title'),
                focusNode: _titleFocusNode,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_titleFocusNode);
                },
                // Input validation
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please provide an valid input';
                  }
                  return null;
                },
                onSaved: (value) {
                  _inputSprint = Sprint(
                    id: _inputSprint.id,
                    title: value,
                    duration: _inputSprint.duration,
                    dateTime: _inputSprint.dateTime,
                    quote: _inputSprint.quote,
                  );
                },
              ),
              // Text form field that takes duration as input
              TextFormField(
                initialValue: _initValues['duration'],
                decoration: InputDecoration(labelText: 'Duration in Minutes'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _durationFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_titleFocusNode);
                },
                // Input validation
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please provide an valid input';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number.';
                  }
                  if (int.parse(value) <= 0) {
                    return 'Please enter a number greater than zero.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _inputSprint = Sprint(
                    id: _inputSprint.id,
                    title: _inputSprint.title,
                    duration: int.parse(value),
                    dateTime: _inputSprint.dateTime,
                    quote: _inputSprint.quote,
                  );
                },
              ),
              // Text form field that takes title as input
              TextFormField(
                initialValue: _initValues['quote'],
                decoration:
                    InputDecoration(labelText: 'What motivates you ? Quote'),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: _quoteFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_titleFocusNode);
                },
                // Input validation
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please provide an valid input';
                  }

                  return null;
                },
                onSaved: (value) {
                  _inputSprint = Sprint(
                    id: _inputSprint.id,
                    title: _inputSprint.title,
                    duration: _inputSprint.duration,
                    dateTime: _inputSprint.dateTime,
                    quote: value,
                  );
                },
              ),
              // Raise button thats calls addSprint method
              RaisedButton(
                child: Text('Start'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).primaryTextTheme.button.color,
                onPressed: () {
                  _addSprint();
                },
              )
            ],
          ),
        ),
      ),
      // Bottom navigation bar
      bottomNavigationBar: NavigationBar(),
    );
  }
}
