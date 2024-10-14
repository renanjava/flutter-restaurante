import 'package:app/screens/cadastrar-pedido-screen.dart';
import 'package:app/screens/usuario-screen.dart';
import 'package:flutter/material.dart';

class Pedido {
  final Usuario? usuario;
  final String preco;
  final String data;
  final String descricao;

  Pedido({
    required this.usuario,
    required this.preco,
    required this.data,
    required this.descricao,
  });
}

class PedidoScreen extends StatefulWidget {
  @override
  _PedidoScreenState createState() => _PedidoScreenState();
}

class _PedidoScreenState extends State<PedidoScreen> {
  List<Pedido> pedidos = [];
  List<Usuario> usuarios = [
    Usuario(nome: 'João'),
    Usuario(nome: 'Maria'),
    Usuario(nome: 'Carlos')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pedidos"),
      ),
      body: ListView.builder(
        itemCount: pedidos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(pedidos[index].descricao),
            subtitle: Text("Usuário: ${pedidos[index].usuario?.nome}\n" +
                "Preço: ${pedidos[index].preco}\n" +
                "Data: ${pedidos[index].data}\n"),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final novoPedido = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CadastrarPedidoScreen(
                      usuarios: usuarios,
                    )),
          );

          if (novoPedido != null) {
            setState(() {
              pedidos.add(novoPedido);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
