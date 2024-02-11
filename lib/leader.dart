import 'package:flutter/material.dart';

class LeaderRecognitionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leader Recognition'),
      ),
      body: Center(
        child: Text(
          'Leader Recognition Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class ParticipationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Participation'),
      ),
      body: Center(
        child: Text(
          'Participation Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class ReminderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reminder'),
      ),
      body: Center(
        child: Text(
          'Reminder Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
