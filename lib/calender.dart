import 'package:flutter/material.dart';



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add Event to Calendar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalendarPage(),
    );
  }
}

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  TextEditingController _eventController = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _selectedStartTime;
  TimeOfDay? _selectedEndTime;

  void _addEvent() {
    if (_selectedDate == null || _selectedStartTime == null || _selectedEndTime == null) {
      // Handle null values if needed
      return;
    }

    // Your code to add the event to the calendar would go here
    // This is just a placeholder function

    print('Event added successfully');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Event added successfully'),
        backgroundColor: Colors.green,
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedStartTime) {
      setState(() {
        _selectedStartTime = picked;
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedEndTime) {
      setState(() {
        _selectedEndTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Event to Calendar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _eventController,
              decoration: InputDecoration(
                labelText: 'Event',
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: Text('Selected Date: ${_selectedDate ?? "Not selected"}'),
                ),
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Select Date'),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: Text('Selected Start Time: ${_selectedStartTime ?? "Not selected"}'),
                ),
                ElevatedButton(
                  onPressed: () => _selectStartTime(context),
                  child: Text('Select Start Time'),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: Text('Selected End Time: ${_selectedEndTime ?? "Not selected"}'),
                ),
                ElevatedButton(
                  onPressed: () => _selectEndTime(context),
                  child: Text('Select End Time'),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _addEvent,
              child: Text('Add Event to Calendar'),
            ),
          ],
        ),
      ),
    );
  }
}
