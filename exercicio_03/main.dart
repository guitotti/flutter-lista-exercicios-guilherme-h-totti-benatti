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
      home: AntecessorSucessor(),
    );
  }
}

class AntecessorSucessor extends StatefulWidget {
  const AntecessorSucessor({super.key});

  @override
  State<AntecessorSucessor> createState() => _AntecessorSucessorState();
}

class _AntecessorSucessorState extends State<AntecessorSucessor> {
  final TextEditingController numeroController = TextEditingController();

  String resultadoNumero = '';
  String resultadoAntecessor = '';
  String resultadoSucessor = '';

  @override
  void dispose() {
    numeroController.dispose();
    super.dispose();
  }

  int lerNumero() {
    return int.tryParse(numeroController.text) ?? 0;
  }

  void calcular() {
    int numero = lerNumero();
    int antecessor = numero - 1;
    int sucessor = numero + 1;

    setState(() {
      resultadoNumero = 'Número: $numero';
      resultadoAntecessor = 'Antecessor: $antecessor';
      resultadoSucessor = 'Sucessor: $sucessor';
    });
  }

  void limpar() {
    setState(() {
      numeroController.clear();
      resultadoNumero = '';
      resultadoAntecessor = '';
      resultadoSucessor = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Antecessor e Sucessor')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: numeroController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Informe um número inteiro',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: calcular, child: Text('Calcular')),
                SizedBox(width: 15),
                ElevatedButton(onPressed: limpar, child: Text('Limpar')),
              ],
            ),
            SizedBox(height: 30),
            Text(
              resultadoNumero,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              resultadoAntecessor,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              resultadoSucessor,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
