import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerenciamento de pedidos pendentes',
      home: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UsuarioScreen()),
            );
          },
          child: Text("usuario")),
    );
  }
}

class PedidoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pedidos"),
      ),
      body: Container(
        color: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CadastrarPedidoScreen()),
          );
        },
        child: Text("Cadastrar pedido"),
      ),
    );
  }
}

class UsuarioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Usuários"),
      ),
      body: Column(
        children: [
          TextFormField(),
          Padding(padding: EdgeInsets.only(bottom: 20.0)),
        ],
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

class CadastrarPedidoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pedidos"),
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
        child: Text("Cadastrar pedido"),
      ),
    );
  }
}

class CadastrarUsuarioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Usuários"),
      ),
      body: Column(
        children: [
          TextFormField(),
          Padding(padding: EdgeInsets.only(bottom: 20.0)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
