// **
// Created by Mohammed Sadiq on 22/05/20.
// **
import 'package:alterfoss/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) => Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: buildTitle(context),
            ),
            SizedBox(height: 10.0),
            Icon(
              Icons.bubble_chart,
              size: 40.0,
              color: Colors.grey[400],
            ),
            SizedBox(height: 20.0),
            buildCTA(
              context,
              title: 'Log In',
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context)
                    .add(ClickedOnLogInButtonEvent());
              },
              color: Colors.orange,
            ),
            SizedBox(height: 20.0),
            buildCTA(
              context,
              title: 'Sign Up',
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context)
                    .add(ClickedOnSignUpButtonEvent());
              },
              color: Colors.blue,
            ),
          ],
        ),
      );

  Widget buildTitle(BuildContext context) => Text(
        'Alter FOSS',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 40.0,
        ),
      );

  Widget buildCTA(
    BuildContext context, {
    @required String title,
    @required VoidCallback onPressed,
    @required Color color,
  }) =>
      RaisedButton(
        padding: EdgeInsets.all(15.0),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: onPressed,
        color: color,
      );
}
