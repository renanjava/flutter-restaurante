import 'package:app/screens/home-screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerenciamento de Pedidos e Usuários',
      home: HomeScreen(),
    );
  }
}
