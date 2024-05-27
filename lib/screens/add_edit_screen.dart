import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/reminder_provider.dart';
import '../models/reminder.dart';

class AddEditScreen extends StatefulWidget {
  @override
  _AddEditScreenState createState() => _AddEditScreenState();
}

class _AddEditScreenState extends State<AddEditScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String _title;
  late String _description;
  late DateTime _selectedDate;
  late TimeOfDay _selectedTime;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _selectedTime = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    final reminderProvider = Provider.of<ReminderProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add/Edit Reminder',
          style: TextStyle(color: Colors.white), // Text color
        ),
        backgroundColor: Color(0xff20013d), // Background color of the app bar
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xff8f3201), // Background color of the whole screen
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: TextStyle(color: Colors.white), // Text color
                  ),
                  style: TextStyle(color: Colors.white), // Text color
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _title = value ?? '';
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: TextStyle(color: Colors.white), // Text color
                  ),
                  style: TextStyle(color: Colors.white), // Text color
                  onSaved: (value) {
                    _description = value ?? '';
                  },
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          final pickedDate = await showDatePicker(
                            context: context,
                            initialDate: _selectedDate,
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(Duration(days: 365)),
                          );

                          if (pickedDate != null) {
                            setState(() {
                              _selectedDate = pickedDate;
                            });
                          }
                        },
                        child: Text('Select Date'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black, // Background color of the button
                          onPrimary: Colors.white, // Text color
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          final pickedTime = await showTimePicker(
                            context: context,
                            initialTime: _selectedTime,
                          );

                          if (pickedTime != null) {
                            setState(() {
                              _selectedTime = pickedTime;
                            });
                          }
                        },
                        child: Text('Select Time'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black, // Background color of the button
                          onPrimary: Colors.white, // Text color
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      final newReminder = Reminder(
                        title: _title,
                        description: _description,
                        dateTime: DateTime(
                          _selectedDate.year,
                          _selectedDate.month,
                          _selectedDate.day,
                          _selectedTime.hour,
                          _selectedTime.minute,
                        ),
                      );

                      reminderProvider.addReminder(newReminder);
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Add Reminder'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black, // Background color of the button
                    onPrimary: Colors.white, // Text color
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
