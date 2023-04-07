import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class InboxPage extends StatefulWidget {
  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  List<Message> _messages = [
    Message(
      sender: 'Jay',
      subject: 'kya chee',
      body: '',
    ),
    Message(
      sender: 'vatsal',
      subject: 'panipuri khavi',
      body: '',
    ),
    Message(
      sender: 'chaman',
      subject: 'Burger leto avje',
      body: '.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inbox'),
      ),
      body: ListView.builder(
        itemCount: _messages.length,
        itemBuilder: (context, index) {
          final message = _messages[index];
          return ListTile(
            title: Text(message.sender),
            subtitle: Text(message.subject),
            onTap: () {
              // Navigate to message detail screen
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Compose new message
        },
      ),
    );
  }
}

class Message {
  final String sender;
  final String subject;
  final String body;

  Message({required this.sender, required this.subject, required this.body});
}
