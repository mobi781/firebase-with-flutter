import 'package:flutter/material.dart';
import 'package:flutter_firebase/login.dart';
import 'package:flutter_firebase/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build,].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   home: Scaffold(
    //     appBar: AppBar(
    //       title: Text("Quiz App"),
    //     ),
    //     body: Text("hello from Mubashar"),
    //   ),
    // );
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return const Text("Error occured in initialization");
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Firebase Testing',
            theme: ThemeData(
              primarySwatch: Colors.purple,
            ),
            home: Login(),
            routes: {
              // "/": (context) => Login(),
              "/login": (context) => Login(),
              "/register": (context) => Register(),
              "/home": (context) => Home()
            },
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return const Text("Loading...");
      },
    );
    // return
  }
}
