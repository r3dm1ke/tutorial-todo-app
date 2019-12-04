// Importing the material library with common UI components
import 'package:flutter/material.dart';

// Entry point for our application
// It tells Flutter to run the app and use TODOApp widget as the entry point
void main() => runApp(TODOApp());

// The root widget for our app
// It is stateless, that is why it expends StatelessWidget
class TODOApp extends StatelessWidget {

  // We are overriding the build method
  // It has to be done for every custom widget you define
  @override
  Widget build(BuildContext context) {
    // Material app is a built in widget to help you with the app layout
    return MaterialApp(
        title: 'TODO app',
        // Scaffold is a built in widget to help you with the specific screen layout
        home: Scaffold(
          // AppBar is the header in the top of the screen
            appBar: AppBar(
              title: Text('TODO app'),
            ),
            // This is the actual content of the screen
            // We output the text 'Hello word', also centering it in the middle of the screen
            body: Center(
                child: Text('Hello world')
            )
        )
    );
  }
}