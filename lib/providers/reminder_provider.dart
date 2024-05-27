// reminder_provider.dart
import 'package:flutter/material.dart';
import '../models/reminder.dart';

class ReminderProvider extends ChangeNotifier {
  List<Reminder> _reminders = [];

  List<Reminder> get reminders => _reminders;

  void addReminder(Reminder reminder) {
    _reminders.add(reminder);
    notifyListeners();
  }

  void editReminder(int index, Reminder reminder) {
    _reminders[index] = reminder;
    notifyListeners();
  }

  void deleteReminder(int index) {
    _reminders.removeAt(index);
    notifyListeners();
  }

  // Method to get the title of a reminder by index
  String getReminderTitle(int index) {
    return _reminders[index].title;
  }

  // Method to get the description of a reminder by index
  String getReminderDescription(int index) {
    return _reminders[index].description;
  }

  // Method to get the date and time of a reminder by index
  String getReminderDateTime(int index) {
    final reminder = _reminders[index];
    return '${_formatDate(reminder.dateTime)} ${_formatTime(reminder.dateTime)}';
  }

  // Helper method to format date
  String _formatDate(DateTime dateTime) {
    return '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
  }

  // Helper method to format time
  String _formatTime(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
