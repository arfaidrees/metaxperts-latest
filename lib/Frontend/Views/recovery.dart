import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Components/theme.dart';

class Recovery extends StatefulWidget {
  const Recovery({super.key});

  @override
  _RecoveryState createState() => _RecoveryState();
}

class _RecoveryState extends State<Recovery> {
  final _currentBalanceController = TextEditingController();
  final _cashRecoveryController = TextEditingController();
  final _netBalanceController = TextEditingController();
  String? _selectedShop;
  final List<String> _shops = ["Shop A", "Shop B", "Shop C"];

  String _getCurrentDate() {
    return DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  @override
  void dispose() {
    _currentBalanceController.dispose();
    _cashRecoveryController.dispose();
    _netBalanceController.dispose();
    super.dispose();
  }

  InputDecoration buildInputDecoration(String labelText) {
    return InputDecoration(
      hintText: labelText,
      hintStyle: TextStyle(
        color: Colors.grey.withOpacity(0.5),
        fontSize: 14.0,
      ),
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
          'Recovery',
          style: TextStyle(
            fontFamily: 'Avenir Next',
            fontSize: 17,
            color: RiveAppTheme.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text(
                _getCurrentDate(),
                style: TextStyle(
                  fontFamily: 'Avenir Next',
                  fontSize: 12,
                  color: RiveAppTheme.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0), // Horizontal padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<String>(
                decoration: buildInputDecoration('Select Shop Name'),
                value: _selectedShop,
                items: _shops.map((shop) {
                  return DropdownMenuItem(
                    value: shop,
                    child: Text(
                      shop,
                      style: const TextStyle(
                        fontFamily: "Avenir Next",
                        fontSize: 14,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedShop = value;
                  });
                },
                style: const TextStyle(
                  fontFamily: "Avenir Next",
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 7),
              buildTextField("Current Balance", _currentBalanceController),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0), // Horizontal padding
                margin: const EdgeInsets.only(bottom: 20.0), // Bottom margin
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Previous Payment History",
                      style: TextStyle(
                        fontFamily: "Avenir Next",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: RiveAppTheme.purple,
                      ),
                    ),
                    const SizedBox(height: 7),
                    // Add your previous payment history content here
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Cash Recovery
              const Text(
                "Cash Recovery",
                style: TextStyle(
                  fontFamily: "Avenir Next",
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: RiveAppTheme.purple,
                ),
              ),
              const SizedBox(height: 7),
              buildTextField("API", _cashRecoveryController),
              const SizedBox(height: 20),
              // Net Balance
              const Text(
                "Net Balance",
                style: TextStyle(
                  fontFamily: "Avenir Next",
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: RiveAppTheme.purple,
                ),
              ),
              const SizedBox(height: 7),
              buildTextField("API", _netBalanceController),
              const SizedBox(height: 20),
              Center(
                child: TextButton(
                  onPressed: () {
                    // Handle submit action
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(RiveAppTheme.purple),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontFamily: "Avenir Next",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: buildInputDecoration(label),
      style: const TextStyle(
        fontFamily: "Avenir Next",
        fontSize: 14,
      ),
    );
  }
}
