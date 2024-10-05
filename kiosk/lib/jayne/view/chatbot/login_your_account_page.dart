import 'package:flutter/material.dart';

class LoginYourAccount extends StatefulWidget {
  const LoginYourAccount({super.key});

  @override
  State<LoginYourAccount> createState() => _LoginYourAccountState();
}

class _LoginYourAccountState extends State<LoginYourAccount> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Login Your Account"),
        Text("Enter Your Email"),
        Text("Password"),
        Text("Forgot Password ?"),
        Text("Login"),
        Text("Create New Account? Sign Up"),
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
