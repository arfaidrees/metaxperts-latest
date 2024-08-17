import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import '../Components/theme.dart';

class AddShopScreen extends StatefulWidget {
  const AddShopScreen({Key? key, this.closeModal}) : super(key: key);

  final Function? closeModal;

  @override
  State<AddShopScreen> createState() => _AddShopScreenState();
}

class _AddShopScreenState extends State<AddShopScreen> {
  final _shopNameController = TextEditingController();
  final _shopAddressController = TextEditingController();
  final _shopEmailController = TextEditingController();
  final _shopPhoneController = TextEditingController();
  final _shopWebsiteController = TextEditingController();
  final _shopDescriptionController = TextEditingController();
  final _shopCategoryController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
          'Add Shop',
          style: TextStyle(
            fontFamily: 'Avenir Next',
            fontSize: 17,
            color: RiveAppTheme.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _shopNameController,
                  decoration: buildInputDecoration('Shop Name', Icons.store),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Shop Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 7.0),
                TextFormField(
                  controller: _shopAddressController,
                  decoration: buildInputDecoration('Shop Address', Icons.location_on),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Shop Address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 7.0),
                TextFormField(
                  controller: _shopEmailController,
                  decoration: buildInputDecoration('City', Icons.location_city),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter City';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 7.0),
                TextFormField(
                  controller: _shopPhoneController,
                  decoration: buildInputDecoration('Owner Name', Icons.person),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Owner Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 7.0),
                TextFormField(
                  controller: _shopWebsiteController,
                  decoration: buildInputDecoration('Owner CNIC', Icons.credit_card),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Owner CNIC';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 7.0),
                TextFormField(
                  controller: _shopDescriptionController,
                  keyboardType: TextInputType.phone,
                  decoration: buildInputDecoration('Phone Number', Icons.phone),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Phone Number';
                    } else if (value.length != 11 || !RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Please enter a valid 11-digit phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 7.0),
                TextFormField(
                  controller: _shopCategoryController,
                  keyboardType: TextInputType.phone,
                  decoration: buildInputDecoration('Alternative Phone Number', Icons.phone_android),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Alternative Phone Number';
                    } else if (value.length != 11 || !RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Please enter a valid 11-digit alternative phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30.0),

                SizedBox(
                  width: double.infinity,
                  child: SizedBox(
                    width: 50,
                    height: 40,

                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Processing Data'),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: RiveAppTheme.purple,
                        padding: EdgeInsets.zero,
                        textStyle: const TextStyle(fontSize: 14),
                      ),
                      child: const Text('Save'),
                    ),
                  ),
                ),
                const SizedBox(height: 9.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
