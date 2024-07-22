import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReturnForm extends StatefulWidget {
  const ReturnForm({Key? key}) : super(key: key);

  @override
  State<ReturnForm> createState() => _ReturnFormState();
}

class _ReturnFormState extends State<ReturnForm> {
  final _shopNameController = TextEditingController();
  List<ReturnItem> returnItems = [ReturnItem()]; // Ensure one item is always present
  final List<String> _shopOptions = ["Shop 1", "Shop 2", "Shop 3", "Shop 4", "Shop 5", "Shop 6"];
  final List<String> _productOptions = ["Item A", "Item B", "Item C"];
  final List<String> _reasonOptions = ["DAMAGE", "EXPIRE", "COMPLAINT", "CLOSED", "OTHERS"];
  String? _selectedShop;

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
    final lightColorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Text(
                _getCurrentDate(),
                style: const TextStyle(
                  fontFamily: "avenir next",
                  fontSize: 16,
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
            // Center the heading
            Center(
              child: Text(
                'Return Form',
                style: TextStyle(
                  fontFamily: "avenir next",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: lightColorScheme.primary,
                ),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "Select Shop",
                filled: true,
                fillColor: lightColorScheme.secondary.withOpacity(0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              value: _selectedShop,
              items: _shopOptions
                  .map((shop) => DropdownMenuItem(
                value: shop,
                child: Text(shop),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedShop = value;
                });
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: returnItems.length,
                itemBuilder: (context, index) {
                  return returnItemCard(index);
                },
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: IconButton(
                icon: Icon(Icons.add_circle, color: lightColorScheme.primary, size: 50),
                onPressed: _addReturnItem,
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
                  backgroundColor: lightColorScheme.primary,
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

  Widget returnItemCard(int index) {
    final lightColorScheme = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    ' ${index + 1}',
                    style: TextStyle(
                      fontFamily: "avenir next",
                      fontSize: 16,
                      color: lightColorScheme.primary,
                    ),
                  ),
                ),
                if (returnItems.length > 1) // Only show delete button if there's more than one item
                  IconButton(
                    icon: Icon(Icons.delete, color: lightColorScheme.error),
                    onPressed: () => _removeReturnItem(index),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "Select Item",
                filled: true,
                fillColor: lightColorScheme.secondary.withOpacity(0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              value: returnItems[index].product,
              items: _productOptions
                  .map((product) => DropdownMenuItem(
                value: product,
                child: Text(product),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  returnItems[index].product = value;
                });
              },
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                labelText: 'Quantity',
                filled: true,
                fillColor: lightColorScheme.secondary.withOpacity(0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                returnItems[index].quantity = value;
              },
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "Reason",
                filled: true,
                fillColor: lightColorScheme.secondary.withOpacity(0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              value: returnItems[index].reason,
              items: _reasonOptions
                  .map((reason) => DropdownMenuItem(
                value: reason,
                child: Text(reason),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  returnItems[index].reason = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ReturnItem {
  String? product;
  String? quantity;
  String? reason;

  ReturnItem({this.product, this.quantity, this.reason});
}
