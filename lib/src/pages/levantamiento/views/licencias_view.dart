import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

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
  fotosLev: [
    File(''),
    File(''),
    File(''),
    File(''),
    File(''),
    File(''),
  ],
);

var tipo = 'Automovilista';
var tipoLicArray = ['Automovilista', 'Chofer', 'Motociclista', 'Chofer Servicio Publico'];

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

    //tipoAtencionField
    final tipoLic = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          flex: 1,
          child: Text("Tipo Licencia"),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: DropdownButton(
              hint: const Text('Selecciona licencia'),
              value: tipo,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: tipoLicArray.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  tipo = newValue.toString();
                });
              },
            ),
          ),
        ),
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
          tipoLic,
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
                  if (noLicenciaController.text == '' || nombreController.text == '') {
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
                  levantamiento.tipo = tipo;
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
