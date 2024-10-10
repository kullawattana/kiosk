import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image_picker/image_picker.dart';

class FaceDetectionPage extends StatefulWidget {
  const FaceDetectionPage({super.key});

  @override
  _FaceDetectionPageState createState() => _FaceDetectionPageState();
}

class _FaceDetectionPageState extends State<FaceDetectionPage> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  final FaceDetector _faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      enableContours: true,
      enableClassification: true,
    ),
  );

  List<Face>? _faces;
  bool _isProcessing = false;

  Future<void> _getImageAndDetectFaces() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return;

    setState(() {
      _isProcessing = true;
      _imageFile = File(pickedFile.path);
    });

    final inputImage = InputImage.fromFile(_imageFile!);

    final faces = await _faceDetector.processImage(inputImage);

    setState(() {
      _faces = faces;
      _isProcessing = false;
    });
  }

  @override
  void dispose() {
    _faceDetector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Face Detection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_imageFile != null)
              Image.file(_imageFile!),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _getImageAndDetectFaces,
              child: const Text('Pick Image and Detect Faces'),
            ),
            if (_faces != null)
              Text('Found ${_faces!.length} face(s)'),
            if (_isProcessing)
              const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
