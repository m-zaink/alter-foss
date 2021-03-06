// **
// Created by Mohammed Sadiq on 22/05/20.
// **

import 'package:alterfoss/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:alterfoss/bloc/authentication_bloc/authentication_event.dart';
import 'package:alterfoss/bloc/authentication_bloc/authentication_state.dart';
import 'package:alterfoss/reusable_components/web_aware_body.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  String email, password;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: buildBody(context),
    );
  }

  Widget buildAppBar(BuildContext context) => AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0.0,
      );

  Widget buildBody(BuildContext context) => WebAwareBody(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Alter FOSS',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Email'),
                    onChanged: (email) => this.email = email,
                    onFieldSubmitted: (_) => onLogInPressed(),
                    validator: (value) {
                      if (value.isEmpty) return 'Email cannot be empty';
                      if (value.isNotValidEmail) return 'Invalid email';
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                    ),
                    onChanged: (password) => this.password = password,
                    obscureText: true,
                    onFieldSubmitted: (_) => onLogInPressed(),
                    validator: (value) {
                      if (value.isNotValidPassword)
                        return 'Password should be at least 8 characters long';
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  buildErrorIndicator(context),
                  SizedBox(
                    height: 10.0,
                  ),
                  buildProgressIndicatorOrCTA(context),
                  buildSignUpRow(context),
                ],
              ),
            ),
          ),
        ),
      );

  Widget buildProgressIndicatorOrCTA(BuildContext context) =>
      BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state.runtimeType == LogInProgressIndicationState) {
            return SpinKitThreeBounce(
              color: Colors.orange,
            );
          } else {
            return FractionallySizedBox(
              widthFactor: 1.0,
              child: RaisedButton(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Log In',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: onLogInPressed,
                color: Colors.orange,
              ),
            );
          }
        },
      );

  VoidCallback get onLogInPressed => () {
        if (_formKey.currentState.validate())
          BlocProvider.of<AuthenticationBloc>(context).add(
            LogInEvent(
              email: email,
              password: password,
            ),
          );
      };

  Widget buildErrorIndicator(BuildContext context) =>
      BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) => Visibility(
          child: Row(
            children: <Widget>[
              Icon(
                Icons.error,
                color: Colors.redAccent,
                size: 20.0,
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                state.runtimeType == LogInErrorState
                    ? (state as LogInErrorState).error
                    : 'Something went wrong',
                style: TextStyle(
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
          visible: state.runtimeType == LogInErrorState,
        ),
      );

  Widget buildSignUpRow(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text(
        'Do not have an account?',
        style: TextStyle(color: Colors.black),
      ),
      FlatButton(
        splashColor: Colors.white,
        highlightColor: Colors.white,
        child: Text(
          'Sign up here!',
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        onPressed: () {
          BlocProvider.of<AuthenticationBloc>(context).add(
            ClickedOnSignUpButtonEvent(),
          );
        },
      ),
    ],
  );
}

extension EmailValidator on String {
  bool get isValidEmail => RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(this);

  bool get isNotValidEmail => !isValidEmail;

  bool get isValidPassword => this.isNotEmpty && this.length >= 8;

  bool get isNotValidPassword => !isValidPassword;
}
