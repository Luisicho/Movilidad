import 'package:flutter/material.dart';

import 'package:movilidad/src/model/afectado_model.dart';
import 'package:movilidad/src/pages/levantamiento/views/afectado_view.dart';
import 'package:movilidad/src/utils/colors_util.dart';
import 'package:movilidad/src/utils/icono_string_util.dart';

class thirdStep extends StatefulWidget {
  //Lista de afectados
  List<AfectadoModel> afectados = [];
  thirdStep({super.key});

  @override
  State<thirdStep> createState() => _thirdStepState();
}

class _thirdStepState extends State<thirdStep> {
  @override
  Widget build(BuildContext context) {

    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------Funciones-------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
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

    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------Funciones-------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------


    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              "assets/Secretaria-de-Movilidad-01.jpg",
            ),
            fit: BoxFit.fitWidth),
      ),
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
                fontSize: 30,
                color: NEGRO,
                fontWeight: FontWeight.bold,
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
                      widget.afectados[index].nombreAc!,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    subtitle: Text(
                      widget.afectados[index].observaciones!,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    trailing: Text(
                      widget.afectados[index].fechaRecepcion!,
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //--------------Boton para agregar Vehiculo
              ElevatedButton(
                onPressed: () {
                  showAfectadoDialog();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: VERDE,
                  textStyle: const TextStyle(
                    color: Colors.white,
                  )
                ),
                child: const Text('Agregar'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
