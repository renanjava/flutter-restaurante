import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

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

class Pedido {
  final String descricao;
  Usuario? usuario;

  Pedido({required this.descricao, this.usuario});
}

class Usuario {
  final String nome;
  List<Pedido> pedidos;
  Usuario({required this.nome, this.pedidos = const []});
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
            subtitle: Text(
                "Usuário: ${pedidos[index].usuario?.nome ?? 'Não atribuído'}"),
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
                  _selectedUsuario = newValue;
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
                if (_selectedUsuario != null) {
                  final pedido = Pedido(descricao: _controller.text);
                  _selectedUsuario!.pedidos.add(pedido);
                  Navigator.pop(context, pedido);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Selecione um usuário antes de salvar.'),
                  ));
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
