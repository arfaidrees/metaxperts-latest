import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'order_booking_form.dart';
import '../Components/theme.dart';



class ShopVisitScreen extends StatefulWidget {
  const ShopVisitScreen({Key? key, this.closeModal}) : super(key: key);

  final Function? closeModal;

  @override
  _ShopVisitScreenState createState() => _ShopVisitScreenState();
}

class _ShopVisitScreenState extends State<ShopVisitScreen> {
  File? _imageFile;

  bool _walkthroughPerformed = false;
  bool _planogramUpdated = false;
  bool _shelfTagsChecked = false;
  bool _expiryDateChecked = false;
  String _feedback = '';

  final List<Map<String, String>> _products = [
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

  InputDecoration buildInputDecoration(String labelText, IconData icon) {
    return InputDecoration(
      hintText: labelText,
      hintStyle: TextStyle(
        color: Colors.grey.withOpacity(0.5),
        fontSize: 14.0,
      ),
      prefixIcon: Icon(icon, color: RiveAppTheme.purple),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: RiveAppTheme.purple,
        ),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: RiveAppTheme.purple,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: RiveAppTheme.purple,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Shop Visit',
          style: TextStyle(
              fontFamily: 'Avenir Next',
              fontSize: 17,
              color: RiveAppTheme.purple,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              TextFormField(
                decoration: buildInputDecoration('Shop Name', Icons.store),
              ),
              const SizedBox(height: 7.0),
              TextFormField(
                decoration: buildInputDecoration('Shop Address', Icons.location_on),
              ),
              const SizedBox(height: 7.0),
              TextFormField(
                decoration: buildInputDecoration('City', Icons.person),
              ),
              const SizedBox(height: 7.0),
              TextFormField(
                decoration: buildInputDecoration('Brand', Icons.business_center),
              ),
              const SizedBox(height: 7.0),
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
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: DataTable(
                      columns: const [
                        DataColumn(
                          label: Text(
                            'Products',
                            style: TextStyle(
                              fontFamily: "Avenir Next",
                              color: RiveAppTheme.purple,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Quantity',
                            style: TextStyle(
                              fontFamily: "Avenir Next",
                              color: RiveAppTheme.purple,
                            ),
                          ),
                        ),
                      ],
                      rows: _products.asMap().entries.map((entry) {
                        int index = entry.key;
                        Map<String, String> product = entry.value;
                        return DataRow(
                          color: WidgetStateColor.resolveWith(
                                (states) => index.isEven
                                ? Colors.white
                                : Colors.transparent,
                          ),
                          cells: [
                            DataCell(
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: TextFormField(
                                  initialValue: product["name"],
                                  style: const TextStyle(fontFamily: "Avenir Next"),
                                  decoration: const InputDecoration(
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
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: TextFormField(
                                  initialValue: product["quantity"],
                                  style: const TextStyle(fontFamily: "Avenir Next"),
                                  decoration: const InputDecoration(
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
              const SizedBox(height: 3.0),
              CheckboxListTile(
                title: const Text("Performed Store Walkthrough", style: TextStyle(fontSize: 12, fontFamily: "Avenir Next")),
                value: _walkthroughPerformed,
                onChanged: (bool? value) {
                  setState(() {
                    _walkthroughPerformed = value!;
                  });
                },
                activeColor: RiveAppTheme.purple,
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: const EdgeInsets.symmetric(horizontal: 0), // Reduced padding
              ),
              CheckboxListTile(
                title: const Text("Update Store Planogram", style: TextStyle(fontSize: 12, fontFamily: "Avenir Next")),
                value: _planogramUpdated,
                onChanged: (bool? value) {
                  setState(() {
                    _planogramUpdated = value!;
                  });
                },
                activeColor: RiveAppTheme.purple,
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: const EdgeInsets.symmetric(horizontal: 0), // Reduced padding
              ),
              CheckboxListTile(
                title: const Text("Shelf Tags and Price Signage Check", style: TextStyle(fontSize: 12, fontFamily: "Avenir Next")),
                value: _shelfTagsChecked,
                onChanged: (bool? value) {
                  setState(() {
                    _shelfTagsChecked = value!;
                  });
                },
                activeColor: RiveAppTheme.purple,
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: const EdgeInsets.symmetric(horizontal: 0), // Reduced padding
              ),
              CheckboxListTile(
                title: const Text("Expiry Date on Product reviewed", style: TextStyle(fontSize: 12, fontFamily: "Avenir Next")),
                value: _expiryDateChecked,
                onChanged: (bool? value) {
                  setState(() {
                    _expiryDateChecked = value!;
                  });
                },
                activeColor: RiveAppTheme.purple,
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: const EdgeInsets.symmetric(horizontal: 0), // Reduced padding
              ),
              const SizedBox(height: 7.0),
              if (_imageFile != null)
                Image.file(
                  _imageFile!,
                  width: 400,
                  height: 300,
                )
              else
                IconButton(
                  icon: const Icon(Icons.camera_alt, color: RiveAppTheme.purple, size: 40), // Camera icon
                  onPressed: _pickImage,
                ),
              const SizedBox(height: 7.0),
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
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    maxLines: 3,
                    maxLength: 100,
                    decoration: const InputDecoration(
                      hintText: "Feedback (Limit 100 words)",
                      hintStyle: TextStyle(fontFamily: "Avenir Next"),
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
              const SizedBox(height: 7.0),
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
                      padding: WidgetStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      ),
                      backgroundColor: WidgetStateProperty.all<Color>(RiveAppTheme.purple),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                    child: const Text(
                      '+ Order Booking Form',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontFamily: "Avenir Next",
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
