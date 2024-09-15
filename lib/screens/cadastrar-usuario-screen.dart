import 'package:app/screens/usuario-screen.dart';
import 'package:flutter/material.dart';

class CadastrarUsuarioScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar Usuário"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(labelText: "Nome do Usuário"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final usuario = Usuario(nome: _controller.text);
                Navigator.pop(context, usuario);
              },
              child: Text("Salvar"),
            )
          ],
        ),
      ),
    );
  }
}
