import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'order_booking_form.dart';  // Import the new screen

class ShopVisit extends StatefulWidget {
  const ShopVisit({Key? key, this.closeModal}) : super(key: key);

  final Function? closeModal;

  @override
  _ShopVisitState createState() => _ShopVisitState();
}

class _ShopVisitState extends State<ShopVisit> {
  File? _imageFile;

  bool _walkthroughPerformed = false;
  bool _planogramUpdated = false;
  bool _shelfTagsChecked = false;
  bool _expiryDateChecked = false;
  String _feedback = '';

  List<Map<String, String>> _products = [
    {"name": "Product 1", "quantity": "0"},
    {"name": "Product 2", "quantity": "0"},
    {"name": "Product 3", "quantity": "0"},
    {"name": "Product 4", "quantity": "0"},
    {"name": "Product 5", "quantity": "0"},
  ];

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
    final lightColorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 27),
              Text(
                "Shop Visit",
                style: TextStyle(
                  fontFamily: "avenir next",
                  fontSize: 28,
                  color: lightColorScheme.primary,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: TextStyle(fontSize: 12, fontFamily: "avenir next"),
                  decoration: InputDecoration(
                    labelText: "Shop Name",
                    labelStyle: TextStyle(color: Colors.black.withOpacity(0.4), fontFamily: "avenir next"),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.2),
                    prefixIcon: Icon(Icons.store, color: lightColorScheme.primary),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: TextStyle(fontSize: 12, fontFamily: "avenir next"),
                  decoration: InputDecoration(
                    labelText: "Shop Address",
                    labelStyle: TextStyle(color: Colors.black.withOpacity(0.4), fontFamily: "avenir next"),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.2),
                    prefixIcon: Icon(Icons.location_on, color: lightColorScheme.primary),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: TextStyle(fontSize: 12, fontFamily: "avenir next"),
                  decoration: InputDecoration(
                    labelText: "Booker Name",
                    labelStyle: TextStyle(color: Colors.black.withOpacity(0.4), fontFamily: "avenir next"),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.2),
                    prefixIcon: Icon(Icons.person, color: lightColorScheme.primary),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: TextStyle(fontSize: 12, fontFamily: "avenir next"),
                  decoration: InputDecoration(
                    labelText: "Brand",
                    labelStyle: TextStyle(color: Colors.black.withOpacity(0.3), fontFamily: "avenir next"),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.2),
                    prefixIcon: Icon(Icons.business_center, color: lightColorScheme.primary),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  width: 600, // Adjust the width as needed
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: DataTable(
                      columns: const [
                        DataColumn(
                          label: Text('Products', style: TextStyle(fontFamily: "avenir next")),
                        ),
                        DataColumn(
                          label: Text('Quantity', style: TextStyle(fontFamily: "avenir next")),
                        ),
                      ],
                      rows: _products.map((product) {
                        return DataRow(
                          cells: [
                            DataCell(
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 2), // Reduced padding
                                child: TextFormField(
                                  initialValue: product["name"],
                                  style: TextStyle(fontFamily: "avenir next"),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      product["name"] = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                            DataCell(
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 2), // Reduced padding
                                child: TextFormField(
                                  initialValue: product["quantity"],
                                  style: TextStyle(fontFamily: "avenir next"),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      product["quantity"] = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              CheckboxListTile(
                title: Text("Performed Store Walkthrough", style: TextStyle(fontSize: 14, fontFamily: "avenir next")),
                value: _walkthroughPerformed,
                onChanged: (bool? value) {
                  setState(() {
                    _walkthroughPerformed = value!;
                  });
                },
                activeColor: lightColorScheme.primary,
                controlAffinity: ListTileControlAffinity.leading,
              ),
              CheckboxListTile(
                title: Text("Update Store Planogram", style: TextStyle(fontSize: 14, fontFamily: "avenir next")),
                value: _planogramUpdated,
                onChanged: (bool? value) {
                  setState(() {
                    _planogramUpdated = value!;
                  });
                },
                activeColor: lightColorScheme.primary,
                controlAffinity: ListTileControlAffinity.leading,
              ),
              CheckboxListTile(
                title: Text("Shelf Tags and Price Signage Check", style: TextStyle(fontSize: 14, fontFamily: "avenir next")),
                value: _shelfTagsChecked,
                onChanged: (bool? value) {
                  setState(() {
                    _shelfTagsChecked = value!;
                  });
                },
                activeColor: lightColorScheme.primary,
                controlAffinity: ListTileControlAffinity.leading,
              ),
              CheckboxListTile(
                title: Text("Expiry Date on Product reviewed", style: TextStyle(fontSize: 14, fontFamily: "avenir next")),
                value: _expiryDateChecked,
                onChanged: (bool? value) {
                  setState(() {
                    _expiryDateChecked = value!;
                  });
                },
                activeColor: lightColorScheme.primary,
                controlAffinity: ListTileControlAffinity.leading,
              ),
              const SizedBox(height: 8),
              if (_imageFile != null)
                Image.file(
                  _imageFile!,
                  width: 300,
                  height: 300,
                )
              else
                TextButton(
                  child: const Text(
                    "Click to upload shelf image",
                    style: TextStyle(fontFamily: "avenir next", fontSize: 15),
                  ),
                  onPressed: _pickImage,
                ),
              const SizedBox(height: 8),
              Container(
                width: 400,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    maxLines: 3,
                    maxLength: 100,
                    decoration: InputDecoration(
                      hintText: "Feedback (Limit 100 words)",
                      hintStyle: TextStyle(fontFamily: "avenir next"),
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _feedback = value;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      if (widget.closeModal != null) {
                        widget.closeModal!();
                      }
                      // Navigate to the OrderBookingForm screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const OrderBookingForm()),
                      );
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(lightColorScheme.primary),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                    child: Text(
                      '+ Order Booking Form',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontFamily: "avenir next",
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontFamily: "avenir next",
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
