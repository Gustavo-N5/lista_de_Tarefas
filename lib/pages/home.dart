import 'package:flutter/material.dart';
import 'package:to_do/widgets/adicionar_tarefa.dart';

import 'package:to_do/widgets/tarefa.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _list = ["teste"];

  void novaTarefa() {
    showDialog(
      context: context,
      builder: (context) {
        return AdicionarTarefa(
          controller: _controller,
          salvar: () {
            setState(() {
              _list.add(_controller.text);
            });
            _controller.clear();
            Navigator.pop(context);
          },
          cancelar: () => Navigator.pop(context),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // App bar
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: const Text(
          "Tarefas",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tarefas
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Tarefas:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          // Lista de tarefas
          SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _list.length,
              itemBuilder: (context, index) {
                return Tarefa(
                  deletar: () {
                    setState(() {
                      _list.removeAt(index);
                    });
                  },
                  tarefa: _list[index],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[400],
        child: const Icon(Icons.add),
        onPressed: () => novaTarefa(),
      ),
    );
  }
}
