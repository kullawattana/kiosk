import 'package:flutter/material.dart';

class MainServicePage extends StatefulWidget {
  const MainServicePage({super.key});

  @override
  State<MainServicePage> createState() => _MainServicePageState();
}

class _MainServicePageState extends State<MainServicePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Banner"),
        Row(
          children: [
            Text("Product"),
            Text("Promotion")
          ],
        )
      ],
    );
  }
}
