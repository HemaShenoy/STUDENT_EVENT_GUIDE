import 'package:flutter/material.dart';

class CommunicationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Communication'),
      ),
      body: MessageList(),
    );
  }
}

class MessageList extends StatelessWidget {
  final List<Message> messages = [
    Message(
      sender: 'John Doe',
      message: 'Hey there! How are you?',
      time: '10:00 AM',
    ),
    Message(
      sender: 'Jane Smith',
      message: 'Hi! I\'m good. How about you?',
      time: '10:05 AM',
    ),
    // Add more messages as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return MessageItem(message: messages[index]);
      },
    );
  }
}

class Message {
  final String sender;
  final String message;
  final String time;

  Message({
    required this.sender,
    required this.message,
    required this.time,
  });
}

class MessageItem extends StatelessWidget {
  final Message message;

  const MessageItem({required this.message});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(message.sender[0]),
      ),
      title: Text(message.sender),
      subtitle: Text(message.message),
      trailing: Text(message.time),
      onTap: () {
        _showMessageDetails(context);
      },
    );
  }

  void _showMessageDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(message.sender),
          content: Text(message.message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
