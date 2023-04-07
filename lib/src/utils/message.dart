import 'package:flutter/material.dart';

class MessageLocationDialog extends StatefulWidget {
  @override
  _MessageLocationDialogState createState() => _MessageLocationDialogState();
}

class _MessageLocationDialogState extends State<MessageLocationDialog> {
  final TextEditingController _messageController = TextEditingController();
  String? _selectedLocation;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('New Message'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Message'),
          TextField(
            controller: _messageController,
            decoration: InputDecoration(
              hintText: 'Enter your message',
            ),
          ),
          SizedBox(height: 16.0),
          Text('Location'),
          DropdownButton<String>(
            value: _selectedLocation,
            items: <String>['Home', 'Office', 'School', 'Other']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                _selectedLocation = value!;
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context, null);
          },
          child: Text('CANCEL'),
        ),
        ElevatedButton(
          onPressed: () {
            String message = _messageController.text.trim();
            if (message.isEmpty || _selectedLocation == null) {
              return;
            }
            Navigator.pop(
                context, {'message': message, 'location': _selectedLocation!});
          },
          child: Text('SEND'),
        ),
      ],
    );
  }
}
