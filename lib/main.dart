import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gerenciamento de pedidos pendentes"),
      ),
      body: Container(
        color: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CadastrarUsuarioScreen()),
          );
        },
        child: Text("Cadastrar usuário"),
      ),
    );
  }
}

class CadastrarUsuarioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar usuário"),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            height: 100,
            width: double
                .infinity, // Use double.infinity to make the container stretch across the screen
          ),
          Padding(padding: EdgeInsets.only(bottom: 20.0)),
          Container(
            color: Colors.blue,
            height: 100,
            width: double.infinity, // Same as above
          ),
          Padding(padding: EdgeInsets.only(bottom: 20.0)),
          Container(
            color: Colors.blue,
            height: 100,
            width: double.infinity, // Same as above
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
