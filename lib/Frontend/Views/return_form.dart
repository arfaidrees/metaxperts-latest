import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Components/theme.dart';

class ReturnForm extends StatefulWidget {
  const ReturnForm({Key? key}) : super(key: key);

  @override
  State<ReturnForm> createState() => _ReturnFormState();
}

class _ReturnFormState extends State<ReturnForm> {
  final _shopNameController = TextEditingController();
  List<ReturnItem> returnItems = [ReturnItem()];
  final List<String> _shopOptions = ["Shop 1", "Shop 2", "Shop 3", "Shop 4", "Shop 5", "Shop 6"];
  final List<String> _productOptions = ["Item A", "Item B", "Item C"];
  final List<String> _reasonOptions = ["DAMAGE", "EXPIRE", "COMPLAINT", "CLOSED", "OTHERS"];
  String? _selectedShop;

  // Define icons for each dropdown option
  final Map<String, IconData> _shopIcons = {
    "Shop 1": Icons.store,
    "Shop 2": Icons.store_mall_directory,
    "Shop 3": Icons.shopping_bag,
    "Shop 4": Icons.shop,
    "Shop 5": Icons.storefront,
    "Shop 6": Icons.local_convenience_store,
  };

  final Map<String, IconData> _productIcons = {
    "Item A": Icons.production_quantity_limits,
    "Item B": Icons.shopping_cart,
    "Item C": Icons.checkroom,
  };

  final Map<String, IconData> _reasonIcons = {
    "DAMAGE": Icons.warning,
    "EXPIRE": Icons.timer_off,
    "COMPLAINT": Icons.feedback,
    "CLOSED": Icons.cancel,
    "OTHERS": Icons.help_outline,
  };

  @override
  void dispose() {
    _shopNameController.dispose();
    super.dispose();
  }

  void _addReturnItem() {
    setState(() {
      returnItems.add(ReturnItem());
    });
  }

  void _removeReturnItem(int index) {
    if (returnItems.length > 1) {
      setState(() {
        returnItems.removeAt(index);
      });
    }
  }

  String _getCurrentDate() {
    return DateFormat('yyyy-MM-dd').format(DateTime.now());
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
        title: Text(
          'Return Form',
          style: TextStyle(
            fontFamily: 'Avenir Next',
            fontSize: 17,
            color: RiveAppTheme.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Text(
                _getCurrentDate(),
                style: TextStyle(
                  fontFamily: "Avenir Next",
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: RiveAppTheme.purple,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildLineInputDropdown(
              label: "Select Shop",
              value: _selectedShop,
              items: _shopOptions,
              onChanged: (value) {
                setState(() {
                  _selectedShop = value;
                });
              },
              icons: _shopIcons,
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: returnItems.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      returnItemCard(index),
                      if (index == returnItems.length - 1) // Only show the "+" button below the last card
                        const SizedBox(height: 10),
                      if (index == returnItems.length - 1)
                        Center(
                          child: IconButton(
                            icon: Icon(Icons.add_circle, color: RiveAppTheme.purple, size: 40),
                            onPressed: _addReturnItem,
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle submit action
                },
                child: const Text('Submit'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: RiveAppTheme.purple,
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLineInputDropdown({
    required String label,
    String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    required Map<String, IconData> icons,
  }) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: RiveAppTheme.purple),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: RiveAppTheme.purple, width: 1.0),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: RiveAppTheme.purple, width: 1.0),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      ),
      value: value,
      items: items.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Row(
            children: [
              Icon(icons[item], color: RiveAppTheme.purple), // Use mapped icon
              const SizedBox(width: 8),
              Text(item, style: TextStyle(color: RiveAppTheme.purple)),
            ],
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }

  Widget returnItemCard(int index) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    ' ${index + 1}',
                    style: TextStyle(
                      fontFamily: "Avenir Next",
                      fontSize: 14,
                      color: RiveAppTheme.purple,
                    ),
                  ),
                ),
                if (returnItems.length > 1)
                  IconButton(
                    icon: Icon(Icons.delete, color: RiveAppTheme.purple),
                    onPressed: () => _removeReturnItem(index),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            _buildLineInputDropdown(
              label: "Select Item",
              value: returnItems[index].product,
              items: _productOptions,
              onChanged: (value) {
                setState(() {
                  returnItems[index].product = value;
                });
              },
              icons: _productIcons,
            ),
            const SizedBox(height: 4),
            _buildLineInputDropdown(
              label: "Reason",
              value: returnItems[index].reason,
              items: _reasonOptions,
              onChanged: (value) {
                setState(() {
                  returnItems[index].reason = value;
                });
              },
              icons: _reasonIcons,
            ),
            const SizedBox(height: 4),
            _buildLineInputTextField(
              label: 'Quantity',
              onChanged: (value) {
                returnItems[index].quantity = value;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLineInputTextField({
    required String label,
    required ValueChanged<String> onChanged,
  }) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: RiveAppTheme.purple),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: RiveAppTheme.purple, width: 1.0),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: RiveAppTheme.purple, width: 1.0),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14),
      ),
      keyboardType: TextInputType.number,
      onChanged: onChanged,
    );
  }
}

class ReturnItem {
  String? product;
  String? quantity;
  String? reason;

  ReturnItem({this.product, this.quantity, this.reason});
}
