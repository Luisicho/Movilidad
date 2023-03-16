import 'package:flutter/material.dart';
import 'package:movilidad/src/model/afectado_model.dart';
import 'package:intl/intl.dart';

import '../../../providers/levantamiento_provider.dart';

class accidentadoVView extends StatefulWidget {
  final String curp; //Caracteristica folio

  accidentadoVView(this.curp); //Constructor

  @override
  State<accidentadoVView> createState() => _accidentadoVViewState();
}

//----------------------------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------Variable Globales-------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------------------------------

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
final TextEditingController aseguradoraController = TextEditingController();
final TextEditingController institucionMController = TextEditingController();

//Generales
var atencion = 'En sitio/ambulancia';
var listaAtencion = ['En sitio/ambulancia', 'Hospitalizacion', 'Defuncion'];

//----------------------------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------Variable Globales-------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------------------------------

class _accidentadoVViewState extends State<accidentadoVView> {
  @override
  Widget build(BuildContext context) {
    //Funcion que crea TextFields
    Widget buildTextField(String hint, TextEditingController controller,
        IconData icon, bool enable, EdgeInsets pad) {
      return TextFormField(
        controller: controller,
        readOnly: enable,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(icon,color: Colors.black),
          contentPadding: pad,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 1.5,
            ),
          ),
        ),
      );
    }

    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------Variable local-------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------

    //tipoAtencionField
    final tipoAtencionField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          flex: 1,
          child: Text("Tipo Atencion",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: DropdownButton(
              underline: Container(
                height: 2,
                color: Colors.black,
              ),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
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

    //polizaField
    final polizaField = Row(
      mainAxisAlignment: MainAxisAlignment.center, 
      children: [
        const Expanded(
          flex: 2,
          child: Text("Poliza",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 10,
          child: buildTextField(
            'Poliza',
            polizaController,
            Icons.article_outlined,
            true,
            const EdgeInsets.fromLTRB(10, 05, 10, 05),
          )
        ),
        const SizedBox(width: 50),
      ]
    );

    //vigenciaField
    final vigenciaField = Row(
      mainAxisAlignment: MainAxisAlignment.center, 
      children: [
        const Expanded(
          flex: 1,
          child: Text("Vigencia",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: buildTextField(
            'Vigencia',
            vigenciaController,
            Icons.calendar_today,
            true,
            const EdgeInsets.fromLTRB(10, 05, 10, 05),
          )
        ),
      ]
    );

    //nombreAcField
    final nombreAcField = Row(
      mainAxisAlignment: MainAxisAlignment.center, 
      children: [
        const Expanded(
          flex: 2,
          child: Text("Nombre",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 10,
          child: buildTextField(
            'Nombre Accidentado',
            nombreAcController,
            Icons.attribution_outlined,
            true,
            const EdgeInsets.fromLTRB(10, 05, 10, 05),
          )
        ),
      ]
    );

    //CURPField
    final CURPField = Row(
      mainAxisAlignment: MainAxisAlignment.center, 
      children: [
        const Expanded(
          flex: 2,
          child: Text("CURP",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 10,
          child: buildTextField(
            'CURP',
            CURPController,
            Icons.badge_outlined,
            true,
            const EdgeInsets.fromLTRB(10, 05, 10, 05),
          )
        ),
      ]
    );

    //DomicilioField
    final domicilioField = Row(
      mainAxisAlignment: MainAxisAlignment.center, 
      children: [
        const Expanded(
          flex: 2,
          child: Text("Domicilio",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 10,
          child: buildTextField(
            'Domicilio',
            domicilioController,
            Icons.add_home_outlined,
            true,
            const EdgeInsets.fromLTRB(10, 05, 10, 05),
          )
        ),
      ]
    );

    //DateRecepcionField
    final dateRecepcionField = Row(
      mainAxisAlignment: MainAxisAlignment.center, 
      children: [
        const Expanded(
          flex: 4,
          child: Text("Fecha Recepción",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 5,
          child: buildTextField(
            'Fecha Recepción',
            fechaRecepcionController,
            Icons.calendar_today,
            true,
            const EdgeInsets.fromLTRB(10, 05, 10, 05),
          )
        ),
        const SizedBox(width: 50),
      ]
    );

    //HourRecepcionField
    final hourRecepcionField = Row(
      mainAxisAlignment: MainAxisAlignment.center, 
      children: [
        const Expanded(
          flex: 4,
          child: Text("Hora Recepción",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 5,
          child: buildTextField(
            'Hora Recepción',
            fechaRecepcionController,
            Icons.access_alarm,
            true,
            const EdgeInsets.fromLTRB(10, 05, 10, 05),
          )
        ),
        const SizedBox(width: 50),
      ]
    );

    //DateAltaField
    final dateAltaField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          flex: 4,
          child: Text("Fecha Alta",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 5,
          child: TextFormField(
            readOnly: true,
            controller: fechaAltaController,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.calendar_today),
              contentPadding: const EdgeInsets.fromLTRB(05, 0, 05, 0),
              hintText: "Fecha Alta",
              
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 1.5,
                ),
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
        const SizedBox(width: 50),
      ],
    );

    //HourAltaField
    final hourAltaField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          flex: 4,
          child: Text("Hora Alta",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 5,
          child: TextFormField(
            readOnly: true,
            controller: hourAltaController,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.access_alarm),
              contentPadding: const EdgeInsets.fromLTRB(05, 0, 05, 0),
              hintText: "Hora Alta",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 1.5,
                ),
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
        const SizedBox(width: 50),
      ],
    );

    //aseguradoraField
    final aseguradoraField = Row(
      mainAxisAlignment: MainAxisAlignment.center, 
      children: [
        const Expanded(
          flex: 2,
          child: Text("Aseguradora",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 10,
          child: buildTextField(
            'Aseguradora',
            aseguradoraController,
            Icons.car_rental_outlined,
            true,
            const EdgeInsets.fromLTRB(10, 05, 10, 05),
          )
        ),
      ]
    );

    //institucionMedField
    final institucionMedField = Row(
      mainAxisAlignment: MainAxisAlignment.center, 
      children: [
        const Expanded(
          flex: 2,
          child: Text("Institucion Medica",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 10,
          child: buildTextField(
            'Institucion Medica',
            institucionMController,
            Icons.medical_information_outlined,
            true,
            const EdgeInsets.fromLTRB(10, 05, 10, 05),
          )
        ),
      ]
    );

    //DescripcionField
    final descripcionField = buildTextField(
      'Descripcion',
      descripcionController,
      Icons.bar_chart_outlined,
      true,
      const EdgeInsets.fromLTRB(10, 05, 10, 100),
    );

    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------Variable local-------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------

    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------Funciones-------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------

    //Funcion que crea lista nueva
    Widget _CargarDatos() {
      //Widget Future para crear lista a futuro luego de resivir la informacion
      return FutureBuilder(
        future: levantamientoProvider.cargarData(),
        initialData: const [],
        builder: (context, snapshot) {
          AfectadoModel tempAfec = AfectadoModel(
              aseguradora: '',
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
            //Valida si curp coincide
            return element['curp'].contains(widget.curp);
          }).forEach((element) {
            //Actualiza objeto
            polizaController.text = element['poliza'];
            vigenciaController.text = element['vigencia'];
            nombreAcController.text = element['nombreAc'];
            CURPController.text = element['curp'];
            domicilioController.text = element['domicilio'];
            fechaRecepcionController.text = element['fechaRecepcion'];
            hourRecepcionController.text = element['horaRecepcion'];
            fechaAltaController.text = element['fechaAlta'];
            hourAltaController.text = element['horaAlta'];
            descripcionController.text = element['observaciones'];
            aseguradoraController.text = element['aseguradora'];
            institucionMController.text = element['institucionMedica'];
            atencion = element['tipoAtencion'];
          });

          return Container(
              height: 1000,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/Secretaria-de-Movilidad-01.png",
                    ),
                    fit: BoxFit.fitWidth),
              ),
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
                    const SizedBox(height: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20),
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          child: const Text('Aceptar'),
                        ),
                      ],
                    ),
                  ]) //column
                  ) //scrolview
              ); //Container
        },
      );
    }

    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------Funciones-------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------

    return _CargarDatos();
  }
}
