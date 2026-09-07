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
      home: ConsumoCombustivel(),
    );
  }
}

class ConsumoCombustivel extends StatefulWidget {
  const ConsumoCombustivel({super.key});

  @override
  State<ConsumoCombustivel> createState() => _ConsumoCombustivelState();
}

class _ConsumoCombustivelState extends State<ConsumoCombustivel> {
  final TextEditingController distanciaController = TextEditingController();
  final TextEditingController litrosController = TextEditingController();

  String resultadoConsumo = '';
  String resultadoClassificacao = '';

  @override
  void dispose() {
    distanciaController.dispose();
    litrosController.dispose();
    super.dispose();
  }

  double lerDistancia() {
    return double.tryParse(distanciaController.text) ?? 0;
  }

  double lerLitros() {
    return double.tryParse(litrosController.text) ?? 0;
  }

  void calcular() {
    double distancia = lerDistancia();
    double litros = lerLitros();

    if (litros > 0) {
      double consumo = distancia / litros;
      String classificacao = consumo >= 12 ? 'Econômico' : 'Consumo elevado';

      setState(() {
        resultadoConsumo = 'Consumo médio: ${consumo.toStringAsFixed(1)} km/l';
        resultadoClassificacao = 'Classificação: $classificacao';
      });
    } else {
      setState(() {
        resultadoConsumo = 'A quantidade de litors deve ser maior que zero.';
        resultadoClassificacao = '';
      });
    }
  }

  void limpar() {
    setState(() {
      distanciaController.clear();
      litrosController.clear();
      resultadoConsumo = '';
      resultadoClassificacao = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Consumo de Combustível')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: distanciaController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Distância (km)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: litrosController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Combustível (litros)',
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
              resultadoConsumo,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              resultadoClassificacao,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
