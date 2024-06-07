import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/ui/rive_app/assets.dart' as app_assets;
import 'package:rive/rive.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../themee/theme.dart';

class ShopVisit extends StatefulWidget {
  const ShopVisit({Key? key, this.closeModal}) : super(key: key);

  final Function? closeModal;

  @override
  _ShopVisitState createState() => _ShopVisitState();
}

class _ShopVisitState extends State<ShopVisit> {
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
            imageFilter: ImageFilter.blur(sigmaX:  50, sigmaY: 50),
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
          Center(
            child: Container(
              width: 320,
              height: 640, // Adjust height as needed
              margin: const EdgeInsets.only(top: 15), // Move the container upwards
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(30),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text(
                        "Shop Visit",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 34,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        width: 240,
                        height: 240,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[300],
                        ),
                        child: Icon(Icons.image, size: 50, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Shop Name",
                          labelStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.2),
                          prefixIcon: Icon(Icons.store, color: lightColorScheme.primary),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(70),
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
                          fillColor: Colors.grey.withOpacity(0.2),
                          prefixIcon: Icon(Icons.location_on, color: lightColorScheme.primary),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(70),
                            borderSide: const BorderSide(color: Colors.black, width: 1),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Booker Name",
                          labelStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.2),
                          prefixIcon: Icon(Icons.person, color: lightColorScheme.primary),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(70),
                            borderSide: const BorderSide(color: Colors.black, width: 1),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Brand",
                          labelStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.2),
                          prefixIcon: Icon(Icons.business_center, color: lightColorScheme.primary),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(70),
                            borderSide: const BorderSide(color: Colors.black, width: 1),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: const [
                            DataColumn(
                              label: Text('Products'),
                            ),
                            DataColumn(
                              label: Text('Quantity'),
                            ),
                          ],
                          rows: const [
                            DataRow(cells: [
                              DataCell(Text('Product 1')),
                              DataCell(Text('10')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Product 2')),
                              DataCell(Text('20')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Product 3')),
                              DataCell(Text('30')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Product 4')),
                              DataCell(Text('40')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Product 5')),
                              DataCell(Text('50')),
                            ]),
                            // Add more rows as needed
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      if (_imageFile != null)
                        Container(
                          width: 280,
                          height: 280,
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
                            child: Image.file(_imageFile!, fit: BoxFit.cover),
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
