import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../model/levantamiento_model.dart';

class licenciasView extends StatefulWidget {
  final Function(LevantamientoModel)
      addLicencia; // variable referencia al agregarManual de firstStep
  licenciasView(this.addLicencia); //constructor

  @override
  State<licenciasView> createState() => _licenciasViewState();
}

//----------------------------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------Global Variable-------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------------------------------

final noLicenciaFocus = FocusNode();
final tipoFocus = FocusNode();
final vigenciaFocus = FocusNode();
final nombreFocus = FocusNode();

final TextEditingController noLicenciaController = TextEditingController();
final TextEditingController tipoController = TextEditingController();
final TextEditingController vigenciaController = TextEditingController();
final TextEditingController nombreController = TextEditingController();

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

class _licenciasViewState extends State<licenciasView> {
  @override
  Widget build(BuildContext context) {
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------Functions-------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------

    //Funcion que crea TextFields
    Widget buildTextField(
        String hint,
        TextEditingController controller,
        IconData icon,
        bool enable,
        EdgeInsets pad,
        FocusNode Focus,
        FocusNode nextFocus) {
      return TextFormField(
        focusNode: Focus,
        onFieldSubmitted: (value) {
          FocusScope.of(context).requestFocus(nextFocus);
        },
        controller: controller,
        readOnly: enable,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          contentPadding: pad,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }

    void limpiarCeldas() {
      noLicenciaController.text = '';
      tipoController.text = '';
      vigenciaController.text = '';
      nombreController.text = '';
    }

    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------Functions-------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------

    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------Object Variable-------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------

    //vigenciaField
    final vigenciaFieldField = TextFormField(
      readOnly: true,
      controller: vigenciaController,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.access_alarm),
        contentPadding: const EdgeInsets.fromLTRB(05, 0, 05, 0),
        hintText: "Vigencia",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onTap: () async {
        // Get the date
        TimeOfDay? timePicket = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        if (timePicket != null) {
          //make format to the time
          vigenciaController.text = timePicket.format(context).toString();
        }
      },
    );

    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------Object Variable-------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------

    return Container(
        height: 400,
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'Agregar Licencia',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: Colors.blueGrey,
            ),
          ),
          const SizedBox(height: 10),
          buildTextField(
            'No.Licencia',
            noLicenciaController,
            Icons.account_box_sharp,
            false,
            const EdgeInsets.fromLTRB(20, 15, 20, 15),
            noLicenciaFocus,
            tipoFocus,
          ),
          const SizedBox(height: 10),
          buildTextField(
            'Tipo',
            tipoController,
            Icons.contacts_outlined,
            false,
            const EdgeInsets.fromLTRB(20, 15, 20, 15),
            tipoFocus,
            vigenciaFocus,
          ),
          const SizedBox(height: 10),
          vigenciaFieldField,
          const SizedBox(height: 10),
          buildTextField(
            'Nombre',
            nombreController,
            Icons.document_scanner_outlined,
            false,
            const EdgeInsets.fromLTRB(20, 15, 20, 15),
            nombreFocus,
            noLicenciaFocus,
          ),
          const SizedBox(height: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //--------------Boton para agregar licencia
              ElevatedButton(
                onPressed: () {
                  //Validacion
                  if (noLicenciaController.text == '' ||
                      nombreController.text == '') {
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
                  //Asignacion
                  levantamiento.noLicencia = noLicenciaController.text;
                  levantamiento.tipo = tipoController.text;
                  levantamiento.vigencia = vigenciaController.text;
                  levantamiento.nombre = nombreController.text;
                  widget.addLicencia(levantamiento);
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