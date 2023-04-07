import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class MessageLocationDialog extends StatefulWidget {
  @override
  _MessageLocationDialogState createState() => _MessageLocationDialogState();
}

class _MessageLocationDialogState extends State<MessageLocationDialog> {
  TextEditingController _messageController = TextEditingController();
  TextEditingController _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Announcement:'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _messageController,
            decoration: InputDecoration(
              hintText: 'Enter message',
            ),
          ),
          SizedBox(height: 8),
          TextField(
            controller: _locationController,
            decoration: InputDecoration(
              hintText: 'Enter location',
            ),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            // Add code to save the message and location and close the dialog
          },
          child: Text('Save'),
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
