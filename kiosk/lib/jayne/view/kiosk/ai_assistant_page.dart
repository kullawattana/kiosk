import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_tts/flutter_tts.dart';

class AIAssistantPage extends StatefulWidget {
  const AIAssistantPage({super.key});

  @override
  State<AIAssistantPage> createState() => _AIAssistantPageState();
}

class _AIAssistantPageState extends State<AIAssistantPage> {
  FlutterTts flutterTts = FlutterTts();
  String _textToSpeak = "Hello, welcome to Flutter text to speech example.";

  Future _speak() async {
    //await flutterTts.setLanguage("en-US");
    await flutterTts.setLanguage("th-TH");
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(_textToSpeak);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black.withOpacity(0.5),
        body: Center(
          child: Container(
            width: 300,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.red),
                      onPressed: () {
                        // TODO Close action
                      },
                    ),
                  ],
                ),
                // TODO Avatar and Greeting
                // greetingWidget()
              ],
            ),
          ),
        ),
        bottomNavigationBar: Column(
          children: [
            //TODO TTS
            TextField(
              onChanged: (value) {
                setState(() {
                  _textToSpeak = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Enter text to speak',
                border: OutlineInputBorder(),
              ),
            ),
            //TODO Microphone tap action
            GestureDetector(
              onTap: () {
                // TODO Microphone tap action
              },
              child: const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.mic,
                  size: 36,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 10),
            // "Press to speak" text
            Text(
              'jayne.ai_assistant_page.press_to_speak'.tr(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        )
    );
  }
}

Widget speakingWidget() {
  return Container(
    height: 60,
    width: double.infinity,
    alignment: Alignment.center,
    child: const Icon(
      Icons.graphic_eq,
      color: Colors.white,
      size: 50,
    ), // Placeholder for the voice wave animation
  );
}

Widget greetingWidget() {
  return const Column(
    children: [
      // Greeting message
      CircleAvatar(
        radius: 40,
        backgroundColor: Colors.white,
        child: Icon(Icons.smart_toy, size: 40, color: Colors.blue),
      ),
      SizedBox(height: 10),
      Text(
        'Jayne',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 5),
      Text(
        'greeting_message',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      SizedBox(height: 20),
    ],
  );
}
