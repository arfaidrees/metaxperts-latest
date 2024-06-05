import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/ui/rive_app/theme.dart';
import 'package:flutter_samples/samples/ui/rive_app/assets.dart' as app_assets;
import 'package:rive/rive.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../themee/theme.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key, this.closeModal}) : super(key: key);

  // Close modal callback for any screen that uses this as a modal
  final Function? closeModal;

  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
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
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
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
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: const RiveAnimation.asset(app_assets.shapesRiv),
          ),
          Column(
            children: [
              const SizedBox(height: 90),
              Text(
                "Shop Details",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 34,
                  color: lightColorScheme.primary,
                ),
              ),
              if (_imageFile != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Image.file(_imageFile!, height: 100, width: 100),
                ),
              Expanded(
                child: Center(
                  child: Container(
                    width: 320,
                    height: 520,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 16),
                            TextField(
                              decoration: InputDecoration(
                                labelText: "Shop Name",
                                labelStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: Icon(Icons.store, color: lightColorScheme.primary),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.black, width: 1),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextField(
                              decoration: InputDecoration(
                                labelText: "Shop Address",
                                labelStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: Icon(Icons.location_on, color: lightColorScheme.primary),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.black, width: 1),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextField(
                              decoration: InputDecoration(
                                labelText: "City",
                                labelStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: Icon(Icons.location_city, color: lightColorScheme.primary),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.black, width: 1),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextField(
                              decoration: InputDecoration(
                                labelText: "Owner Name",
                                labelStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: Icon(Icons.person, color: lightColorScheme.primary),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.black, width: 1),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextField(
                              decoration: InputDecoration(
                                labelText: "Owner CNIC",
                                labelStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: Icon(Icons.credit_card, color: lightColorScheme.primary),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.black, width: 1),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextField(
                              decoration: InputDecoration(
                                labelText: "Phone Number",
                                labelStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: Icon(Icons.phone, color: lightColorScheme.primary),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.black, width: 1),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextField(
                              decoration: InputDecoration(
                                labelText: "Alternative Phone Number",
                                labelStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: Icon(Icons.phone_android, color: lightColorScheme.primary),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.black, width: 1),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            IconButton(
                              icon: Icon(Icons.camera_alt, color: lightColorScheme.primary),
                              onPressed: _pickImage,
                              iconSize: 30,
                            ),
                            const SizedBox(height: 16),
                            CupertinoButton(
                              child: Text('Save'),
                              color: lightColorScheme.primary,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
