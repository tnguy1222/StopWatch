/*
* Stop Watch version 4.0
* Profile Screen version 4.0
* Jim Nguyen
* April 4, 2021
* New Profile Screen
*/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch/models/user.dart';
import 'package:stopwatch/providers/authService.dart';
import 'package:stopwatch/screens/dash_board_screen.dart';
import 'package:stopwatch/widgets/nagivation_bar.dart';

class NewProfileScreen extends StatefulWidget {
  static const routeName = '/new-profile-screen';

  @override
  _NewProfileScreenState createState() => _NewProfileScreenState();
}

class _NewProfileScreenState extends State<NewProfileScreen> {
  final _firstNameFocusNode = FocusNode();
  final _lastNameFocusNode = FocusNode();
  final _phoneNumberFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final userId = Provider.of<AuthService>(context).getUserId;
      print(userId);
      if (userId != null) {
        Provider.of<AuthService>(context).fetchAndSetUsers();
        _inputProfile =
            Provider.of<AuthService>(context, listen: false).findById(userId);
        _initValues = {
          'firstName': _inputProfile.firstName,
          'lastName': _inputProfile.lastName,
          'phoneNumber': _inputProfile.phoneNumber,
        };
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    super.dispose();
  }

  var _initValues = {
    'firstName': '',
    'lastName': '',
    'phoneNumber': '',
  };

  var _inputProfile = User(
    id: null,
    firstName: '',
    lastName: '',
    phoneNumber: '',
  );

  Future<void> _addProfile() async {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    setState(() {
      _isLoading = true;
    });
    if (_inputProfile.id != null) {
      await Provider.of<AuthService>(context, listen: false)
          .updateProfile(_inputProfile.id, _inputProfile);
      Navigator.of(context).pop();
    } else {
      try {
        await Provider.of<AuthService>(context, listen: false)
            .addProfile(_inputProfile);
      } catch (error) {
        await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('An error occurred!'),
            content: Text('Something went wrong.'),
            actions: <Widget>[
              FlatButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
        );
      }
      setState(
        () {
          _isLoading = false;
        },
      );
      Navigator.of(context).pushNamed(DashboardScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Profile'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save), onPressed: _addProfile),
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: _form,
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      initialValue: _initValues['firstName'],
                      decoration: InputDecoration(labelText: 'First Name'),
                      focusNode: _firstNameFocusNode,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(_firstNameFocusNode);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please provide a valid Input';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _inputProfile = User(
                            id: null,
                            firstName: value,
                            lastName: _inputProfile.lastName,
                            phoneNumber: _inputProfile.phoneNumber);
                      },
                    ),
                    TextFormField(
                      initialValue: _initValues['lastName'],
                      decoration: InputDecoration(labelText: 'Last Name'),
                      focusNode: _lastNameFocusNode,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_lastNameFocusNode);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please provide a valid Input';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _inputProfile = User(
                            id: null,
                            firstName: _inputProfile.firstName,
                            lastName: value,
                            phoneNumber: _inputProfile.phoneNumber);
                      },
                    ),
                    TextFormField(
                      initialValue: _initValues['phoneNumber'],
                      decoration: InputDecoration(labelText: 'Phone Number'),
                      focusNode: _phoneNumberFocusNode,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(_phoneNumberFocusNode);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please provide a valid phone number';
                        }
                        if (value.length <= 9) {
                          return 'Please provide a valid phone number';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _inputProfile = User(
                            id: null,
                            firstName: _inputProfile.firstName,
                            lastName: _inputProfile.lastName,
                            phoneNumber: value);
                      },
                    ),
                  ],
                ),
              ),
            ),
      // Bottom navigation bar
      bottomNavigationBar: NavigationBar(),
    );
  }
}
