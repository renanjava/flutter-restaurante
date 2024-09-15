import 'package:app/screens/cadastrar-usuario-screen.dart';
import 'package:app/screens/pedido-screen.dart';
import 'package:flutter/material.dart';

class Usuario {
  final String nome;
  List<Pedido> pedidos = [];
  Usuario({required this.nome, List<Pedido>? pedidos});
}

class UsuarioScreen extends StatefulWidget {
  @override
  _UsuarioScreenState createState() => _UsuarioScreenState();
}

class _UsuarioScreenState extends State<UsuarioScreen> {
  List<Usuario> usuarios = [
    Usuario(nome: 'João'),
    Usuario(nome: 'Maria'),
    Usuario(nome: 'Carlos')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Usuários"),
      ),
      body: ListView.builder(
        itemCount: usuarios.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(usuarios[index].nome),
            children: usuarios[index]
                .pedidos
                .map((pedido) => ListTile(
                      title: Text(pedido.descricao),
                    ))
                .toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final novoUsuario = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CadastrarUsuarioScreen()),
          );
          if (novoUsuario != null) {
            setState(() {
              usuarios.add(novoUsuario);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
