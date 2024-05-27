// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/reminder_provider.dart';
import 'screens/home_screen.dart';
import 'screens/add_edit_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ReminderProvider(),
      child: MaterialApp(
        title: 'Reminder App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(), // Changed route to LoginScreen
          '/home': (context) => HomeScreen(),
          '/addEditScreen': (context) => AddEditScreen(),
        },
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 120.0), // Adjusted top padding
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center children vertically
              children: <Widget>[
                Stack(
                  children: [
                    Container(
                      height: 250,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(120),
                      ),
                      child: Center(
                        child: Transform.rotate(
                          angle: -0.1,
                          child: Text(
                            'MemoRise',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Email or Phone',
                      border: InputBorder.none,
                      icon: Icon(Icons.email),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: InputBorder.none,
                      icon: Icon(Icons.lock),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
