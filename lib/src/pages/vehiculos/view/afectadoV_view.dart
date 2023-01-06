import 'package:flutter/material.dart';
import 'package:movilidad/src/model/afectado_model.dart';
import 'package:movilidad/src/pages/levantamiento/views/afectado_view.dart';

import '../../../providers/levantamiento_provider.dart';

class accidentadoVView extends StatefulWidget {
  final String nombre; //Caracteristica folio

  accidentadoVView(this.nombre); //Constructor

  @override
  State<accidentadoVView> createState() => _accidentadoVViewState();
}

//----------------------------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------Variable Globales-------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------------------------------

TextEditingController nombreController = TextEditingController();
TextEditingController observacionesController = TextEditingController();

//Generales
var atencion = 'En sitio/ambulancia';
var listaAtencion = ['En sitio/ambulancia', 'Hospitalizacion', 'Defuncion'];

//----------------------------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------Variable Globales-------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------------------------------

class _accidentadoVViewState extends State<accidentadoVView> {
  @override
  Widget build(BuildContext context) {
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------Variable local-------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------

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

    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------Variable local-------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------

    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------Funciones-------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------

    //Funcion que crea TextFields
    Widget buildTextField(String hint, TextEditingController controller,
        IconData icon, bool enable, EdgeInsets pad) {
      return TextFormField(
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

    //Funcion que crea lista nueva
    Widget _CargarDatos() {
      //Widget Future para crear lista a futuro luego de resivir la informacion
      return FutureBuilder(
        future: levantamientoProvider.cargarData(),
        initialData: [],
        builder: (context, snapshot) {
          AfectadoModel tempAfec = AfectadoModel(
              aseguradora: '',
              poliza: '',
              vigencia: '',
              nombreAc: '',
              curp: '',
              domicilio: '',
              tipoAtencion: '',
              institucionMedica: '',
              fechaRecepcion: '',
              horaRecepcion: '',
              fechaAlta: '',
              horaAlta: '',
              observaciones: '',
              icon: '');
          snapshot.data!.where((element) {
            final nombre = element['nombre'];
            final input = widget.nombre;

            return nombre.contains(input);
          }).forEach((element) {
            //Actualiza objeto
            observacionesController.text = element['descripcion'];
            nombreController.text = element['nombre'];
            atencion = element['tipoAtencion'];
          });

          return Container(
              height: 400,
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    const Text(
                      'Afectado',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.blueGrey,
                      ),
                    ),
                    const SizedBox(height: 10),
                    buildTextField(
                      'Nombre Afectado',
                      nombreController,
                      Icons.attribution_outlined,
                      true,
                      const EdgeInsets.fromLTRB(20, 15, 05, 15),
                    ),
                    buildTextField(
                      'Observacion',
                      observacionesController,
                      Icons.bar_chart_outlined,
                      true,
                      const EdgeInsets.fromLTRB(20, 15, 05, 15),
                    ),
                    tipoAtencionField,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Aceptar'),
                        ),
                      ],
                    ),
                  ])));
        },
      );
    }

    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------Funciones-------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------

    return _CargarDatos();
  }
}
