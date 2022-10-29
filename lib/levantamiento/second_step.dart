import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:movilidad/levantamiento/views/afectado_view.dart';

class secondStep extends StatefulWidget {
  const secondStep({super.key});

  @override
  State<secondStep> createState() => _secondStepState();
}

class _secondStepState extends State<secondStep> {
  @override
  Widget build(BuildContext context) {
    //Funcion para mostrar el panel para agregar nuevos afectados
    void showAfectadoDialog() {
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              content: Container(
                padding: EdgeInsets.all(0),
                width: MediaQuery.of(context).size.width * 0.45,
                child: afectadoView(),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            );
          });
    }

    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      child: FloatingActionButton(
        child: Text("Agregar"),
        onPressed: () {
          showAfectadoDialog();
        }
      ),
    );
  }
}
