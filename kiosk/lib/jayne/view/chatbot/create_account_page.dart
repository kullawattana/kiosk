import 'package:flutter/material.dart';

class CreateYourAccount extends StatefulWidget {
  const CreateYourAccount({super.key});

  @override
  State<CreateYourAccount> createState() => _CreateYourAccountState();
}

class _CreateYourAccountState extends State<CreateYourAccount> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Create your Account"),
        Text("Full Name"),
        Text("Enter Your Email"),
        Text("Password"),
        Text("Register"),
        Text("Already Have An Account? Sign In"),
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
