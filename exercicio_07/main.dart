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
      home: ReajusteSalarial(),
    );
  }
}

class ReajusteSalarial extends StatefulWidget {
  const ReajusteSalarial({super.key});

  @override
  State<ReajusteSalarial> createState() => _ReajusteSalarialState();
}

class _ReajusteSalarialState extends State<ReajusteSalarial> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController salarioController = TextEditingController();
  final TextEditingController percentualController = TextEditingController();

  String resFuncionario = '';
  String resSalarioAtual = '';
  String resAumento = '';
  String resNovoSalario = '';

  @override
  void dispose() {
    nomeController.dispose();
    salarioController.dispose();
    percentualController.dispose();
    super.dispose();
  }

  double lerSalario() {
    return double.tryParse(salarioController.text) ?? 0;
  }

  double lerPercentual() {
    return double.tryParse(percentualController.text) ?? 0;
  }

  void calcular() {
    String nome = nomeController.text;
    double salario = lerSalario();
    double percentual = lerPercentual();

    double aumento = salario * percentual / 100;
    double novoSalario = salario + aumento;

    setState(() {
      resFuncionario = 'Nome do funcionário: $nome';
      resSalarioAtual = 'Salário atual: ${salario.toStringAsFixed(2)} reais';
      resAumento = 'Aumento: ${aumento.toStringAsFixed(2)} reais';
      resNovoSalario = 'Novo salário: ${novoSalario.toStringAsFixed(2)} reais';
    });
  }

  void limpar() {
    setState(() {
      nomeController.clear();
      salarioController.clear();
      percentualController.clear();
      resFuncionario = '';
      resSalarioAtual = '';
      resAumento = '';
      resNovoSalario = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reajuste Salarial')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                labelText: 'Nome do funcionário',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: salarioController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Salário atual',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: percentualController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Percentual de reajuste (%)',
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
              resFuncionario,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              resSalarioAtual,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              resAumento,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              resNovoSalario,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
