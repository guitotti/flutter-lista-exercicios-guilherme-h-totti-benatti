import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IdentificacaoUsuario(),
    );
  }
}

class IdentificacaoUsuario extends StatefulWidget {
  const IdentificacaoUsuario({super.key});

  @override
  State<IdentificacaoUsuario> createState() => _IdentificacaoUsuarioState();
}

class _IdentificacaoUsuarioState extends State<IdentificacaoUsuario> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController cidadeController = TextEditingController();

  String mensagem = '';

  void mostrar() {
    String nome = nomeController.text;
    String cidade = cidadeController.text;

    setState(() {
      mensagem = 'Olá, $nome! Você mora em $cidade.';
    });
  }

  void limpar() {
    setState(() {
      nomeController.clear();
      cidadeController.clear();
      mensagem = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Identificação do Usuário')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: cidadeController,
              decoration: InputDecoration(
                labelText: 'Cidade',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: mostrar, child: Text('Mostrar')),
                SizedBox(width: 15),
                ElevatedButton(onPressed: limpar, child: Text('Limpar')),
              ],
            ),
            SizedBox(height: 30),
            Text(
              mensagem,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
