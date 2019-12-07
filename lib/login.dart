import 'package:flutter/material.dart';

// As login page has to handle user input, it has to be stateful
class TODOLogin extends StatefulWidget {

  // Callback function that will be called on pressing the login button
  final onLogin;

  TODOLogin({@required this.onLogin});

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<TODOLogin> {

  // Controllers for handling email and password
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Please log in')
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        // Align widgets in a vertical column
        child: Column(
          // Passing multiple widgets as children to Column
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email'
                ),
              )
            ),
            Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password'
                  ),
                )
            ),
            RaisedButton(
              // Calling the callback with the supplied email and password
              onPressed: () =>
                  widget.onLogin(emailController.text, passwordController.text),
              child: Text('LOGIN'),
              // Setting the primary color on the button
              color: ThemeData().primaryColor,
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
        )
      )
    );
  }
}