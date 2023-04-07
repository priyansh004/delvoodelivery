import 'package:flutter/material.dart';

class FriendsPage extends StatefulWidget {
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  final TextEditingController _phoneNumberController = TextEditingController();
  List<String> _friends = [];

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  void _addFriend() {
    setState(() {
      String phoneNumber = _phoneNumberController.text.trim();
      if (phoneNumber.isNotEmpty) {
        _friends.add(phoneNumber);
        _phoneNumberController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friends'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(
                hintText: 'Enter phone number',
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _addFriend,
              child: Text('Add Friend'),
            ),
            SizedBox(height: 16),
            Text(
              'Friends:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: _friends.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(_friends[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
