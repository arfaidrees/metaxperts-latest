import 'package:flutter/material.dart';
import '../Components/theme.dart';

class OrderBookingForm extends StatefulWidget {
  const OrderBookingForm({Key? key, this.closeModal}) : super(key: key);

  final Function? closeModal;

  @override
  _OrderBookingFormState createState() => _OrderBookingFormState();
}

class _OrderBookingFormState extends State<OrderBookingForm> {
  final List<Map<String, String>> _products = [
    {"name": "Product 1", "quantity": "0", "inStock": "Yes", "rate": "0", "amount": "0"},
    {"name": "Product 2", "quantity": "0", "inStock": "Yes", "rate": "0", "amount": "0"},
    {"name": "Product 3", "quantity": "0", "inStock": "Yes", "rate": "0", "amount": "0"},
    {"name": "Product 4", "quantity": "0", "inStock": "Yes", "rate": "0", "amount": "0"},
    {"name": "Product 5", "quantity": "0", "inStock": "Yes", "rate": "0", "amount": "0"},
  ];

  final _formKey = GlobalKey<FormState>();

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

  Widget _buildStyledTextFormField(String label, IconData icon) {
    return TextFormField(
      style: const TextStyle(fontSize: 16, fontFamily: "Avenir Next"),
      decoration: buildInputDecoration(label, icon),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
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
          'Order Booking Form',
          style: TextStyle(
              fontFamily: 'Avenir Next',
              fontSize: 17,
              color: RiveAppTheme.purple,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildStyledTextFormField("Owner Name", Icons.person),
                const SizedBox(height: 7.0),
                _buildStyledTextFormField("Phone", Icons.phone),
                const SizedBox(height: 7.0),
                _buildStyledTextFormField("Brand", Icons.business_center),
                const SizedBox(height: 7.0),
                _buildProductTable(),
                const SizedBox(height: 7.0),
                _buildStyledTextFormField("Total", Icons.attach_money),
                const SizedBox(height: 7.0),
                _buildStyledTextFormField("Credit Limit", Icons.credit_card),
                const SizedBox(height: 7.0),
                _buildStyledTextFormField("Request Delivery", Icons.local_shipping),
                const SizedBox(height: 16.0),
                _buildStyledButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: 800, // Adjust the width as needed
        decoration: BoxDecoration(
          color: Colors.white,
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
                label: Text('Products', style: TextStyle(fontFamily: "Avenir Next")),
              ),
              DataColumn(
                label: Text('Quantity', style: TextStyle(fontFamily: "Avenir Next")),
              ),
              DataColumn(
                label: Text('In Stock', style: TextStyle(fontFamily: "Avenir Next")),
              ),
              DataColumn(
                label: Text('Rate', style: TextStyle(fontFamily: "Avenir Next")),
              ),
              DataColumn(
                label: Text('Amount', style: TextStyle(fontFamily: "Avenir Next")),
              ),
            ],
            rows: _products.map((product) {
              return DataRow(
                cells: [
                  _buildProductCell(product["name"]),
                  _buildProductCell(product["quantity"]),
                  _buildProductCell(product["inStock"]),
                  _buildProductCell(product["rate"]),
                  _buildProductCell(product["amount"]),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  DataCell _buildProductCell(String? initialValue) {
    return DataCell(
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: TextFormField(
          initialValue: initialValue,
          style: const TextStyle(fontFamily: "Avenir Next"),
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          onChanged: (value) {
            setState(() {
              // Update the value in the corresponding product map
            });
          },
        ),
      ),
    );
  }

  Widget _buildStyledButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Processing Data')),
            );
            if (widget.closeModal != null) {
              widget.closeModal!();
            }
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: RiveAppTheme.purple,
          padding: EdgeInsets.zero, // Remove default padding
          textStyle: const TextStyle(fontSize: 14), // Adjust font size
        ),
        child: const Text('Confirm'),
      ),
    );
  }
}
