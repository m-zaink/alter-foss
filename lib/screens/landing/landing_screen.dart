// **
// Created by Mohammed Sadiq on 22/05/20.
// **
import 'package:alterfoss/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:alterfoss/bloc/authentication_bloc/authentication_state.dart';
import 'package:alterfoss/screens/home/home_screen.dart';
import 'package:alterfoss/screens/log_in/log_in_screen.dart';
import 'package:alterfoss/screens/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: buildBody,
      ),
    );
  }

  Widget buildBody(BuildContext context, AuthenticationState state) {
    if (homeScreenStates.contains(state.runtimeType)) {
      return HomeScreen(greetings: (state as HomeScreenState).greetings);
    } else if (signUpScreenStates.contains(state.runtimeType)) {
      return SignUpScreen();
    } else if (logInScreenStates.contains(state.runtimeType)) {
      return LogInScreen();
    } else {
      return Center(child: SpinKitThreeBounce(color: Colors.orange));
    }
  }

  List<Type> get homeScreenStates => [HomeScreenState];

  List<Type> get signUpScreenStates => [
        SignUpScreenState,
        SignUpProgressIndicationState,
        SignUpErrorState,
      ];

  List<Type> get logInScreenStates => [
        LogInScreenState,
        LogInProgressIndicationState,
        LogInErrorState,
      ];
}
