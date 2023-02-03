import 'package:app_todo/tela_2.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<String> list = [
    '1- Lavar louça',
    '2- Varrer chao',
    '3- Fazer almoço',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
        centerTitle: true,
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider(
            thickness: 1,
          );
        },
        padding: const EdgeInsets.all(20),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(10),
            height: 40,
            child: Text(list[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var todo = await Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => const SecondPage(),
          ));
          setState(() {
            list.add(todo);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
