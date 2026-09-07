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
      home: ControleEstoque(),
    );
  }
}

class ControleEstoque extends StatefulWidget {
  const ControleEstoque({super.key});

  @override
  State<ControleEstoque> createState() => _ControleEstoqueState();
}

class _ControleEstoqueState extends State<ControleEstoque> {
  final TextEditingController quantidadeController = TextEditingController();

  int estoque = 0;
  String mensagem = '';

  @override
  void dispose() {
    quantidadeController.dispose();
    super.dispose();
  }

  int lerQuantidade() {
    return int.tryParse(quantidadeController.text) ?? 0;
  }

  void registrarEntrada() {
    int qtd = lerQuantidade();

    if (qtd > 0) {
      setState(() {
        estoque += qtd;
        mensagem = 'Entrada realizada com sucesso.';
      });
    } else {
      setState(() {
        mensagem = 'Informe uma quantidade maior que zero.';
      });
    }
  }

  void registrarSaida() {
    int qtd = lerQuantidade();

    if (qtd <= 0) {
      setState(() {
        mensagem = 'Informe uma quantidade maior que zero.';
      });
    } else if (qtd > estoque) {
      setState(() {
        mensagem = 'Estoque insuficiente para realizar a saída.';
      });
    } else {
      setState(() {
        estoque -= qtd;
        mensagem = 'Saída realizada com sucesso.';
      });
    }
  }

  void limparCampo() {
    setState(() {
      quantidadeController.clear();
      mensagem = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Controle de Estoque')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
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
                ElevatedButton(
                  onPressed: registrarEntrada,
                  child: Text('Entrada'),
                ),
                SizedBox(width: 10),
                ElevatedButton(onPressed: registrarSaida, child: Text('Saída')),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: limparCampo,
                  child: Text('Limpar campo'),
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              'Quantidade atual em estoque: $estoque',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              mensagem,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
