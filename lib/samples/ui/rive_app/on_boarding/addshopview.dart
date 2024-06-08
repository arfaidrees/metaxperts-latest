import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/ui/rive_app/theme.dart';
import 'package:flutter_samples/samples/ui/rive_app/assets.dart' as app_assets;
import 'package:rive/rive.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../themee/theme.dart';

class AddShop extends StatefulWidget {
  const AddShop({Key? key, this.closeModal}) : super(key: key);

  final Function? closeModal;

  @override
  _AddShopState createState() => _AddShopState();
}

class _AddShopState extends State<AddShop> {
  File? _imageFile; // Variable to store the picked image file

  // Function to pick an image from the camera
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
            imageFilter: ImageFilter.blur(sigmaX: 50, sigmaY:50 ),
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
          // Container for shop details form
          Center(
            child: Container(
              width: 320,
              height: 620,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Title
                      const SizedBox(height: 16),
                      Text(
                        "Shop Details",
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
                      TextField(
                        style: TextStyle(fontSize: 12), // Reduced font size
                        decoration: InputDecoration(
                          labelText: "Shop Address",
                          labelStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
                          filled: true,
                          fillColor: Colors.transparent,
                          prefixIcon: Icon(Icons.location_on, color: lightColorScheme.primary),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(70),
                            borderSide: const BorderSide(color: Colors.black, width: 1),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        style: TextStyle(fontSize: 12),
                        decoration: InputDecoration(
                          labelText: "City",
                          labelStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
                          filled: true,
                          fillColor: Colors.transparent,
                          prefixIcon: Icon(Icons.location_city, color: lightColorScheme.primary),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(70),
                            borderSide: const BorderSide(color: Colors.black, width: 1),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        style: TextStyle(fontSize: 12),
                        decoration: InputDecoration(
                          labelText: "Owner Name",
                          labelStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
                          filled: true,
                          fillColor: Colors.transparent,
                          prefixIcon: Icon(Icons.person, color: lightColorScheme.primary),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(70),
                            borderSide: const BorderSide(color: Colors.black, width: 1),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        style: TextStyle(fontSize: 12),
                        decoration: InputDecoration(
                          labelText: "Owner CNIC",
                          labelStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
                          filled: true,
                          fillColor: Colors.transparent,
                          prefixIcon: Icon(Icons.credit_card, color: lightColorScheme.primary),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(70),
                            borderSide: const BorderSide(color: Colors.black, width: 1),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        style: TextStyle(fontSize: 12),
                        decoration: InputDecoration(
                          labelText: "Phone Number",
                          labelStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
                          filled: true,
                          fillColor: Colors.transparent,
                          prefixIcon: Icon(Icons.phone, color: lightColorScheme.primary),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(70),
                            borderSide: const BorderSide(color: Colors.black, width: 1),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        style: TextStyle(fontSize: 12),
                        decoration: InputDecoration(
                          labelText: "Alternative Phone Number",
                          labelStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
                          filled: true,
                          fillColor: Colors.transparent,
                          prefixIcon: Icon(Icons.phone_android, color: lightColorScheme.primary),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(70),
                            borderSide: const BorderSide(color: Colors.black, width: 1),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Image picker
                      if (_imageFile != null)
                        Container(
                          width: 280,
                          height: 280,
                          decoration: BoxDecoration(
                            border: Border.all(color: lightColorScheme.primary, width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: lightColorScheme.primary.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            child: Image.file(_imageFile!, fit: BoxFit.cover),
                          ),
                        ),
                      const SizedBox(height: 16),
                      // Button to pick image
                      IconButton(
                        icon: Icon(Icons.camera_alt, color: lightColorScheme.primary),
                        onPressed: _pickImage,
                        iconSize: 30,
                      ),
                      const SizedBox(height: 16),
                      // Button to save shop details
                      CupertinoButton(
                        color: lightColorScheme.primary,
                        borderRadius: BorderRadius.circular(35),
                        onPressed: () {},
                        child: const Text('Save'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
