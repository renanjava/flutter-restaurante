import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oi',
      home: Container(
        color: const Color.fromARGB(255, 221, 9, 9),
      ),
    );
  }
}
