import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaLinguagens(),
    );
  }
}

class TelaLinguagens extends StatelessWidget {
  const TelaLinguagens({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> linguagens = [
      'Dart',
      'JavaScript',
      'Java',
      'TypeScript',
      'C#',
      'C++',
      'PHP',
      'Lua',
      'Lisp',
      'Ruby',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Linguagens de Programação'),
      ),
      body: ListView.builder(
        itemCount: linguagens.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.code),
            title: Text(linguagens[index]),
            subtitle: Text('Linguagem ${index + 1}'),
          );
        },
      ),
    );
  }
}
