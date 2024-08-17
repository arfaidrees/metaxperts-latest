import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Components/theme.dart'; // Import your theme for consistent styling

class OrderBookingStatus extends StatefulWidget {
  @override
  _OrderBookingStatusState createState() => _OrderBookingStatusState();
}

class _OrderBookingStatusState extends State<OrderBookingStatus> {
  final List<String> _shopOptions = ["Shop 1", "Shop 2", "Shop 3", "Shop 4", "Shop 5", "Shop 6", "Shop 7"];
  final List<String> _orderOptions = ["Order 1", "Order 2", "Order 3", "Order 4", "Order 5"];
  final List<String> _statusOptions = ["Dispatched", "Rescheduled", "Canceled", "Pending"];

  String? _selectedShop;
  String? _selectedOrder;
  String? _selectedStatus;
  DateTime? _startDate;
  DateTime? _endDate;
  bool _showData = false;  // Boolean to control data visibility

  Future<void> _selectDate(BuildContext context, bool isStart) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  void _clearFilters() {
    setState(() {
      _selectedShop = null;
      _selectedOrder = null;
      _selectedStatus = null;
      _startDate = null;
      _endDate = null;
      _showData = false;
    });
  }

  void _handleSearch() {
    setState(() {
      _showData = true;
    });
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
          'Order Booking Status',
          style: TextStyle(
              fontFamily: 'Avenir Next',
              fontSize: 17,
              color: RiveAppTheme.purple,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DropdownButtonFormField<String>(
              decoration: buildInputDecoration("Select Shop"),
              value: _selectedShop,
              items: _shopOptions.map((shop) {
                return DropdownMenuItem(
                  value: shop,
                  child: Text(shop),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedShop = value;
                });
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: buildInputDecoration("Select Order"),
              value: _selectedOrder,
              items: _orderOptions.map((order) {
                return DropdownMenuItem(
                  value: order,
                  child: Text(order),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedOrder = value;
                });
              },
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    decoration: buildInputDecoration("Start Date"),
                    onTap: () => _selectDate(context, true),
                    controller: TextEditingController(
                      text: _startDate != null
                          ? DateFormat('yyyy-MM-dd').format(_startDate!)
                          : '',
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    decoration: buildInputDecoration("End Date"),
                    onTap: () => _selectDate(context, false),
                    controller: TextEditingController(
                      text: _endDate != null
                          ? DateFormat('yyyy-MM-dd').format(_endDate!)
                          : '',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: buildInputDecoration("Status"),
              value: _selectedStatus,
              items: _statusOptions.map((status) {
                return DropdownMenuItem(
                  value: status,
                  child: Text(status),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedStatus = value;
                });
              },
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _handleSearch,
                    child: const Text('Search'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: RiveAppTheme.purple,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _clearFilters,
                    child: const Text('Clear Filters'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (_showData)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Order No', style: TextStyle(fontFamily: "Avenir Next", fontSize: 14))),
                    DataColumn(label: Text('Order Date', style: TextStyle(fontFamily: "Avenir Next", fontSize: 14))),
                    DataColumn(label: Text('Shop Name', style: TextStyle(fontFamily: "Avenir Next", fontSize: 14))),
                    DataColumn(label: Text('Amount', style: TextStyle(fontFamily: "Avenir Next", fontSize: 14))),
                    DataColumn(label: Text('Status', style: TextStyle(fontFamily: "Avenir Next", fontSize: 14))),
                    DataColumn(label: Text('Details', style: TextStyle(fontFamily: "Avenir Next", fontSize: 14))),
                  ],
                  rows: List<DataRow>.generate(
                    10,
                        (index) => DataRow(
                      cells: [
                        DataCell(Text('Order ${index + 1}', style: TextStyle(fontFamily: "Avenir Next", fontSize: 14))),
                        DataCell(Text('2024-07-20', style: TextStyle(fontFamily: "Avenir Next", fontSize: 14))),
                        DataCell(Text('Shop ${index % 3 + 1}', style: TextStyle(fontFamily: "Avenir Next", fontSize: 14))),
                        DataCell(Text('\$${(index + 1) * 10}', style: TextStyle(fontFamily: "Avenir Next", fontSize: 14))),
                        DataCell(Text(_statusOptions[index % 4], style: TextStyle(fontFamily: "Avenir Next", fontSize: 14))),
                        DataCell(Text('Details ${index + 1}', style: TextStyle(fontFamily: "Avenir Next", fontSize: 14))),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
