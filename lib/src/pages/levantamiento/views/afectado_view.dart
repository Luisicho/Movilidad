import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import 'package:movilidad/src/pages/levantamiento/model/afectado_model.dart';
import 'package:movilidad/src/providers/afectadoView_provider.dart';

class afectadoView extends StatefulWidget {
  //variables
  final Function(AfectadoModel) addAfectado;
  afectadoView(this.addAfectado);

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
//Step2
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
var aseguradora2 = "A.N.A. COMPAÑÍA DE SEGUROS, S.A. DE C.V.";
var listaAseguradora = ["A.N.A. COMPAÑÍA DE SEGUROS, S.A. DE C.V."
,"AGROASEMEX, S.A."
,"AIG SEGUROS MÉXICO, S.A. DE C.V."
,"ALLIANZ MÉXICO, S.A."
,"ASEGURADORA PATRIMONIAL DAÑOS, S.A."
,"ASSURANT DAÑOS MÉXICO, S.A."
,"AXA SEGUROS, S.A. DE C.V."
,"BERKLEY INTERNATIONAL SEGUROS MÉXICO, S.A. DE C.V."
,"CARDIF MÉXICO SEGUROS GENERALES, S.A. DE C.V."
,"CHUBB SEGUROS MÉXICO, S.A."
,"CITIBANAMEX SEGUROS, S.A. DE C.V."
,"CRABI, S.A. DE C.V."
,"DER NEUE HORIZONT RE, S.A."
,"EL ÁGUILA, COMPAÑÍA DE SEGUROS, S.A. DE C.V."
,"GENERAL DE SEGUROS, S.A.B."
,"GRUPO MEXICANO DE SEGUROS, S.A. DE C.V."
,"GRUPO NACIONAL PROVINCIAL, S.A.B"
,"HDI SEGUROS, S.A. DE C.V."
,"HSBC SEGUROS, S.A. DE C.V."
,"LA LATINOAMERICANA SEGUROS, S.A."
,"MAPFRE MÉXICO, S.A."
,"PATRIMONIAL INBURSA, S.A."
,"PRIMERO SEGUROS, S.A. DE C,V."
,"QBE DE MÉXICO COMPAÑÍA DE SEGUROS, S.A. DE C.V."
,"QUÁLITAS, COMPAÑÍA DE SEGUROS, S.A. DE C.V."
,"REASEGURADORA PATRIA, S.A."
,"SEGUROS AFIRME, S.A. DE C.V."
,"SEGUROS ATLAS, S.A."
,"SEGUROS AZTECA DAÑOS, S.A. DE C.V."
,"SEGUROS BANORTE, S.A DE C.V."
,"SEGUROS BBVA BANCOMER, S.A. DE C.V."
,"SEGUROS EL POTOSÍ, S.A."
,"SEGUROS INBURSA, S.A."
,"SEGUROS SURA, S.A. DE C.V."
,"SEGUROS VE POR MÁS, S.A."
,"SOMPO SEGUROS MÉXICO, S.A. DE C.V."
,"SPT, SOCIEDAD MUTUALISTA DE SEGUROS"
,"TOKIO MARINE, COMPAÑÍA DE SEGUROS, S.A. DE C.V."
,"VIRGINIA SURETY SEGUROS DE MÉXICO, S.A. DE C.V."
,"ZURICH ASEGURADORA MEXICANA, S.A. DE C.V."
,"ZURICH SANTANDER SEGUROS MÉXICO, S.A."
,"ZURICH, COMPAÑÍA DE SEGUROS, S.A."
];

var institucionMed2 = "UNIDAD BASICA DE REABILITACION";
var listaInstitucionMed = ["UNIDAD BASICA DE REABILITACION"
,"SANATORIO GUADALUPE ACAPONETA"
,"HOSPITAL GENERAL DE SUBZONA NUMERO 6"
,"HOSPITAL INTEGRAL DE ACAPONETA"
,"INSTITUTO DE SEGURIDAD SOCIAL PARA EL SERVICIO DE LOS TRABAJADORES DEL ESTADO DE NAYARIT"
,"COORDINACION MEDICA MUNICIPAL AMATLAN DE CAÐAS"
,"HOSPITAL CMQ RIVIERA NAYARIT"
,"UNIDAD MEDICA DE SALUD DE MEZCALEZ"
,"HOSPITAL MEDIC AIR"
,"HOSPITAL GENERAL SAN FRANCISCO"
,"UNIDAD MEDICA FAMILIAR NO 27 DE SAN JOSE DEL VALLE NAYARIT"
,"INSTITUTO MEXICANO DEL SEGURO SOCIAL"
,"INSTITUTO DE SEGURIDAD SOCIAL AL SERVICIO DE LOS TRABAJADORES DEL ESTADO"
,"CRUZ ROJA MEXICANA"
,"HOSPITAL SAINT LUKES"
,"HOSPITAL TONDOROQUE"
,"PUNTA MITA HOSPITAL"
,"HOSPITAL BASICO COMUNITARIO DE COMPOSTELA"
,"CONSULTORIO GINECOLOGICO"
,"UNIDAD MEDICA RURAL"
,"UNIDAD MEDICA RURAL NUMERO 71 COASTECOMATILLO"
,"CLINICA RENTERIA"
,"HOSPITAL BASICO COMUNITARIO LAS VARAS"
,"INSTITUTO DE SEGURIDAD SOCIAL AL SERVICIO DE LOS TRABAJADORES DEL ESTADO"
,"INSTITUTO MEXICANO DEL SEGURO SOCIAL IMSS"
,"HOSPITAL GENERAL MIXTO DE JESUS MARIA"
,"UNIDAD DE CONSULTA EXTERNA HUAJICORI"
,"HOSPITAL INTEGRAL BASICO COMUNITARIO DE IXTLAN DEL RIO NAY"
,"HOSPITAL INTEGRAL COMUNITARIO"
,"HOSPITAL BASICO COMUNITARIO PUENTE DE CAMOTLAN"
,"HOSPITAL GENERAL ROSAMORADA"
,"IMSS"
,"SANATORIO NAVAL DE SAN BLAS"
,"CASA DE LA SALUD"
,"UNIDAD MEDICA RURAL NO.68"
,"HOSPITAL GENERAL SANTIAGO"
,"HOSPITAL GENERAL DE ZONA NUMERO 10"
,"HOSPITAL BASICO COMUNITARIO TECUALA"
,"CLINICA SANTA MARIA"
,"CRUZ ROJA MEXICANA IAP"
,"CLINICA DE MEDICINA FAMILIAR DOCTOR JOAQUIN CANOVAS PUCHADES"
,"INSTITUTO DE SEGURIDAD Y SERVICIOS SOCIALES DE LOS TRABAJADORES DEL ESTADO"
,"INSTITUTO MEXICANO DEL SEGURO SOCIAL HOSPITAL GENERAL DE ZONA N 1"
,"LA CRUZ CENTRO TOMOGRAFICO"
,"CENTRO QUIRURGICO SAN RAFAEL"
,"CENTRO DE ESPECIALIDADES PEDIATRICAS"
,"SERVICOS DE SALUD DE NAYARIT"
,"HOSPITAL DE ESPECIALIDADES PUERTA DE HIERRO TEPIC, S.A. DE C.V."
,"CENTRO ESTATAL DE CANCEROLOGIA"
,"HOSPITAL CIVIL DOCTOR ANTONIO GONZALEZ GUEVARA"
,"SERVICIOS DE SALUD DE NAYARIT UNIDAD 2 DE AGOSTO"
,"CENTRO MEDICO PUERTA DE HIERRO TEPIC"
,"SANATORIO GUADALUPE TEPIC"
,"HOSPITAL PREMIUM HILLS"
,"MULTIMEDICA SUR"
,"INSTITUTO DE SEGURIDAD Y SERVICIO SOCIAL PARA LOS TRABAJADORES DEL ESTADO"
,"SANATORIO DE LA LOMA S.A"
,"UNIDAD AUXILIAR DE MEDICINA FAMILIAR NUMERO 25"
,"CONSULTORIO MEDICO"
,"CENTRO MEDICO QUIRURGICO ALEDA"
,"CONSULTORIO DE GINECOLOGIA Y OBSTETRICIA"
,"CENTRO QUIRURGICO TEPIC"
,"HOSPITAL RURAL 22 IMSS BIENESTAR"
,"HOSPITAL PUEBLO NUEVO"
,"SERVICIO DE URGENCIAS HOSPITAL COMUNITARIO TUXPAN"
,"INSTITUTO DEL SEGURO SOCIAL"
];

class _afectadoViewState extends State<afectadoView> {
  //----------------Variables Locales

  @override
  Widget build(BuildContext context) {
    //---------------Variables Locales Widget
    //polizaField
    final polizaField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: TextFormField(
            focusNode: polizaFocus,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(vigenciaFocus);
            },
            controller: polizaController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.article_outlined),
              contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              hintText: "Poliza",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
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
        Expanded(
          flex: 1,
          child: TextFormField(
            focusNode: nombreAFocus,
            controller: nombreAcController,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(CURPFocus);
            },
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.attribution_outlined),
              contentPadding: const EdgeInsets.fromLTRB(20, 15, 05, 15),
              hintText: "Nombre Accidentado",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );

    //CURPField
    final CURPField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: TextFormField(
            focusNode: CURPFocus,
            controller: CURPController,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(domicilioFocus);
            },
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.badge_outlined),
              contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              hintText: "CURP",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );

    //DomicilioField
    final domicilioField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: TextFormField(
            focusNode: domicilioFocus,
            controller: domicilioController,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(tipoAFocus);
            },
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.add_home_outlined),
              contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              hintText: "Domicilio",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );

    //DateRecepcionField
    final dateRecepcionField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          flex: 1,
          child: Text("Fecha Recepción"),
        ),
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
      ],
    );

    //HourRecepcionField
    final hourRecepcionField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          flex: 1,
          child: Text("Hora"),
        ),
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
      ],
    );

    //RecepcionField
    final RecepcionField =
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(flex: 2, child: dateRecepcionField),
      const SizedBox(width: 10),
      Expanded(flex: 1, child: hourRecepcionField),
    ]);

    //DateAltaField
    final dateAltaField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          flex: 1,
          child: Text("Fecha Alta"),
        ),
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
      ],
    );

    //HourAltaField
    final hourAltaField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          flex: 1,
          child: Text("Hora"),
        ),
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
      ],
    );

    //AltaField
    final AltaField =
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(flex: 2, child: dateAltaField),
      const SizedBox(width: 10),
      Expanded(flex: 1, child: hourAltaField),
    ]);

    //tipoARField
    final tipoARField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: TextFormField(
            focusNode: tipoAFocus,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(descripcionFocus);
            },
            controller: tipoARController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.airline_seat_flat_outlined),
              contentPadding: const EdgeInsets.fromLTRB(20, 15, 05, 15),
              hintText: "Tipo Atencion",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );

//----------------------------------------------------------------------Proveedores-------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------------------------------

    //Funcion futura que se construye cuando todo el proceso termina (cargarData)
    //  retorna segundos despues la informacion de la Lista
    Future<List<String>> cargarData() async {
      List<dynamic> opciones = [];
      List<String> establecimiento = [];
      //Hace funcion asincrona para esperar respuesta antes de mandar al constructor
      //  Recupera la ruta de tu JSON para cargar
      final respuesta =
          await rootBundle.loadString('assets/serviciosMedicos.json');

      //Crea un Mapeado para decodificar el archivo JSON que se esta leyendo
      //  de esta forma se consigue un arreglo de este JSON
      /*var jsonData = json.decode(respuesta) as List;
      for (var element in jsonData) {
        establecimiento.add(element["serviciosMedicos"]);
      }*/
      Map dataMap = json.decode(respuesta);

      opciones = dataMap['serviciosMedicos'];
      opciones.forEach(
        (element) {
          establecimiento.add(element['NOMBRE_DEL_ESTABLECIMIENTO']);
        },
      );
      setState(() => institucionMed = establecimiento.first);
      return establecimiento;
    }

    //Funcion que crea dropdownNuevo
    Widget _listaMedica() {
      //Widget Future para crear lista a futuro luego de resivir la informacion
      return FutureBuilder(
          future: cargarData(),
          initialData: [],
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data!;
              return DropdownButton(
                value: institucionMed,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: data.map((element) {
                  return DropdownMenuItem(
                    value: element, 
                    child: Text(element)
                  );
                },).toList(),
                onChanged: (newValue) {
                  setState(() {
                    institucionMed = newValue.toString();
                  });
                },
              );
            }
            return Text('no data');
          });
    }

    Future<List<String>> cargarAseguradora() async {
      List<dynamic> opciones = [];
      List<String> establecimiento = [];
      final respuesta =
          await rootBundle.loadString('assets/aseguradora.json');

      Map dataMap = json.decode(respuesta);

      opciones = dataMap['aseguradora'];
      opciones.forEach(
        (element) {
          establecimiento.add(element['Nombre de la Institución II']);
        },
      );
      setState(() => aseguradora = establecimiento.first);
      return establecimiento;
    }

    Widget _listaAseguradora() {
      return FutureBuilder(
          future: cargarAseguradora(),
          initialData: [],
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data!;
              return DropdownButton(
                value: aseguradora,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: data.map((element) {
                  return DropdownMenuItem(
                    value: element, 
                    child: Text(element)
                  );
                },).toList(),
                onChanged: (newValue) {
                  setState(() {
                    aseguradora = newValue.toString();
                  });
                },
              );
            }
            return Text('no data');
          });
    }

//----------------------------------------------------------------------Proveedores-------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------------------------------




    //aseguradoraField
    final aseguradoraField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          flex: 1,
          child: Text("Aseguradora"),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: //_listaAseguradora(),
            DropdownButton(
              // Initial Value
              value: aseguradora2,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: listaAseguradora.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),

              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  aseguradora2 = newValue!;
                });
              },
            ),
          ),
        ),
      ],
    );

    //institucionMedField
    final institucionMedField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          flex: 1,
          child: Text("Institucion Medica"),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: //_listaMedica(),
             DropdownButton(
              // Initial Value
              value: institucionMed2,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: listaInstitucionMed.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),

              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (newValue) {
                setState(() {
                  institucionMed2 = newValue!;
                });
              },
            ), 
          ),
        ),
      ],
    );

    //DescripcionField
    final descripcionField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 4,
          child: TextFormField(
            focusNode: descripcionFocus,
            controller: descripcionController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.bar_chart_outlined),
              contentPadding: const EdgeInsets.fromLTRB(20, 15, 05, 30),
              hintText: "Descripcion",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );

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
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 10),
            aseguradoraField,
            const SizedBox(height: 10),
            polizaField,
            const SizedBox(height: 10),
            vigenciaField,
            const SizedBox(height: 10),
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
            tipoARField,
            const SizedBox(height: 10),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(height: 10),
            institucionMedField,
            const SizedBox(height: 10),
            dateRecepcionField,
            const SizedBox(height: 10),
            hourRecepcionField,
            const Divider(
              thickness: 2,
            ),
            const SizedBox(height: 10),
            dateAltaField,
            const SizedBox(height: 10),
            hourAltaField,
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
