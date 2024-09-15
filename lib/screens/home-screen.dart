import 'package:app/screens/pedido-screen.dart';
import 'package:app/screens/usuario-screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página Inicial"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UsuarioScreen()),
                );
              },
              child: Text("Usuários"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PedidoScreen()),
                );
              },
              child: Text("Pedidos"),
            ),
          ],
        ),
      ),
    );
  }
}
