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
      home: CalculadoraOperacoes(),
    );
  }
}

class CalculadoraOperacoes extends StatefulWidget {
  const CalculadoraOperacoes({super.key});

  @override
  State<CalculadoraOperacoes> createState() => _CalculadoraOperacoesState();
}

class _CalculadoraOperacoesState extends State<CalculadoraOperacoes> {
  final TextEditingController numero1Controller = TextEditingController();
  final TextEditingController numero2Controller = TextEditingController();

  String resultado = '';

  @override
  void dispose() {
    numero1Controller.dispose();
    numero2Controller.dispose();
    super.dispose();
  }

  double lerNumero1() {
    return double.tryParse(numero1Controller.text) ?? 0;
  }

  double lerNumero2() {
    return double.tryParse(numero2Controller.text) ?? 0;
  }

  void somar() {
    double n1 = lerNumero1();
    double n2 = lerNumero2();
    setState(() {
      resultado = 'Resultado: ${n1 + n2}';
    });
  }

  void subtrair() {
    double n1 = lerNumero1();
    double n2 = lerNumero2();
    setState(() {
      resultado = 'Resultado: ${n1 - n2}';
    });
  }

  void multiplicar() {
    double n1 = lerNumero1();
    double n2 = lerNumero2();
    setState(() {
      resultado = 'Resultado: ${n1 * n2}';
    });
  }

  void dividir() {
    double n1 = lerNumero1();
    double n2 = lerNumero2();
    setState(() {
      if (n2 != 0) {
        resultado = 'Resultado: ${n1 / n2}';
      } else {
        resultado = 'Erro: não é permitida divisão por zwro.';
      }
    });
  }

  void limpar() {
    setState(() {
      numero1Controller.clear();
      numero2Controller.clear();
      resultado = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculadora de Quatro Operações')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: numero1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Primeiro número',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: numero2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Segundo número',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: somar, child: Text('+')),
                SizedBox(width: 10),
                ElevatedButton(onPressed: subtrair, child: Text('-')),
                SizedBox(width: 10),
                ElevatedButton(onPressed: multiplicar, child: Text('×')),
                SizedBox(width: 10),
                ElevatedButton(onPressed: dividir, child: Text('÷')),
                SizedBox(width: 10),
                ElevatedButton(onPressed: limpar, child: Text('Limpar')),
              ],
            ),
            SizedBox(height: 30),
            Text(
              resultado,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
