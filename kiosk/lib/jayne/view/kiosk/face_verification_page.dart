import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image_picker/image_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:kiosk/jayne/router/routes_name.dart';

class FaceVerificationPage extends StatefulWidget {
  const FaceVerificationPage({super.key});

  @override
  State<FaceVerificationPage> createState() => _FaceVerificationPageState();
}

class _FaceVerificationPageState extends State<FaceVerificationPage> {
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

    if (!mounted) return; // check widget still there for use context.goNamed()

    setState(() {
      _faces = faces;
      _isProcessing = false;
    });

    // Auto verify if faces are found and navigate
    if (_faces != null && _faces!.isNotEmpty) {
      context.goNamed(RouteName.verificationSuccessPage.name);
    }
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
        title: Text("jayne.face_detection_page.face_detection".tr()),
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
            if (_isProcessing)
              const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
