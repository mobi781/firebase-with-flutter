import 'package:flutter/material.dart';
import 'package:flutter_firebase/register.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build,].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // SomethingWentWrong() {
  //   return Container(
  //     width: 200,
  //     height: 200,
  //     child: Text("there is some error occured"),
  //   );
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
            home: Register(),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return const Text("Loading...");
      },
    );
    // return
  }
}
