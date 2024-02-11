import 'package:flutter/material.dart';
import 'communication.dart';
import 'events.dart';
import 'calender.dart';
import 'leader.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Planner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Planner'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle), // Assuming this icon represents user login details
            onPressed: () {
              // Add your logic to display user login details
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("John Doe"), // Replace with user's name
              accountEmail: Text("john.doe@example.com"), // Replace with user's email or other details
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "JD", // You can also use the user's initials or profile picture here
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              title: Text('Leader Recognition'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LeaderRecognitionPage()),
                );
              }),
            ListTile(
              title: Text('Participations'),
              onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ParticipationPage()),
    );
    }),
            ListTile(
              title: Text('Reminder'),
              onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ReminderPage()),
    ); // Navigate to reminder page
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CustomCard(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalendarPage()),
                );
              },
              text: 'View Calendar',
              backgroundImageUrl:
              'https://worldofprintables.com/wp-content/uploads/2021/07/July-2021-Calendar-Wallpaper-40-1050x591.jpg',
            ),
          ),
          Expanded(
            child: CustomCard(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EventDiscoveryPage()),
                );
              },
              text: 'Discover Events',
              backgroundImageUrl:
              'https://png.pngtree.com/background/20210709/original/pngtree-creative-presentation-competition-event-poster-psd-layered-material-picture-image_856007.jpg',
            ),
          ),
          Expanded(
            child: CustomCard(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CommunicationPage()),
                );
              },
              text: 'Communicate',
              backgroundImageUrl:
              'https://th.bing.com/th/id/OIP.SHlqwBQp0mP40m29RdT27AHaFx?rs=1&pid=ImgDetMain',
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final String backgroundImageUrl;

  const CustomCard({
    Key? key,
    required this.onTap,
    required this.text,
    required this.backgroundImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(backgroundImageUrl),
              fit: BoxFit.cover, // or BoxFit.fill for filling the entire area
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
