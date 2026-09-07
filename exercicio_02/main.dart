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
      home: VerificadorIdade(),
    );
  }
}

class VerificadorIdade extends StatefulWidget {
  const VerificadorIdade({super.key});

  @override
  State<VerificadorIdade> createState() => _VerificadorIdadeState();
}

class _VerificadorIdadeState extends State<VerificadorIdade> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController idadeController = TextEditingController();

  String mensagem = '';

  @override
  void dispose() {
    nomeController.dispose();
    idadeController.dispose();
    super.dispose();
  }

  int lerIdade() {
    return int.tryParse(idadeController.text) ?? 0;
  }

  void verificar() {
    String nome = nomeController.text;
    int idade = lerIdade();
    String status = idade >= 18 ? 'maior de idade' : 'menor de idade';

    setState(() {
      mensagem = '$nome é $status.';
    });
  }

  void limpar() {
    setState(() {
      nomeController.clear();
      idadeController.clear();
      mensagem = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Verificador de Idade')),
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
              controller: idadeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Idade',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: verificar, child: Text('Verificar')),
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
