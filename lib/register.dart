import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  //  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userEmailController = TextEditingController();
  final TextEditingController userPasswordController = TextEditingController();
  void collectData() {
    final String username = userNameController.text;
    print("signup Button pressed and username value is " + username);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
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
                  TextFormField(
                    controller: userNameController,
                    decoration: InputDecoration(
                        labelText: "User Name",
                        border: OutlineInputBorder(),
                        hintText: 'Enter User Name'),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: userEmailController,
                    decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                        hintText: 'Enter Your Email Address'),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: userPasswordController,
                    decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(),
                        hintText: 'Enter Password'),
                  ),
                  ElevatedButton(
                      onPressed: collectData, child: const Text("Sign Up"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
