import 'package:flutter/material.dart';
import 'main_screen.dart'; // Import MainScreen yang sejajar

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIGAP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      home: const MainScreen(), // Panggil MainScreen di sini
    );
  }
}