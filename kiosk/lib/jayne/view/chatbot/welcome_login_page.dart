import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Welcome to"),
        Text("Nong Jayne"),
        Text("Log in"),
        Text("Sign up"),
        Text("Continue With Accounts"),
        Row(
          children: [
            Text("Google"),
            Text("Facebook"),
          ],
        )
      ],
    );
  }
}
