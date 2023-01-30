import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:movilidad/src/model/vehiculos_model.dart';

import '../../../model/levantamiento_model.dart';

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

String VehiRespondable = "1";
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
        FocusNode Focus,
        FocusNode nextFocus) {
      return TextFormField(
        focusNode: Focus,
        onFieldSubmitted: (value) {
          FocusScope.of(context).requestFocus(nextFocus);
        },
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
        controller: controller,
        readOnly: enable,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.black,),
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
            title: const Text("Servicio Publico",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
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
            title: const Text("Particular",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
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
            child: VehiRespondable == "2"
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
        prefixIcon: const Icon(Icons.calendar_today, color: Colors.black,),
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
          child: Text("Tipo Licencia",
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
          child: Text("Estado",
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
      //buscarPlaca,
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
          //Expanded(flex: 1, child: busquedaButton),
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
                    var newTipo = '';
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
                    }
                    vehiculo.tipo = newTipo;
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
