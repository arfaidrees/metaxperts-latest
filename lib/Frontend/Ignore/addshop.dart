/*import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_samples/samples/ui/rive_app/components/theme2.dart';

class AddShopView extends StatefulWidget {
  const AddShopView({Key? key, this.closeModal}) : super(key: key);

  final Function? closeModal;

  @override
  State<AddShopView> createState() => _AddShopViewState();
}

class _AddShopViewState extends State<AddShopView> {
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
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        if (kDebugMode) {
          print('No image selected.');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  constraints: const BoxConstraints(maxWidth: 600),
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [Colors.white.withOpacity(0.8), Colors.white10],
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(29),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: RiveAppTheme.shadow.withOpacity(0.3),
                          offset: const Offset(0, 3),
                          blurRadius: 5,
                        ),
                        BoxShadow(
                          color: RiveAppTheme.shadow.withOpacity(0.3),
                          offset: const Offset(0, 30),
                          blurRadius: 30,
                        ),
                      ],
                      color: CupertinoColors.secondarySystemBackground,
                      backgroundBlendMode: BlendMode.luminosity,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Shop Details",
                          style: TextStyle(fontFamily: "Poppins", fontSize: 34),
                        ),
                        const SizedBox(height: 24),
                        buildTextField("Shop Name", _shopNameController, Icons.store),
                        const SizedBox(height: 24),
                        buildTextField("Shop Address", _shopAddressController, Icons.location_on),
                        const SizedBox(height: 24),
                        buildTextField("City", _shopEmailController, Icons.place_outlined),
                        const SizedBox(height: 24),
                        buildTextField("Owner Name", _shopPhoneController, Icons.person),
                        const SizedBox(height: 24),
                        buildTextField("Owner CNIC", _shopWebsiteController, Icons.credit_card),
                        const SizedBox(height: 24),
                        buildTextField("Phone Number", _shopDescriptionController, Icons.phone),
                        const SizedBox(height: 24),
                        buildTextField("Alternative Phone Number", _shopCategoryController, Icons.phone_iphone),
                        const SizedBox(height: 24),
                        _image != null
                            ? Image.file(
                          _image!,
                          height: 100,
                          width: 100,
                        )
                            : Container(),
                        const SizedBox(height: 24),
                        CupertinoButton(
                          color: CupertinoColors.secondaryLabel,
                          onPressed: _getImageFromCamera,
                          child: const Text('Take Picture'),
                        ),
                        const SizedBox(height: 16),
                        CupertinoButton(
                          color: CupertinoColors.secondaryLabel,
                          onPressed: () {
                          },
                          child: const Text('Save'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: CupertinoColors.secondaryLabel,
            fontFamily: "Inter",
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: CupertinoColors.secondaryLabel),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black.withOpacity(0.1)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black.withOpacity(0.1)),
            ),
            contentPadding: const EdgeInsets.all(15),
          ),
        ),
      ],
    );
  }
}*/
