
/*import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/ui/rive_app/components/assets.dart' as app_assets;
import 'package:rive/rive.dart';
import 'package:image_picker/image_picker.dart';
import 'theme2.dart';*/

/*class AnimationSample extends StatefulWidget {
  const AnimationSample({Key? key, this.closeModal}) : super(key: key);

  final Function? closeModal;

  @override
  _AnimationSampleState createState() => _AnimationSampleState();
}

class _AnimationSampleState extends State<AnimationSample> {
  File? _imageFile;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFBBA6FF).withOpacity(0.3),
      body: Stack(
        children: [
          // Background image with blur effect
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
            child: Center(
              child: OverflowBox(
                maxWidth: double.infinity,
                child: Transform.translate(
                  offset: const Offset(200, 100),
                  child: Image.asset(app_assets.doodle, fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          // Rive animation
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: const RiveAnimation.asset(app_assets.shapesRiv),
          ),
          // Content
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Title
                  const SizedBox(height: 16),
                  Text(
                    "Recovery Form",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 34,
                      color: lightColorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Text fields for shop details
                  TextField(
                    style: TextStyle(fontSize: 12),
                    decoration: InputDecoration(
                      labelText: "Shop Name",
                      labelStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
                      filled: true,
                      fillColor: Colors.transparent,
                      prefixIcon: Icon(Icons.store, color: lightColorScheme.primary),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(70),
                        borderSide: const BorderSide(color: Colors.black, width: 1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  CupertinoButton(
                    color: lightColorScheme.primary,
                    borderRadius: BorderRadius.circular(35),
                    onPressed: () {},
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}*/

