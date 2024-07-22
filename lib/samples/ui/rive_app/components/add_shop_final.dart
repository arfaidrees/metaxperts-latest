import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddShopFinal extends StatefulWidget {
  const AddShopFinal({Key? key, this.closeModal}) : super(key: key);

  final Function? closeModal;

  @override
  State<AddShopFinal> createState() => _AddShopFinalState();
}

class _AddShopFinalState extends State<AddShopFinal> {
  final _shopNameController = TextEditingController();
  final _shopAddressController = TextEditingController();
  final _shopEmailController = TextEditingController();
  final _shopPhoneController = TextEditingController();
  final _shopWebsiteController = TextEditingController();
  final _shopDescriptionController = TextEditingController();
  final _shopCategoryController = TextEditingController();

  File? _image; // Variable to store the captured image

  @override
  void dispose() {
    _shopNameController.dispose();
    _shopAddressController.dispose();
    _shopEmailController.dispose();
    _shopPhoneController.dispose();
    _shopWebsiteController.dispose();
    _shopDescriptionController.dispose();
    _shopCategoryController.dispose();
    super.dispose();
  }

  // Function to capture image from camera
  Future<void> _getImageFromCamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final lightColorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Increased padding for more space around elements
          child: Column(
            children: [
              const SizedBox(height: 16), // Space above the heading
              Text(
                "Add Shop",
                style: TextStyle(
                  fontFamily: "avenir next",
                  fontSize: 30, // Increased heading size
                  color: lightColorScheme.primary,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
                child: Icon(Icons.store, size: 50, color: Colors.grey[600]),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent, // Make the container invisible
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0), // Indent fields
                  child: Column(
                    children: [
                      buildTextField("Shop Name", _shopNameController, Icons.store),
                      const SizedBox(height: 8),
                      buildTextField("Shop Address", _shopAddressController, Icons.location_on),
                      const SizedBox(height: 8),
                      buildTextField("City", _shopEmailController, Icons.location_city),
                      const SizedBox(height: 8),
                      buildTextField("Owner Name", _shopPhoneController, Icons.person),
                      const SizedBox(height: 8),
                      buildTextField("Owner CNIC", _shopWebsiteController, Icons.credit_card),
                      const SizedBox(height: 8),
                      buildTextField("Phone Number", _shopDescriptionController, Icons.phone),
                      const SizedBox(height: 8),
                      buildTextField("Alternative Phone Number", _shopCategoryController, Icons.phone),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              if (_image != null)
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    border: Border.all(color: lightColorScheme.primary, width: 2), // Add a border
                    boxShadow: [
                      BoxShadow(
                        color: lightColorScheme.primary.withOpacity(0.2), // Add shades
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    shape: BoxShape.circle, // Make the container circular
                  ),
                  child: ClipOval(
                    child: Image.file(_image!, fit: BoxFit.cover),
                  ),
                ),
              const SizedBox(height: 16),
              IconButton(
                icon: Icon(Icons.camera_alt, color: lightColorScheme.primary),
                onPressed: _getImageFromCamera,
                iconSize: 20,
              ),
              const SizedBox(height: 16),
              CupertinoButton(
                child: Text('Save'),
                color: CupertinoColors.systemBlue,
                onPressed: () {
                  // Handle save action
                },
              ),
              const SizedBox(height: 8),
              CupertinoButton(
                child: Text('Cancel'),
                color: CupertinoColors.systemRed,
                onPressed: () {
                  if (widget.closeModal != null) {
                    widget.closeModal!();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller, IconData icon) {
    final lightColorScheme = Theme.of(context).colorScheme;

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8), // Changed from 70 to 8 for less rounded corners
          borderSide: const BorderSide(color: Colors.black, width: 1),
        ),
        prefixIcon: Icon(icon, color: lightColorScheme.primary), // Add the icon here
      ),
      style: TextStyle(
        fontFamily: "avenir next", // Applied font family to text field content
        fontSize: 14, // Decreased text field size
      ),
    );
  }
}
