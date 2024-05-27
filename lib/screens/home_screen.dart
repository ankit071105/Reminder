import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/reminder_provider.dart';
import '../models/reminder.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final reminderProvider = Provider.of<ReminderProvider>(context);
    final reminders = reminderProvider.reminders;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reminders',
          style: TextStyle(color: Colors.white), // Text color
        ),
        backgroundColor: Colors.black, // Background color of the app bar
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Navigate back to the login page
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xff620146), // Background color of the whole page
        ),
        child: ListView.builder(
          itemCount: reminders.length,
          itemBuilder: (context, index) {
            final reminder = reminders[index];
            return ListTile(
              title: Text(
                reminder.title,
                style: TextStyle(color: Color(0xff69bcf3),fontSize: 22,fontWeight: FontWeight.bold), // Text color
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    reminder.description,
                    style: TextStyle(color: Color(0xff84ffdf),fontSize: 18,), // Text color
                  ),
                  Text(
                    reminder.dateTime.toString(), // Assuming dateTime is DateTime type
                    style: TextStyle(color: Color(0xff84ffdf),fontSize: 18), // Text color
                  ),
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  reminderProvider.deleteReminder(index);
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addEditScreen');
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.black, // Background color of the floating action button
      ),
    );
  }
}
