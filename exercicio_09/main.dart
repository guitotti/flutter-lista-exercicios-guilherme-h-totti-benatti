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
      home: SistemaVendas(),
    );
  }
}

class SistemaVendas extends StatefulWidget {
  const SistemaVendas({super.key});

  @override
  State<SistemaVendas> createState() => _SistemaVendasState();
}

class _SistemaVendasState extends State<SistemaVendas> {
  final TextEditingController produtoController = TextEditingController();
  final TextEditingController precoController = TextEditingController();
  final TextEditingController quantidadeController = TextEditingController();

  String resProduto = '';
  String resQuantidade = '';
  String resSubtotal = '';
  String resDesconto = '';
  String resTotal = '';

  @override
  void dispose() {
    produtoController.dispose();
    precoController.dispose();
    quantidadeController.dispose();
    super.dispose();
  }

  double lerPreco() {
    return double.tryParse(precoController.text) ?? 0;
  }

  int lerQuantidade() {
    return int.tryParse(quantidadeController.text) ?? 0;
  }

  void calcular() {
    String produto = produtoController.text;
    double preco = lerPreco();
    int quantidade = lerQuantidade();

    double subtotal = preco * quantidade;
    double desconto = subtotal > 500 ? subtotal * 0.10 : 0.0;
    double total = subtotal - desconto;

    setState(() {
      resProduto = 'Produto: $produto';
      resQuantidade = 'Quantidade: $quantidade';
      resSubtotal = 'Subtotal: ${subtotal.toStringAsFixed(2)} reais';
      resDesconto = 'Desconto: ${desconto.toStringAsFixed(2)} reais';
      resTotal = 'Total: ${total.toStringAsFixed(2)} reias';
    });
  }

  void limpar() {
    setState(() {
      produtoController.clear();
      precoController.clear();
      quantidadeController.clear();
      resProduto = '';
      resQuantidade = '';
      resSubtotal = '';
      resDesconto = '';
      resTotal = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sistema de Vendas')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: produtoController,
              decoration: InputDecoration(
                labelText: 'Nome do produto',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: precoController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Preço unitário',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: quantidadeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Quantidade',
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
              resProduto,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              resQuantidade,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              resSubtotal,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              resDesconto,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              resTotal,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
