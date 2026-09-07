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
      home: CalculadoraMedia(),
    );
  }
}

class CalculadoraMedia extends StatefulWidget {
  const CalculadoraMedia({super.key});

  @override
  State<CalculadoraMedia> createState() => _CalculadoraMediaState();
}

class _CalculadoraMediaState extends State<CalculadoraMedia> {
  final TextEditingController nota1Controller = TextEditingController();
  final TextEditingController nota2Controller = TextEditingController();
  final TextEditingController nota3Controller = TextEditingController();

  String resultadoMedia = '';
  String resultadoSituacao = '';

  double lerNota1() {
    return double.tryParse(nota1Controller.text) ?? 0;
  }

  double lerNota2() {
    return double.tryParse(nota2Controller.text) ?? 0;
  }

  double lerNota3() {
    return double.tryParse(nota3Controller.text) ?? 0;
  }

  void calcularMedia() {
    double n1 = lerNota1();
    double n2 = lerNota2();
    double n3 = lerNota3();

    double media = (n1 + n2 + n3) / 3;
    String situacao = media >= 6 ? 'Aprovado' : 'Reprovado';

    setState(() {
      resultadoMedia = 'Média: ${media.toStringAsFixed(1)}';
      resultadoSituacao = 'Situação: $situacao';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculadora de Média')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nota1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Primeira nota',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: nota2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Segunda nota',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: nota3Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Terceira nota',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcularMedia,
              child: Text('Calcular Média'),
            ),
            SizedBox(height: 30),
            Text(
              resultadoMedia,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              resultadoSituacao,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
