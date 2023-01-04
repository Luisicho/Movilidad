import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:movilidad/src/providers/db_provider.dart';

class placasEcoView extends StatefulWidget {
  final Function(LevantamientoModel)
      addModel; // variable referencia al agregarManual de firstStep
  placasEcoView(this.addModel); //constructor

  @override
  State<placasEcoView> createState() => _placasEcoViewState();
}

//----------------------------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------Global Variable-------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------------------------------

final TextEditingController noEconomicoController = TextEditingController();
final TextEditingController placasController = TextEditingController();
final TextEditingController descripcionController = TextEditingController();
final TextEditingController conceController = TextEditingController();

String VehiRespondable = "1";
final LevantamientoModel levantamiento = LevantamientoModel(
  folio: '',
  fechaLlegada: '',
  horaLlegada: '',
  horaAccidente: '',
  ubicacion: '',
  entre: '',
  y: '',
  entre2: '',
  longitud: '',
  latitud: '',
  noEconomico: '',
  placas: '',
  descripcion: '',
  concesionario: '',
  noLicencia: '',
  tipo: '',
  nombre: '',
  vigencia: '',
  fotosLev: [
    File(''),
    File(''),
    File(''),
    File(''),
    File(''),
    File(''),
  ],
  icon: 'car_crash',
);

//----------------------------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------Global Variable-------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------------------------------

class _placasEcoViewState extends State<placasEcoView> {
  @override
  Widget build(BuildContext context) {
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------Functions-------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    void limpiarCeldas() {
      noEconomicoController.text = '';
      placasController.text = '';
      descripcionController.text = '';
      conceController.text = '';
    }

    //Funcion que crea TextFields
    Widget buildTextField(String hint, TextEditingController controller,
        IconData icon, bool enable) {
      return TextFormField(
        controller: controller,
        readOnly: enable,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }

    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------Functions-------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------

    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------Object Variable-------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------

    //VehiculoField
    final vehiculoField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: RadioListTile(
            title: const Text("Servicio Publico"),
            value: "1",
            groupValue: VehiRespondable,
            onChanged: (value) {
              setState(() {
                VehiRespondable = value.toString();
                noEconomicoController.text = "";
                placasController.text = "";
              });
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: RadioListTile(
            title: const Text("Particular"),
            value: "2",
            groupValue: VehiRespondable,
            onChanged: (value) {
              setState(() {
                VehiRespondable = value.toString();
                noEconomicoController.text = "";
                placasController.text = "";
              });
            },
          ),
        ),
      ],
    );

    final placasField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            flex: 1,
            child: VehiRespondable == "1"
                ? buildTextField('NoEconomico', noEconomicoController,
                    Icons.all_inbox, false)
                : buildTextField('NoEconomico', noEconomicoController,
                    Icons.all_inbox, true)),
        const SizedBox(width: 05),
        Expanded(
            flex: 1,
            child: VehiRespondable == "2"
                ? buildTextField(
                    'Placas', placasController, Icons.calendar_view_week, false)
                : buildTextField('Placas', placasController,
                    Icons.calendar_view_week, true)),
      ],
    );

    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------Object Variable-------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------

    return Container(
        height: 400,
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
            child:
                //---------------Column
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'Agregar Afectado',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: Colors.blueGrey,
            ),
          ),
          vehiculoField,
          const SizedBox(height: 10),
          placasField,
          const SizedBox(height: 10),
          buildTextField('Descripcion', descripcionController,
              Icons.assessment_outlined, false),
          const SizedBox(height: 10),
          buildTextField('Concensionario / Particular', conceController,
              Icons.account_circle_outlined, false),
          const SizedBox(height: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //--------------Boton para agregar Afectado
              ElevatedButton(
                onPressed: () {
                  //Validacion
                  if (noEconomicoController.text == '' &&
                      placasController.text == '') {
                    //-------------Toast
                    Fluttertoast.showToast(
                        msg: "Campos vacios",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    //-------------Toast
                    return;
                  }
                  if (noEconomicoController.text != '') {
                    //Actualiza objeto para enviar a vista firststep
                    levantamiento.noEconomico = noEconomicoController.text;
                    levantamiento.placas = '';
                  }
                  if (placasController.text != '') {
                    //Actualiza objeto para enviar a vista firststep
                    levantamiento.placas = placasController.text;
                    levantamiento.noEconomico = '';
                  }
                  //Asignacion
                  levantamiento.concesionario = conceController.text;
                  levantamiento.descripcion = descripcionController.text;
                  widget.addModel(levantamiento);
                  //-------------Toast
                  Fluttertoast.showToast(
                      msg: "Se agrego manualmente",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  //-------------Toast
                  limpiarCeldas();
                  Navigator.of(context).pop();
                },
                child: const Text('Agregar'),
              ),
            ],
          ),
        ])));
  }
}
