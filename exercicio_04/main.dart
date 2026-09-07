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
      home: ConversorTemperatura(),
    );
  }
}

class ConversorTemperatura extends StatefulWidget {
  const ConversorTemperatura({super.key});

  @override
  State<ConversorTemperatura> createState() => _ConversorTemperaturaState();
}

class _ConversorTemperaturaState extends State<ConversorTemperatura> {
  final TextEditingController celsiusController = TextEditingController();
  String resultado = '';

  double lerCelsius() {
    return double.tryParse(celsiusController.text) ?? 0;
  }

  void converter() {
    double celsius = lerCelsius();
    double fahrenheit = (celsius * 9 / 5) + 32;

    setState(() {
      resultado =
          'Temperatura em Fahrenheit: ${fahrenheit.toStringAsFixed(fahrenheit.truncateToDouble() == fahrenheit ? 0 : 1)} °F';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Conversor de Temperatura')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: celsiusController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Temperatura em Celsius',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: converter, child: Text('Converter')),
            SizedBox(height: 30),
            Text(
              resultado,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
