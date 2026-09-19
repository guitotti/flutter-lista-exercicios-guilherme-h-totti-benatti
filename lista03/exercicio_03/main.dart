import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class Aluno {
  final String nome;
  final double nota;

  Aluno({
    required this.nome,
    required this.nota,
  });
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaAlunos(),
    );
  }
}

class TelaAlunos extends StatelessWidget {
  const TelaAlunos({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Aluno> alunos = [
      Aluno(nome: 'Frodo', nota: 9.5),
      Aluno(nome: 'Sam', nota: 7.0),
      Aluno(nome: 'Pippin', nota: 8.2),
      Aluno(nome: 'Merry', nota: 6.8),
      Aluno(nome: 'Gandalf', nota: 10.0),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Alunos'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: alunos.length,
        itemBuilder: (context, index) {
          final Aluno aluno = alunos[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              leading: const Icon(Icons.person, size: 35),
              title: Text(
                aluno.nome,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Nota: ${aluno.nota.toStringAsFixed(1)}'),
            ),
          );
        },
      ),
    );
  }
}
