import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import the intl package

class RecoveryForm extends StatefulWidget {
  @override
  _RecoveryFormState createState() => _RecoveryFormState();
}

class _RecoveryFormState extends State<RecoveryForm> {
  final _currentBalanceController = TextEditingController();
  final _cashRecoveryController = TextEditingController();
  final _netBalanceController = TextEditingController();
  String? _selectedShop;
  List<String> _shops = ["Shop A", "Shop B", "Shop C"];

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

  @override
  Widget build(BuildContext context) {
    final lightColorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Center(
                child: Text(
                  "Recovery",
                  style: TextStyle(
                    fontFamily: "avenir next",
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: lightColorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                _getCurrentDate(),
                style: TextStyle(
                  fontFamily: "avenir next",
                  fontSize: 16,
                  color: lightColorScheme.primary,
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Shop Name',
                  hintText: 'Select shop',
                  labelStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.2),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.black, width: 1),
                  ),
                ),
                value: _selectedShop,
                items: _shops.map((shop) {
                  return DropdownMenuItem(
                    value: shop,
                    child: Text(
                      shop,
                      style: const TextStyle(
                        fontFamily: "avenir next",
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
                  fontFamily: "avenir next",
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              buildTextField("Current Balance", _currentBalanceController),
              const SizedBox(height: 24),
              Text(
                "Previous Payment History",
                style: TextStyle(
                  fontFamily: "avenir next",
                  fontSize: 20,
                  color: lightColorScheme.primary,
                ),
              ),
              const SizedBox(height: 16),
              buildTextField("Cash Recovery", _cashRecoveryController),
              const SizedBox(height: 16),
              buildTextField("Net Balance", _netBalanceController),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle submit action
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      fontFamily: "avenir next",
                      fontSize: 16,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    backgroundColor: lightColorScheme.primary,
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
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black, width: 1),
        ),
      ),
      style: const TextStyle(
        fontFamily: "avenir next",
        fontSize: 10,
      ),
    );
  }
}

