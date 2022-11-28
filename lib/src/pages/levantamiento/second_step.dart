import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:movilidad/src/pages/levantamiento/model/afectado.dart';
import 'package:movilidad/src/pages/levantamiento/views/afectado_view.dart';

class secondStep extends StatefulWidget {
  //Lista de afectados
  List<Afectado> afectados = [];
  secondStep({super.key});

  @override
  State<secondStep> createState() => _secondStepState();
}

class _secondStepState extends State<secondStep> {
  //------------Variables globales
  

  @override
  Widget build(BuildContext context) {
    void addAfectado(Afectado afectado) {
      setState(() {
        widget.afectados.add(afectado);
      });
    }

    //Funcion para mostrar el panel para agregar nuevos afectados
    void showAfectadoDialog() {
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              content: Container(
                padding: const EdgeInsets.all(0),
                width: MediaQuery.of(context).size.width * 0.45,
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
              itemBuilder: (ctx, index) {
                return Card(
                  margin: const EdgeInsets.all(4),
                  elevation: 8,
                  child: ListTile(
                    title: Text(
                      widget.afectados[index].nombreAc,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    subtitle: Text(
                      widget.afectados[index].fechaRecepcion,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    trailing: Text(
                      widget.afectados[index].horaRecepcion,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black26,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    onTap: () {
                      //-------------Toast
                      Fluttertoast.showToast(
                      msg: 'Holaaa hago algo',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                     //-------------Toast
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
