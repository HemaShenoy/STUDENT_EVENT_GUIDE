import 'package:flutter/material.dart';

class EventDiscoveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: EventList(),
    );
  }
}

class EventList extends StatelessWidget {
  final List<Event> events = [
    Event(
      name: 'Engineering Expo',
      date: 'February 15, 2024',
      time: '10:00 AM - 5:00 PM',
      location: 'Engineering Building',
      description:
      'An exposition showcasing engineering projects and innovations.',
    ),
    Event(
      name: 'Tech Symposium',
      date: 'March 10, 2024',
      time: '1:00 PM - 6:00 PM',
      location: 'Auditorium',
      description:
      'A symposium featuring talks and presentations on emerging technologies.',
    ),
    // Add more events as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: (events.length / 2).ceil(), // Adjust itemCount for two events per row
      itemBuilder: (context, index) {
        int startIndex = index * 2;
        int endIndex = startIndex + 2;
        endIndex = endIndex > events.length ? events.length : endIndex;
        return Row(
          children: events
              .sublist(startIndex, endIndex)
              .map((event) => Expanded(child: EventCard(event: event)))
              .toList(),
        );
      },
    );
  }
}

class Event {
  final String name;
  final String date;
  final String time;
  final String location;
  final String description;

  Event({
    required this.name,
    required this.date,
    required this.time,
    required this.location,
    required this.description,
  });
}

class EventCard extends StatelessWidget {
  final Event event;

  const EventCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        margin: EdgeInsets.all(8.0),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text('Date: ${event.date}'),
              Text('Time: ${event.time}'),
              Text('Location: ${event.location}'),
              SizedBox(height: 8.0),
              Text(
                event.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
