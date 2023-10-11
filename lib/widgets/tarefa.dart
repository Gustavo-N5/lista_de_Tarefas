// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Tarefa extends StatefulWidget {
  final VoidCallback deletar;
  final String tarefa;

  const Tarefa({
    Key? key,
    required this.deletar,
    required this.tarefa,
  }) : super(key: key);

  @override
  State<Tarefa> createState() => _TarefaState();
}

class _TarefaState extends State<Tarefa> {
  bool tarefaFinalizada = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[300],
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            // Checkbox
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Checkbox(
                value: tarefaFinalizada,
                onChanged: (value) {
                  setState(() {
                    tarefaFinalizada = !tarefaFinalizada;
                  });
                },
                activeColor: Colors.green,
              ),
            ),
            //
            SizedBox(
              width: 200,
              child: Text(
                widget.tarefa,
                style: TextStyle(
                  decoration: tarefaFinalizada
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              width: 140,
            ),
            IconButton(
                onPressed: widget.deletar,
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ))
          ],
        ),
      ),
    );
  }
}
