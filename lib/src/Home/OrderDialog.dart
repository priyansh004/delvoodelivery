import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class OrderDialog extends StatefulWidget {
  @override
  _OrderDialogState createState() => _OrderDialogState();
}

class _OrderDialogState extends State<OrderDialog> {
  TextEditingController _itemController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('place Order'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _itemController,
            decoration: InputDecoration(
              hintText: 'Enter item',
            ),
          ),
          SizedBox(height: 8),
          TextField(
            controller: _addressController,
            decoration: InputDecoration(
              hintText: 'Enter delivery address',
            ),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            // Add code to save the item and address and close the dialog
          },
          child: Text('Confirm'),
        ),
        TextButton(
          onPressed: () {
            // Add code to close the dialog without saving
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }
}
