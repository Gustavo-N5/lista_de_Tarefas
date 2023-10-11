import 'package:flutter/material.dart';

class AdicionarTarefa extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback salvar;
  final VoidCallback cancelar;
  const AdicionarTarefa(
      {super.key,
      required this.controller,
      required this.salvar,
      required this.cancelar});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 200,
        child: Column(
          children: [
            // campo de tarefa
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Nome da Tarefa",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //Cancelar
                MaterialButton(
                  color: Colors.blue[300],
                  onPressed: cancelar,
                  child: const Text("Cancelar"),
                ),
                // Separar os botoes
                const SizedBox(
                  width: 10,
                ),
                //Salvar
                MaterialButton(
                  onPressed: salvar,
                  child: const Text("Salvar"),
                  color: Colors.blue[300],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
