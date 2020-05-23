import 'package:alterfoss/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:alterfoss/screens/landing/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';

void main() => runApp(AlterFOSSApp());

class AlterFOSSApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AlterFOSS',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: BlocProvider<AuthenticationBloc>(
        create: (context) => AuthenticationBloc()
          ..add(
            CheckForLoggedInStatusEvent(),
          ),
        child: LandingScreen(),
      ),
    );
  }
}
