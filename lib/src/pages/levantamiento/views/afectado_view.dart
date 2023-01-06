
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import 'package:movilidad/src/model/afectado_model.dart';
import 'package:movilidad/src/providers/afectadoView_provider.dart';
import 'package:movilidad/src/utils/colors_util.dart';

class afectadoView extends StatefulWidget {
  //variables
  final Function(AfectadoModel)
      addAfectado; // variable referencia al addAfectado de secondStep
  afectadoView(
      this.addAfectado); // constructor que resive referencia de la funcion addAfectado de secondStep

  @override
  State<afectadoView> createState() => _afectadoViewState();
}

//-----------Variables globales
// Focus Nodes
//Step2
final polizaFocus = FocusNode();
final vigenciaFocus = FocusNode();
final tipoAFocus = FocusNode();
final nombreAFocus = FocusNode();
final CURPFocus = FocusNode();
final domicilioFocus = FocusNode();
final descripcionFocus = FocusNode();

// editing controller
final TextEditingController polizaController = TextEditingController();
final TextEditingController vigenciaController = TextEditingController();
final TextEditingController nombreAcController = TextEditingController();
final TextEditingController CURPController = TextEditingController();
final TextEditingController domicilioController = TextEditingController();
final TextEditingController fechaRecepcionController = TextEditingController();
final TextEditingController hourRecepcionController = TextEditingController();
final TextEditingController fechaAltaController = TextEditingController();
final TextEditingController hourAltaController = TextEditingController();
final TextEditingController descripcionController = TextEditingController();
final TextEditingController tipoARController = TextEditingController();

//Generales
String? aseguradora;

String? institucionMed;

//Generales
var atencion = 'En sitio/ambulancia';
var listaAtencion = ['En sitio/ambulancia', 'Hospitalizacion', 'Defuncion'];

class _afectadoViewState extends State<afectadoView> {
  //----------------Variables Locales

  @override
  Widget build(BuildContext context) {
    /* A MEJORAR
      Se puede crear funcion que cree Fileds donde se pase nombre de field, icono y controlador asi reducimos codigo

    */

//----------------------------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------Proveedores, Funciones-------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------------------------------

    //Funcion que crea dropdownNuevo
    Widget _listaMedica() {
      //Widget Future para crear lista a futuro luego de resivir la informacion
      return FutureBuilder(
          future: afectadoViewProvider.cargarDataMedica(),
          initialData: [],
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //Variable que contiene la informacion
              var data = snapshot.data!;
              //Lista temporal con la informacion para los dropdown
              List<DropdownMenuItem> tempList = [];
              data.forEach((element) {
                tempList.add(DropdownMenuItem(
                  child: Text(element['nom_estab']),
                  value: element['nom_estab'],
                ));
              });
              //Retrona objeto dropdown
              return DropdownButton(
                hint: const Text('Selecciona Institucion'),
                value: institucionMed,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: tempList,
                onChanged: (newValue) {
                  setState(() {
                    institucionMed = newValue.toString();
                  });
                },
              );
            }
            return const Text('no data');
          });
    }

    Widget _listaAseguradora() {
      return FutureBuilder(
          future: afectadoViewProvider.cargarDataAseguradora(),
          initialData: [],
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //Variable que contiene la informacion
              var data = snapshot.data!;
              //Lista temporal con la informacion para los dropdown
              List<DropdownMenuItem> tempList = [];
              data.forEach((element) {
                tempList.add(DropdownMenuItem(
                  child: Text(element['nombre']),
                  value: element['nombre'],
                ));
              });
              //Retrona objeto dropdown
              return DropdownButton(
                hint: const Text('Selecciona Aseguradora'),
                value: aseguradora,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: tempList,
                onChanged: (newValue) {
                  setState(() {
                    aseguradora = newValue.toString();
                  });
                },
              );
            }
            return const Text('no data');
          });
    }

    //Funcion que crea TextFields
    Widget buildTextField(
        String hint,
        TextEditingController controller,
        IconData icon,
        bool enable,
        EdgeInsets pad,
        int flexInt,
        FocusNode focus,
        FocusNode nextFocus) {
      return Expanded(
        flex: flexInt,
        child: TextFormField(
          focusNode: focus,
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
        ),
      );
    }

    void limpiarCeldas() {
      polizaController.text = "";
      vigenciaController.text = "";
      nombreAcController.text = "";
      CURPController.text = "";
      vigenciaController.text = "";
      domicilioController.text = "";
      tipoARController.text = "";
      fechaRecepcionController.text = "";
      hourRecepcionController.text = "";
      fechaAltaController.text = "";
      hourAltaController.text = "";
      descripcionController.text = "";
    }
//----------------------------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------Proveedores, Funciones-------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------------------------------

//----------------------------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------Variables Locales-------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------------------------------

    //polizaField
    final polizaField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildTextField(
            'Poliza',
            polizaController,
            Icons.article_outlined,
            false,
            const EdgeInsets.fromLTRB(20, 15, 20, 15),
            1,
            polizaFocus,
            vigenciaFocus),
        const SizedBox(width: 20),
      ],
    );

    //vigenciaField
    final vigenciaField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: TextFormField(
            readOnly: true,
            focusNode: vigenciaFocus,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(nombreAFocus);
            },
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
              );
              if (datePicket != null) {
                //make format to the date
                var formatedDate = DateFormat("dd-MM-yyyy").format(datePicket);
                vigenciaController.text = formatedDate.toString();
              }
            },
          ),
        ),
      ],
    );

    //nombreAcField
    final nombreAcField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildTextField(
            'Nombre Accidentado',
            nombreAcController,
            Icons.attribution_outlined,
            false,
            const EdgeInsets.fromLTRB(20, 15, 05, 15),
            1,
            nombreAFocus,
            CURPFocus),
      ],
    );

    //CURPField
    final CURPField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildTextField(
            'CURP',
            CURPController,
            Icons.badge_outlined,
            false,
            const EdgeInsets.fromLTRB(20, 15, 20, 15),
            1,
            CURPFocus,
            domicilioFocus),
      ],
    );

    //DomicilioField
    final domicilioField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildTextField(
            'Domicilio',
            domicilioController,
            Icons.add_home_outlined,
            false,
            const EdgeInsets.fromLTRB(20, 15, 20, 15),
            1,
            domicilioFocus,
            tipoAFocus),
      ],
    );

    //DateRecepcionField
    final dateRecepcionField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Fecha Recepción"),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: TextFormField(
            readOnly: true,
            controller: fechaRecepcionController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.calendar_today),
              contentPadding: const EdgeInsets.fromLTRB(05, 0, 05, 0),
              hintText: "Fecha",
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
                fechaRecepcionController.text = formatedDate.toString();
              }
            },
          ),
        ),
        const SizedBox(width: 20),
      ],
    );

    //HourRecepcionField
    final hourRecepcionField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Hora"),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: TextFormField(
            readOnly: true,
            controller: hourRecepcionController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.access_alarm),
              contentPadding: const EdgeInsets.fromLTRB(05, 0, 05, 0),
              hintText: "Hora",
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
                //var formatedDate = DateFormat("dd-MM-yyyy").format(datePicket);
                hourRecepcionController.text =
                    timePicket.format(context).toString();
              }
            },
          ),
        ),
        const SizedBox(width: 100),
      ],
    );

    //DateAltaField
    final dateAltaField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Fecha Alta"),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: TextFormField(
            readOnly: true,
            controller: fechaAltaController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.calendar_today),
              contentPadding: const EdgeInsets.fromLTRB(05, 0, 05, 0),
              hintText: "Fecha",
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
                fechaAltaController.text = formatedDate.toString();
              }
            },
          ),
        ),
        const SizedBox(width: 20),
      ],
    );

    //HourAltaField
    final hourAltaField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Hora"),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: TextFormField(
            readOnly: true,
            controller: hourAltaController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.access_alarm),
              contentPadding: const EdgeInsets.fromLTRB(05, 0, 05, 0),
              hintText: "Hora",
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
                //var formatedDate = DateFormat("dd-MM-yyyy").format(datePicket);
                hourAltaController.text = timePicket.format(context).toString();
              }
            },
          ),
        ),
        const SizedBox(width: 100),
      ],
    );

    //tipoAtencionField
    final tipoAtencionField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          flex: 1,
          child: Text("Tipo Atencion"),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: DropdownButton(
              hint: const Text('Tipo Atencion'),
              value: atencion,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: listaAtencion.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  atencion = newValue.toString();
                });
              },
            ),
          ),
        ),
      ],
    );

    //aseguradoraField
    final aseguradoraField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Aseguradora"),
        const SizedBox(width: 10),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: _listaAseguradora(),
          ),
        ),
      ],
    );

    //institucionMedField
    final institucionMedField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          flex: 2,
          child: Text("Institucion Medica")
        ),
        Expanded(
          flex: 10,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: _listaMedica(),
          ),
        ),
      ],
    );

    //DescripcionField
    final descripcionField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildTextField(
            'Descripcion',
            descripcionController,
            Icons.bar_chart_outlined,
            false,
            const EdgeInsets.fromLTRB(20, 15, 05, 30),
            4,
            descripcionFocus,
            descripcionFocus),
      ],
    );

//----------------------------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------Variables Locales-------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------------------------------

    //----Return
    return Container(
      height: 800,
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child:
            //---------------Column
            Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Agregar Afectado',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: NEGRO,
              ),
            ),
            const SizedBox(height: 10),
            aseguradoraField,
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(flex: 2, child: polizaField),
                Expanded(flex: 1, child: vigenciaField),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(height: 10),
            nombreAcField,
            const SizedBox(height: 10),
            CURPField,
            const SizedBox(height: 10),
            domicilioField,
            const SizedBox(height: 10),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(height: 10),
            tipoAtencionField,
            const SizedBox(height: 10),
            institucionMedField,
            const SizedBox(height: 10),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: dateRecepcionField),
                Expanded(flex: 1, child: hourRecepcionField),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: dateAltaField),
                Expanded(flex: 1, child: hourAltaField),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(height: 10),
            descripcionField,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //--------------Boton para agregar Afectado
                ElevatedButton(
                  onPressed: () {
                    try {
                      if (nombreAcController.text.isEmpty) {
                        //-------------Toast
                        Fluttertoast.showToast(
                            msg: "Se necesita el nombre",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        //-------------Toast
                        return;
                      }
                      //Funcion agregar afectado
                      final afectado = AfectadoModel(
                        aseguradora: aseguradora,
                        poliza: polizaController.text,
                        vigencia: vigenciaController.text,
                        nombreAc: nombreAcController.text,
                        curp: CURPController.text,
                        domicilio: domicilioController.text,
                        tipoAtencion: tipoARController.text,
                        institucionMedica: institucionMed,
                        fechaRecepcion: fechaRecepcionController.text,
                        horaRecepcion: hourRecepcionController.text,
                        fechaAlta: fechaAltaController.text,
                        horaAlta: hourAltaController.text,
                        observaciones: descripcionController.text,
                        icon: 'accessible_outlined',
                      );
                      limpiarCeldas();
                      //Agrega afectado
                      widget.addAfectado(afectado);
                      //-------------Toast
                      Fluttertoast.showToast(
                          msg: "Se agrego correctamente",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      //-------------Toast
                      Navigator.of(context).pop();
                    } catch (e) {
                      //-------------Toast
                      Fluttertoast.showToast(
                          msg: "Error al agregar",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      //-------------Toast
                    }
                  },
                  child: const Text('Agregar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
