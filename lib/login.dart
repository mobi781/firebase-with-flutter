import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: use_key_in_widget_constructors
class Login extends StatefulWidget {
  //  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController userEmailController = TextEditingController();
  final TextEditingController userPasswordController = TextEditingController();

  void login() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    final String email = userEmailController.text;
    final String password = userPasswordController.text;

    try {
      final UserCredential users = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      final DocumentSnapshot snapshot =
          await firestore.collection("client").doc(users.user.uid).get();
      final userData = snapshot.data();
      print(userData['email']);
      print("User is Logged in");
    } catch (e) {
      print("we got following error :" + e);
    }
    // ignore: avoid_print
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('images/flutter.jpg'),
                    radius: 50,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: userEmailController,
                    decoration: const InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                        hintText: 'Enter Your Email Address'),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: userPasswordController,
                    decoration: const InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(),
                        hintText: 'Enter Password'),
                  ),
                  ElevatedButton(onPressed: login, child: const Text("SIGN IN"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
