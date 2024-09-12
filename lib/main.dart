import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Cadastrar usuário',
        home: Scaffold(
          appBar: AppBar(
            title: Text("Cadastrar usuário"),
          ),
          body: Column(
            children: [
              Container(
                color: Colors.blue,
                height: 100,
                width: 450,
              ),
              Padding(padding: EdgeInsets.only(bottom: 20.00)),
              Container(
                color: Colors.blue,
                height: 100,
                width: 450,
              ),
              Padding(padding: EdgeInsets.only(bottom: 20.00)),
              Container(
                color: Colors.blue,
                height: 100,
                width: 450,
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
          ),
        ));
    ;
  }

  homePage() {
    return MaterialApp(
        title: 'Home',
        home: Scaffold(
          appBar: AppBar(
            title: Text("Gerenciamento de pedidos pendentes"),
          ),
          body: Container(
            color: Colors.blue,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Text("Cadastrar usuário"),
          ),
        ));
  }
}
