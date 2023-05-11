import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:movilidad/src/model/vehiculos_model.dart';

class vehiculoView extends StatefulWidget {
  //variables
  final Function(VehiculoModel)
      addVehiculo; // variable referencia al addAfectado de secondStep
  vehiculoView(
      this.addVehiculo); // constructor que resive referencia de la funcion addAfectado de secondStep

  @override
  State<vehiculoView> createState() => _vehiculoViewState();
}

//----------------------------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------Global Variable-------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------------------------------
var estado = 'Aguascalientes';
var listaestado = [
  'Aguascalientes',
  'Baja California',
  'Baja California Sur',
  'Campeche',
  'Chiapas',
  'Chihuahua',
  'Ciudad de México',
  'Coahuila',
  'Colima',
  'Durango',
  'Estado de México',
  'Guanajuato',
  'Guerrero',
  'Hidalgo',
  'Jalisco',
  'Michoacán',
  'Morelos',
  'Nayarit',
  'Nuevo León',
  'Oaxaca',
  'Puebla',
  'Querétaro',
  'Quintana Roo',
  'San Luis Potosí',
  'Sinaloa',
  'Sonora',
  'Tabasco',
  'Tamaulipas',
  'Tlaxcala',
  'Veracruz',
  'Yucatán',
  'Zacatecas',
];

var servicioP = [
  {
    'noeconomico': '1234',
    'nuevonoeconomico': '1234',
    'descripcion': "Taxi, NISSAN",
    'concecion': 'Abrego Valdivia Martin'
  },
  {
    'noeconomico': 'GTX-2239',
    'nuevonoeconomico': 'NTP1963',
    'descripcion': "TAXI",
    'concecion': 'ABREGO GAMBOA BRENDA ARLIN,'
  },
  {
    'noeconomico': 'GTX-4902',
    'nuevonoeconomico': 'NTP2744',
    'descripcion': "TAXI",
    'concecion': 'ABREGO TOPETE PEDRO OSVALDO'
  },
  {
    'noeconomico': 'GTX-1507',
    'nuevonoeconomico': 'NTP3222',
    'descripcion': "TAXI",
    'concecion': 'ABREGO PERALES CARLOS ALBERTO'
  },
  {
    'noeconomico': 'GTX-4927',
    'nuevonoeconomico': 'NTP4714',
    'descripcion': "TAXI",
    'concecion': 'ABREGO MEDRANO EDUARDO'
  },
  {
    'noeconomico': 'GTX-2742',
    'nuevonoeconomico': 'NTP4819',
    'descripcion': "TAXI",
    'concecion': 'SAUCEDO MIRAMONTES ROBERTO ENRIQUE'
  },
  {
    'noeconomico': 'GTX-5467',
    'nuevonoeconomico': 'NTP4890',
    'descripcion': "TAXI",
    'concecion': 'ABALOS RODRIGUEZ JULIO ALFREDO'
  },
  {
    'noeconomico': 'GTX-2516',
    'nuevonoeconomico': 'NTP5312',
    'descripcion': "TAXI",
    'concecion': 'ABALOS MARIN ELIAZAR'
  },
  {
    'noeconomico': 'GTX-551',
    'nuevonoeconomico': 'NTP551',
    'descripcion': "TAXI",
    'concecion': 'PEREZ BAÑUELOS DIONICIO'
  },
  {
    'noeconomico': 'GTX-559',
    'nuevonoeconomico': 'NTP559',
    'descripcion': "TAXI",
    'concecion': 'MARTINEZ GOMEZ MA. MERCEDES'
  },
  {
    'noeconomico': 'GTX-789',
    'nuevonoeconomico': 'NTP789',
    'descripcion': "TAXI",
    'concecion': 'SALDATE CASTILLON VICTOR MANUEL'
  },
];

var placas = [
  {'placas': '1234', 'descripcion': "NISSAN", 'concecion': 'PEDRO PEREZ LOPEZ'},
  {
    'placas': 'RGD-40-00',
    'descripcion': "NISSAN",
    'concecion': 'PEDRO PEREZ LOPEZ'
  },
  {
    'placas': 'RGD-50-55',
    'descripcion': "VOLKSWAGEN",
    'concecion': 'ELI GARNICA LOZANO'
  },
  {
    'placas': 'RGJ-52-10',
    'descripcion': "FORD",
    'concecion': 'OSCAR BUENO CARLOS'
  },
  {
    'placas': 'RGY-52-10',
    'descripcion': "HYUNDAI",
    'concecion': 'RAUL LOPEZ PADILLA'
  },
  {
    'placas': 'RGL-26-80',
    'descripcion': "NISSAN",
    'concecion': 'HERNAN COLINA DIAZ'
  },
  {
    'placas': 'RGA-50-55',
    'descripcion': "TOYOTA",
    'concecion': 'FELIPE LAMAS MARTINEZ'
  },
  {
    'placas': 'L156K',
    'descripcion': "HONDA",
    'concecion': 'JUANA PLACENCIA LOYOLA'
  },
  {
    'placas': 'PF-25-920',
    'descripcion': "FORD",
    'concecion': 'CARMEN POLANCO PEREZ'
  },
  {
    'placas': 'RGH-50-01',
    'descripcion': "VOLKSWAGEN",
    'concecion': 'CARLOS OCAÑA DIAZ'
  },
];

var licencias = [
  {
    'licencia': '1234',
    'tipo': "Chofer",
    'nombre': 'ABNER ULISES MENDOZA HERNANDEZ',
    'vigencia': '07/26/2025',
  },
  {
    'licencia': '11BDGTTN029448',
    'tipo': "Chofer",
    'nombre': 'FERNANDO ELIAS PALOMEQUE PEREZ',
    'vigencia': '7/26/2024'
  },
  {
    'licencia': '11BDGTTN029445',
    'tipo': "D",
    'nombre': 'YESSICA SANDOVAL CASTILLO',
    'vigencia': '7/26/2024'
  },
  {
    'licencia': '11ADGTTN005413',
    'tipo': "Automovilista",
    'nombre': 'ANA  MATILDE DE LAS MERCEDES PARDO HERNANDEZ',
    'vigencia': '7/26/2024'
  },
  {
    'licencia': '11ADGTTN005414',
    'tipo': "Motociclista",
    'nombre': 'ROSALIA GUADALUPEPEREZ PEREZ',
    'vigencia': '7/26/2024,A'
  },
];

//Placas
final noEconomicoFocus = FocusNode();
final placasFocus = FocusNode();
final descripcionFocus = FocusNode();
final conceFocus = FocusNode();
//licencia
final noLicenciaFocus = FocusNode();
final vigenciaFocus = FocusNode();
final nombreFocus = FocusNode();
final tipoFocus = FocusNode();

//licencia
final TextEditingController noLicenciaController = TextEditingController();
final TextEditingController vigenciaController = TextEditingController();
final TextEditingController nombreController = TextEditingController();
final TextEditingController tipoController = TextEditingController();
//Placas
final TextEditingController noEconomicoController = TextEditingController();
final TextEditingController placasController = TextEditingController();
final TextEditingController descripcionController = TextEditingController();
final TextEditingController conceController = TextEditingController();

String vehiRespondable = "1";
var tipo = 'Automovilista';
var tipoLicArray = [
  'Automovilista',
  'Chofer',
  'Motociclista',
  'Chofer Servicio Publico'
];

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
      vigenciaController.text = '';
      nombreController.text = '';
    }

    //Funcion que crea TextFields Con Focus
    Widget buildTextFieldFocus(
        String hint,
        TextEditingController controller,
        IconData icon,
        bool enable,
        EdgeInsets pad,
        FocusNode focus,
        FocusNode nextFocus) {
      return TextFormField(
        focusNode: focus,
        onFieldSubmitted: (value) {
          FocusScope.of(context).requestFocus(nextFocus);
        },
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
        controller: controller,
        readOnly: enable,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.black,
          ),
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
    //----------------------------------------------------------------------Functions-------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------

    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------Object Variable-------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------

    //-------------------------------------------------Busqueda Button
    final busquedaButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: TextButton(
            child: const Text('Buscar'),
            onPressed: () {
              var mensaje = 'No encontrado';
              var color = Colors.red;
              if (noLicenciaController.text != "") {
                var busquedatemp = licencias.where((element) =>
                    element['licencia'] == noLicenciaController.text);
                /*if (busquedatemp.isNotEmpty) {
                  var tipoLic = '';
                  switch (busquedatemp.first['tipo']!) {
                    case 'A':
                      tipoLic = 'Automovilista';
                      break;
                    case 'B':
                      tipoLic = 'Chofer';
                      break;
                    case 'C':
                      tipoLic = 'Motociclista';
                      break;
                    case 'D':
                      tipoLic = 'Chofer Servicio Publico';
                      break;
                    default:
                      break;
                  }
                  
                }*/
                tipoController.text = busquedatemp.first['tipo']!;
                nombreController.text = busquedatemp.first['nombre']!;
                vigenciaController.text = busquedatemp.first['vigencia']!;
                mensaje = 'Encontrado en nube';
                color = Colors.green;
              }
              //-------------Toast
              Fluttertoast.showToast(
                  msg: mensaje,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: color,
                  textColor: Colors.white,
                  fontSize: 16.0);
              //-------------Toast
              setState(() {});
            },
          ),
        ),
      ],
    );

    //-------------------------------------------------BuscarPlaca
    final buscarPlaca = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: TextButton(
            onPressed: () {
              var mensaje = 'No encontrado';
              var color = Colors.red;
              if (noEconomicoController.text != "") {
                //Variables locales
                //Condicion para la busqueda
                var busquedatemp = servicioP.where((element) =>
                    element['noeconomico'] == noEconomicoController.text);

                if (busquedatemp.isNotEmpty) {
                  descripcionController.text =
                      busquedatemp.first['descripcion']!;
                  conceController.text = busquedatemp.first['concecion']!;
                  mensaje = 'Encontrado en nube';
                  color = Colors.green;
                }
                var busquedatemp2 = servicioP.where((element) =>
                    element['nuevonoeconomico'] == noEconomicoController.text);

                if (busquedatemp2.isNotEmpty) {
                  descripcionController.text =
                      busquedatemp2.first['descripcion']!;
                  conceController.text = busquedatemp2.first['concecion']!;
                  mensaje = 'Encontrado en nube';
                  color = Colors.green;
                }
              }
              if (placasController.text != "") {
                //Variables locales
                //Condicion para la busqueda
                var busquedatemp = placas.where(
                    (element) => element['placas'] == placasController.text);
                if (busquedatemp.isNotEmpty) {
                  descripcionController.text =
                      busquedatemp.first['descripcion']!;
                  conceController.text = busquedatemp.first['concecion']!;
                  mensaje = 'Encontrado en nube';
                  color = Colors.green;
                }
              }
              //-------------Toast
              Fluttertoast.showToast(
                  msg: mensaje,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: color,
                  textColor: Colors.white,
                  fontSize: 16.0);
              //-------------Toast
              setState(() {});
            },
            child: const Text('Buscar Placas / No.Economico'),
          ),
        ),
      ],
    );

    //-------------------------------------------------DescripcionField
    final descripcionField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: buildTextFieldFocus(
            'Descripcion',
            descripcionController,
            Icons.assessment_outlined,
            true,
            const EdgeInsets.fromLTRB(20, 15, 20, 15),
            descripcionFocus,
            conceFocus,
          ),
        ),
      ],
    );

    //-------------------------------------------------Consen/particularField
    final consenParticularField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: buildTextFieldFocus(
            'Concensionario / Particular',
            conceController,
            Icons.account_circle_outlined,
            true,
            const EdgeInsets.fromLTRB(20, 15, 20, 15),
            conceFocus,
            noLicenciaFocus,
          ),
        ),
      ],
    );

    //-------------------------------------------------NoLicencia
    final noLicenciaField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: buildTextFieldFocus(
            'No. Licencia',
            noLicenciaController,
            Icons.account_circle_outlined,
            false,
            const EdgeInsets.fromLTRB(20, 15, 20, 15),
            noLicenciaFocus,
            tipoFocus,
          ),
        ),
      ],
    );

    //-------------------------------------------------TipoField
    final tipoField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: buildTextFieldFocus(
            'Tipo Licencia',
            tipoController,
            Icons.contacts_outlined,
            true,
            const EdgeInsets.fromLTRB(20, 15, 20, 15),
            tipoFocus,
            vigenciaFocus,
          ),
        ),
      ],
    );

    //VehiculoField
    final vehiculoField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: RadioListTile(
            title: const Text(
              "Servicio Publico",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            value: "1",
            groupValue: vehiRespondable,
            onChanged: (value) {
              setState(() {
                vehiRespondable = value.toString();
                noEconomicoController.text = "";
                placasController.text = "";
                descripcionController.text = "";
                nombreController.text = "";
                conceController.text = "";
              });
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: RadioListTile(
            title: const Text(
              "Particular",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            value: "2",
            groupValue: vehiRespondable,
            onChanged: (value) {
              setState(() {
                vehiRespondable = value.toString();
                noEconomicoController.text = "";
                placasController.text = "";
                descripcionController.text = "";
                nombreController.text = "";
                conceController.text = "";
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
            child: vehiRespondable == "1"
                ? buildTextFieldFocus(
                    'NoEconomico',
                    noEconomicoController,
                    Icons.all_inbox,
                    false,
                    const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    noEconomicoFocus,
                    descripcionFocus)
                : buildTextFieldFocus(
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
            child: vehiRespondable == "2"
                ? buildTextFieldFocus(
                    'Placas',
                    placasController,
                    Icons.calendar_view_week,
                    false,
                    const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    placasFocus,
                    descripcionFocus)
                : buildTextFieldFocus(
                    'Placas',
                    placasController,
                    Icons.calendar_view_week,
                    true,
                    const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    placasFocus,
                    descripcionFocus)),
      ],
    );

    //-------------------------------------------------vigenciaReadField
    final vigenciaReadField = TextFormField(
      readOnly: true,
      controller: vigenciaController,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.calendar_today),
        contentPadding: const EdgeInsets.fromLTRB(05, 0, 05, 0),
        hintText: "Vigencia",
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

    //vigenciaField
    final vigenciaField = TextFormField(
      readOnly: true,
      controller: vigenciaController,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.calendar_today,
          color: Colors.black,
        ),
        contentPadding: const EdgeInsets.fromLTRB(05, 0, 05, 0),
        hintText: "Vigencia",
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
          child: Text(
            "Tipo Licencia",
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

    //-------------------------------------------------EstadosField
    final estadosField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          flex: 1,
          child: Text(
            "Estado",
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
              hint: const Text('Selecciona Estado'),
              value: estado,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: listaestado.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (newValue) {
                limpiarCeldas();
                setState(() {
                  estado = newValue.toString();
                });
              },
            ),
          ),
        ),
      ],
    );

    //-------------------------------------------------vehiculoConDb
    var vehiculoConBD =
        Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      vehiculoField,
      const SizedBox(height: 20),
      placasField,
      const SizedBox(height: 20),
      buscarPlaca,
      const SizedBox(height: 20),
      descripcionField,
      const SizedBox(height: 20),
      consenParticularField,
      const SizedBox(height: 20),
      const Divider(
        thickness: 2,
      ),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(flex: 1, child: noLicenciaField),
          Expanded(flex: 1, child: busquedaButton),
        ],
      ),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(flex: 1, child: tipoField),
          Expanded(flex: 1, child: vigenciaReadField),
        ],
      ),
    ]);

    //-------------------------------------------------vahiculoManual
    var vehiculoManual = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        vehiculoField,
        const SizedBox(height: 10),
        placasField,
        const SizedBox(height: 10),
        buildTextFieldFocus(
          'Descripcion',
          descripcionController,
          Icons.assessment_outlined,
          false,
          const EdgeInsets.fromLTRB(20, 15, 20, 15),
          descripcionFocus,
          conceFocus,
        ),
        const SizedBox(height: 10),
        buildTextFieldFocus(
          'Concensionario / Particular',
          conceController,
          Icons.account_circle_outlined,
          false,
          const EdgeInsets.fromLTRB(20, 15, 20, 15),
          conceFocus,
          noLicenciaFocus,
        ),
        const SizedBox(height: 10),
        const Divider(
          thickness: 2,
        ),
        const SizedBox(height: 10),
        buildTextFieldFocus(
          'No.Licencia',
          noLicenciaController,
          Icons.account_box_sharp,
          false,
          const EdgeInsets.fromLTRB(20, 15, 20, 15),
          noLicenciaFocus,
          nombreFocus,
        ),
        const SizedBox(height: 10),
        tipoLic,
        const SizedBox(height: 10),
        vigenciaField,
        const SizedBox(height: 10),
        buildTextFieldFocus(
          'Nombre',
          nombreController,
          Icons.document_scanner_outlined,
          false,
          const EdgeInsets.fromLTRB(20, 15, 20, 15),
          nombreFocus,
          noLicenciaFocus,
        ),
      ],
    );

    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------Object Variable-------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------

    return Container(
        height: 650,
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
                'Agregar Vehiculo',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 10),
              estadosField,
              const SizedBox(height: 10),
              estado == 'Nayarit' ? vehiculoConBD : vehiculoManual,
              const SizedBox(height: 10),

              //------------------------BOTONES--------------------------
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                //--------------Boton para agregar Afectado
                ElevatedButton(
                  onPressed: () {
                    VehiculoModel vehiculo = VehiculoModel();
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
                    vehiculo.concesionario = conceController.text;
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
                    /*var newTipo = '';
                    switch (tipo) {
                      case 'Automovilista':
                        newTipo = 'A';
                        break;
                      case 'Chofer':
                        newTipo = 'B';
                        break;
                      case 'Motociclista':
                        newTipo = 'C';
                        break;
                      case 'Chofer Servicio Publico':
                        newTipo = 'D';
                        break;
                      default:
                      
                    }*/
                    vehiculo.tipo = tipo;
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
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  child: const Text('Agregar'),
                ),
              ]),
            ],
          ),
        ));
  }
}
