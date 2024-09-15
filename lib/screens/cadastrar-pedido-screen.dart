import 'package:app/screens/pedido-screen.dart';
import 'package:app/screens/usuario-screen.dart';
import 'package:flutter/material.dart';

class CadastrarPedidoScreen extends StatefulWidget {
  final List<Usuario> usuarios;

  CadastrarPedidoScreen({required this.usuarios});

  @override
  _CadastrarPedidoScreenState createState() => _CadastrarPedidoScreenState();
}

class _CadastrarPedidoScreenState extends State<CadastrarPedidoScreen> {
  final TextEditingController _controller = TextEditingController();
  Usuario? _selectedUsuario;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar Pedido"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<Usuario>(
              hint: Text("Selecione o Usuário"),
              value: _selectedUsuario,
              onChanged: (Usuario? newValue) {
                setState(() {
                  _selectedUsuario = newValue!;
                });
              },
              items: widget.usuarios.map((Usuario usuario) {
                return DropdownMenuItem<Usuario>(
                  value: usuario,
                  child: Text(usuario.nome),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(labelText: "Descrição do Pedido"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_selectedUsuario == null) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Selecione um usuário antes de salvar.'),
                  ));
                } else {
                  final pedido = Pedido(
                      descricao: _controller.text, usuario: _selectedUsuario);
                  _selectedUsuario?.pedidos.add(pedido);
                  Navigator.pop(context, pedido);
                }
              },
              child: Text("Salvar"),
            )
          ],
        ),
      ),
    );
  }
}
