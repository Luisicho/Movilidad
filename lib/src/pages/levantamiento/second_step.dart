import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:movilidad/src/model/afectado_model.dart';
import 'package:movilidad/src/pages/levantamiento/views/afectado_view.dart';
import 'package:movilidad/src/utils/colors_util.dart';
import 'package:movilidad/src/utils/icono_string_util.dart';

class secondStep extends StatefulWidget {
  //Lista de afectados
  List<AfectadoModel> afectados = [];
  secondStep({super.key});

  @override
  State<secondStep> createState() => _secondStepState();
}

class _secondStepState extends State<secondStep> {
  //------------Variables globales
  

  @override
  Widget build(BuildContext context) {
    //Agrega afectado a un arreglo
    void addAfectado(AfectadoModel afectado) {
      setState(() {
        widget.afectados.add(afectado);
      });
    }

    //Funcion para mostrar el panel para agregar nuevos afectados
    void showAfectadoDialog() {
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) {
            return AlertDialog(
              content: Container(
                padding: const EdgeInsets.all(0),
                width: MediaQuery.of(context).size.width,
                child: afectadoView(addAfectado),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            );
          }
        );
    }

    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 05, 0, 05),        
            height: 50,
            child: 
            const Text(
              "Lista de Afectados",
              style: TextStyle(
                fontSize: 22,
                color: Colors.blueGrey,
                fontWeight: FontWeight.w400,
              ),
            )
          ),
          //Crea lista de afectados
          Expanded(
            flex: 2,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(4),
                  elevation: 8,
                  child: ListTile(
                    leading: getIcon('airline_seat_flat_outlined'),
                    title: Text(
                      widget.afectados[index].nombreAc,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    subtitle: Text(
                      widget.afectados[index].observaciones,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    trailing: Text(
                      widget.afectados[index].fechaRecepcion,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black26,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    onTap: () {
                      
                    },
                  ), 
                );
              },
              itemCount: widget.afectados.length,
            ),
          ),
          //Boton agregar
          Container(
            padding: const EdgeInsets.fromLTRB(0, 05, 0, 05),        
            height: 50,
            child: 
            FloatingActionButton.extended(
              label: const Text("Agregar"),
              backgroundColor: VERDE,
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
