import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class AIAssistantTapToSpeakPage extends StatefulWidget {
  const AIAssistantTapToSpeakPage({super.key});

  @override
  State<AIAssistantTapToSpeakPage> createState() => _AIAssistantTapToSpeakPageState();
}

class _AIAssistantTapToSpeakPageState extends State<AIAssistantTapToSpeakPage> {
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
      backgroundColor: Colors.black.withOpacity(0.5), // Semi-transparent background
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
              // Close button (top-right)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.red),
                    onPressed: () {
                      // Close the assistant
                    },
                  ),
                ],
              ),

              // Avatar and Greeting
              Column(
                children: [
                  // Avatar
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.smart_toy, size: 40, color: Colors.blue),
                  ),
                  const SizedBox(height: 10),
                  // Name
                  const Text(
                    'NongJane',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),

                  // Greeting message
                  const Text(
                    'สวัสดีค่ะ ให้เจนช่วยอะไรดีคะคุณลูกค้า',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Voice Wave Animation
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
                  const SizedBox(height: 20),

                  InkWell(
                    onLongPress: _speak,
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.graphic_eq,
                        color: Colors.white,
                        size: 50,
                      ), // Placeholder for the voice wave animation
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}