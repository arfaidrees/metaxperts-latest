import 'package:flutter/material.dart';

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
                "Order Booking",
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
                  style: const TextStyle(fontSize: 12, fontFamily: "avenir next"),
                  decoration: InputDecoration(
                    labelText: "Owner Name",
                    labelStyle: TextStyle(color: Colors.black.withOpacity(0.4), fontFamily: "avenir next"),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.2),
                    prefixIcon: Icon(Icons.person, color: lightColorScheme.primary),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: const TextStyle(fontSize: 12, fontFamily: "avenir next"),
                  decoration: InputDecoration(
                    labelText: "Phone",
                    labelStyle: TextStyle(color: Colors.black.withOpacity(0.4), fontFamily: "avenir next"),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.2),
                    prefixIcon: Icon(Icons.phone, color: lightColorScheme.primary),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: const TextStyle(fontSize: 12, fontFamily: "avenir next"),
                  decoration: InputDecoration(
                    labelText: "Brand",
                    labelStyle: TextStyle(color: Colors.black.withOpacity(0.4), fontFamily: "avenir next"),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.2),
                    prefixIcon: Icon(Icons.business_center, color: lightColorScheme.primary),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  width: 800, // Adjust the width as needed
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
                          label: Text('Products', style: TextStyle(fontFamily: "avenir next")),
                        ),
                        DataColumn(
                          label: Text('Quantity', style: TextStyle(fontFamily: "avenir next")),
                        ),
                        DataColumn(
                          label: Text('In Stock', style: TextStyle(fontFamily: "avenir next")),
                        ),
                        DataColumn(
                          label: Text('Rate', style: TextStyle(fontFamily: "avenir next")),
                        ),
                        DataColumn(
                          label: Text('Amount', style: TextStyle(fontFamily: "avenir next")),
                        ),
                      ],
                      rows: _products.map((product) {
                        return DataRow(
                          cells: [
                            DataCell(
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 2), // Reduced padding
                                child: TextFormField(
                                  initialValue: product["name"],
                                  style: const TextStyle(fontFamily: "avenir next"),
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
                                padding: const EdgeInsets.symmetric(horizontal: 2), // Reduced padding
                                child: TextFormField(
                                  initialValue: product["quantity"],
                                  style: const TextStyle(fontFamily: "avenir next"),
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
                            DataCell(
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 2), // Reduced padding
                                child: TextFormField(
                                  initialValue: product["inStock"],
                                  style: const TextStyle(fontFamily: "avenir next"),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      product["inStock"] = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                            DataCell(
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 2), // Reduced padding
                                child: TextFormField(
                                  initialValue: product["rate"],
                                  style: const TextStyle(fontFamily: "avenir next"),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      product["rate"] = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                            DataCell(
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 2), // Reduced padding
                                child: TextFormField(
                                  initialValue: product["amount"],
                                  style: const TextStyle(fontFamily: "avenir next"),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      product["amount"] = value;
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: const TextStyle(fontSize: 12, fontFamily: "avenir next"),
                  decoration: InputDecoration(
                    labelText: "Total",
                    labelStyle: TextStyle(color: Colors.black.withOpacity(0.4), fontFamily: "avenir next"),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.2),
                    prefixIcon: Icon(Icons.attach_money, color: lightColorScheme.primary),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: const TextStyle(fontSize: 12, fontFamily: "avenir next"),
                  decoration: InputDecoration(
                    labelText: "Credit Limit",
                    labelStyle: TextStyle(color: Colors.black.withOpacity(0.4), fontFamily: "avenir next"),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.2),
                    prefixIcon: Icon(Icons.credit_card, color: lightColorScheme.primary),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: const TextStyle(fontSize: 12, fontFamily: "avenir next"),
                  decoration: InputDecoration(
                    labelText: "Request Delivery",
                    labelStyle: TextStyle(color: Colors.black.withOpacity(0.4), fontFamily: "avenir next"),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.2),
                    prefixIcon: Icon(Icons.local_shipping, color: lightColorScheme.primary),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  if (widget.closeModal != null) {
                    widget.closeModal!();
                  }
                  // Add confirm functionality here
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(lightColorScheme.primary),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
                child: const Text(
                  'Confirm',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontFamily: "avenir next",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
