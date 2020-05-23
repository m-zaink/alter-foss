// **
// Created by Mohammed Sadiq on 22/05/20.
// **
import 'package:alterfoss/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:alterfoss/bloc/authentication_bloc/authentication_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  final String greetings;

  const HomeScreen({Key key, @required this.greetings}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    showGreetings();
    super.initState();
  }

  void showGreetings() => Future.delayed(
        Duration(seconds: 1),
        () => _scaffoldState.currentState.showSnackBar(
          SnackBar(
            content: Text(widget.greetings),
            backgroundColor: Colors.green,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: buildBody(context),
      drawer: buildDrawer(context),
    );
  }

  Widget buildAppBar(BuildContext context) => AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Alter FOSS',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      );

  Widget buildBody(BuildContext context) => Center(
    child: FractionallySizedBox(
      widthFactor: kIsWeb ? 0.7 : 1.0,
      child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) => Container(
              padding: EdgeInsets.all(10.0),
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      child: Image.asset('images/alter_foss.png'),
                    ),
                    ListTile(
                      title: Text('Alter FOSS'),
                      subtitle: Text('Merry Life'),
                      trailing: Icon(Icons.bubble_chart),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
    ),
  );

  Widget buildDrawer(BuildContext context) => Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Text(
                  'Alter FOSS',
                  style: TextStyle(color: Colors.white, fontSize: 28.0),
                ),
              ),
              decoration: BoxDecoration(color: Colors.orange),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Log Out'),
              onTap: () {
                Navigator.pop(context);
                BlocProvider.of<AuthenticationBloc>(context).add(
                  LogOutEvent(),
                );
              },
            )
          ],
        ),
      );
}
