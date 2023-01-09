import 'package:flutter/material.dart';
import 'package:movilidad/src/model/vehiculos_model.dart';
import 'package:movilidad/src/pages/levantamiento/views/vehiculo_view.dart';

import '../../utils/colors_util.dart';
import '../../utils/icono_string_util.dart';

class secondStep extends StatefulWidget {
  List<VehiculoModel> vehiculos = [];
  secondStep({super.key});

  @override
  State<secondStep> createState() => _secondStepState();
}

class _secondStepState extends State<secondStep> {
  @override
  Widget build(BuildContext context) {
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------Funciones-------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //Agrega vehiculo a un arreglo
    void addVehiculo(VehiculoModel vehiculo) {
      setState(() {
        widget.vehiculos.add(vehiculo);
      });
    }

    //Funcion para mostrar el panel para agregar nuevos vehiculos
    void showVehiculoDialog() {
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) {
            return AlertDialog(
              content: Container(
                padding: const EdgeInsets.all(0),
                width: MediaQuery.of(context).size.width,
                child: vehiculoView(addVehiculo),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 05, 0, 05),        
            height: 50,
            child: 
            const Text(
              "Lista de Vehiculos afectados",
              style: TextStyle(
                fontSize: 30,
                color: NEGRO,
                fontWeight: FontWeight.bold,
              ),
            )
          ),
          //Crea lista de vehiculos
          Expanded(
            flex: 2,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(4),
                  elevation: 8,
                  child: ListTile(
                    leading: getIcon('car_crash'),
                    title: Text(
                      widget.vehiculos[index].descripcion!,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    subtitle: Text(
                      widget.vehiculos[index].concecionario!,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    trailing: Text(
                      widget.vehiculos[index].licencia!,
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
              itemCount: widget.vehiculos.length,
            ),
          ),
          //Boton agregar
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //--------------Boton para agregar Vehiculo
              ElevatedButton(
                onPressed: () {
                  showVehiculoDialog();
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