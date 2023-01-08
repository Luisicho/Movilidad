import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:movilidad/src/model/vehiculos_model.dart';

import '../../../model/levantamiento_model.dart';

class vehiculoView extends StatefulWidget {
  //variables
  final Function(VehiculoModel)addVehiculo; // variable referencia al addAfectado de secondStep
  vehiculoView(this.addVehiculo); // constructor que resive referencia de la funcion addAfectado de secondStep

  @override
  State<vehiculoView> createState() => _vehiculoViewState();
}

//----------------------------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------Global Variable-------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------------------------------
//Placas
final noEconomicoFocus = FocusNode();
final placasFocus = FocusNode();
final descripcionFocus = FocusNode();
final conceFocus = FocusNode();
//licencia
final noLicenciaFocus = FocusNode();
final tipoFocus = FocusNode();
final vigenciaFocus = FocusNode();
final nombreFocus = FocusNode();

//licencia
final TextEditingController noLicenciaController = TextEditingController();
final TextEditingController tipoController = TextEditingController();
final TextEditingController vigenciaController = TextEditingController();
final TextEditingController nombreController = TextEditingController();
//Placas
final TextEditingController noEconomicoController = TextEditingController();
final TextEditingController placasController = TextEditingController();
final TextEditingController descripcionController = TextEditingController();
final TextEditingController conceController = TextEditingController();

String VehiRespondable = "1";
final VehiculoModel vehiculo = VehiculoModel();

//----------------------------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------Global Variable-------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------------------------------


class _vehiculoViewState extends State<vehiculoView> {
  @override
  Widget build(BuildContext context) {
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------Functions-------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    void limpiarCeldas() {
      //NoEconomico
      noEconomicoController.text = '';
      placasController.text = '';
      descripcionController.text = '';
      conceController.text = '';
      //Licencia
      noLicenciaController.text = '';
      tipoController.text = '';
      vigenciaController.text = '';
      nombreController.text = '';
    }

    //Funcion que crea TextFields Con Focus
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
                ? buildTextField(
                  'NoEconomico', 
                  noEconomicoController,
                  Icons.all_inbox, 
                  false,
                  const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  noEconomicoFocus,
                  descripcionFocus)
                : buildTextField(
                  'NoEconomico', 
                  noEconomicoController,
                  Icons.all_inbox, 
                  true,
                  const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  noEconomicoFocus,
                  descripcionFocus)),
        const SizedBox(width: 05),
        Expanded(
            flex: 1,
            child: VehiRespondable == "2"
                ? buildTextField(
                  'Placas', 
                  placasController, 
                  Icons.calendar_view_week, 
                  false,
                  const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  placasFocus,
                  descripcionFocus)
                : buildTextField(
                  'Placas', 
                  placasController,
                  Icons.calendar_view_week, 
                  true,
                  const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  placasFocus,
                  descripcionFocus)),
      ],
    );

    //vigenciaField
    final vigenciaFieldField = TextFormField(
      readOnly: true,
      controller: vigenciaController,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.calendar_today),
        contentPadding: const EdgeInsets.fromLTRB(05, 0, 05, 0),
        hintText: "Vigencia",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onTap: () async {
        // Get the date
        DateTime? datePicket = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1999),
          lastDate: DateTime(2050),
          locale: const Locale('es', 'ES'),
        );
        if (datePicket != null) {
          //make format to the date
          var formatedDate = DateFormat("dd-MM-yyyy").format(datePicket);
          vigenciaController.text = formatedDate.toString();
        }
      },
    );

    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------Object Variable-------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------

    return Container(
      height: 650,
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Agregar Vehiculo',
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
            buildTextField(
              'Descripcion', 
              descripcionController,
              Icons.assessment_outlined, 
              false,
              const EdgeInsets.fromLTRB(20, 15, 20, 15),
              descripcionFocus,
              conceFocus),
            const SizedBox(height: 10),
            buildTextField(
              'Concensionario / Particular', 
              conceController,
              Icons.account_circle_outlined, 
              false,
              const EdgeInsets.fromLTRB(20, 15, 20, 15),
              conceFocus,
              noLicenciaFocus),
            const SizedBox(height: 10),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(height: 10),
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
                //--------------Boton para agregar Afectado
                ElevatedButton(
                  onPressed: () {
                    //Placas
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
                      vehiculo.noeconomico = noEconomicoController.text;
                      vehiculo.placas = '';
                    }
                    if (placasController.text != '') {
                      //Actualiza objeto para enviar a vista firststep
                      vehiculo.placas = placasController.text;
                      vehiculo.noeconomico = '';
                    }
                    //Asignacion
                    vehiculo.concecionario = conceController.text;
                    vehiculo.descripcion = descripcionController.text;

                    //------------------LICENCIAS----------------
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
                    vehiculo.licencia = noLicenciaController.text;
                    vehiculo.tipo = tipoController.text;
                    vehiculo.vigencia = vigenciaController.text;
                    vehiculo.nombre = nombreController.text;

                    widget.addVehiculo(vehiculo);
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
              ]
            ),
        ],
        ),
      )
    );
  }
}