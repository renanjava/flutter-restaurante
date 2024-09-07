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
        home: Scaffold(
          appBar: AppBar(
            title: Text("Gerenciamento de pedidos pendentes"),
          ),
          body: Container(
            color: Colors.blue,
          ),
          floatingActionButton: FloatingActionButton(onPressed: () {}),
        ));
  }
}
