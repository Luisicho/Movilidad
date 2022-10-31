import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:movilidad/levantamiento/model/afectado.dart';
import 'package:movilidad/levantamiento/views/afectado_view.dart';

class secondStep extends StatefulWidget {
  const secondStep({super.key});

  @override
  State<secondStep> createState() => _secondStepState();
}

class _secondStepState extends State<secondStep> {
  //------------Variables globales
  //Lista de afectados
  List<Afectado> afectados = [];

  @override
  Widget build(BuildContext context) {
    void addAfectado(Afectado afectado) {
      setState(() {
        afectados.add(afectado);
      });
    }

    //Funcion para mostrar el panel para agregar nuevos afectados
    void showAfectadoDialog() {
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              content: Container(
                padding: EdgeInsets.all(0),
                width: MediaQuery.of(context).size.width * 0.45,
                child: afectadoView(addAfectado),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            );
          });
    }

    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //Crea lista de afectados
          Expanded(
            flex: 2,
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.all(4),
                  elevation: 8,
                  child: ListTile(
                    title: Text(
                      afectados[index].nombreAc,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    subtitle: Text(
                      afectados[index].fechaRecepcion,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    trailing: Text(
                      afectados[index].horaRecepcion,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black26,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                );
              },
              itemCount: afectados.length,
            ),
          ),
          //Boton agregar
          Expanded(
            flex: 1,
            child: 
            FloatingActionButton.extended(
              label: Text("Agregar"),
              onPressed: () {
                showAfectadoDialog();
              }
            ),
          ),
        ],
      ),
    );
  }
}
