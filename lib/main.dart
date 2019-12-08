import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/auth.dart';
import 'package:todo_app/login.dart';
import 'package:todo_app/create.dart';
import 'package:todo_app/list.dart';

void main() => runApp(TODOApp());

class TODOApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TODO();
  }
}

class TODO extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return TODOState();
  }
}

class TODOState extends State<TODO> {

  final Authentication auth = new Authentication();
  FirebaseUser user;

  void onLogin(FirebaseUser user) {
    setState(() {
      this.user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO app',
      initialRoute: '/',
      routes: {
        '/': (context) => TODOLogin(onLogin: onLogin),
        '/list': (context) => TODOList(),
        '/create': (context) => TODOCreate(),
      },
    );
  }
}
