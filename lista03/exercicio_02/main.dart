import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Livro {
  final String titulo;
  final String autor;

  Livro({
    required this.titulo,
    required this.autor,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaLivros(),
    );
  }
}

class TelaLivros extends StatelessWidget {
  const TelaLivros({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Livro> livros = [
      Livro(titulo: 'O Hobbit', autor: 'J.R.R. Tolkien'),
      Livro(titulo: 'O Senhor dos Anéis', autor: 'J.R.R. Tolkien'),
      Livro(titulo: 'O Silmarillion', autor: 'J.R.R. Tolkien'),
      Livro(titulo: 'Contos Inacabados', autor: 'J.R.R. Tolkien'),
      Livro(titulo: 'A Queda de Númenor', autor: 'J.R.R. Tolkien'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Livros'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: livros.length,
        itemBuilder: (context, index) {
          final Livro livro = livros[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              leading: const Icon(Icons.book, size: 35),
              title: Text(
                livro.titulo,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Autor: ${livro.autor}'),
            ),
          );
        },
      ),
    );
  }
}
