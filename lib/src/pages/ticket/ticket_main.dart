import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:quickalert/quickalert.dart';

class TicketMain extends StatefulWidget {
  const TicketMain({super.key});

  @override
  State<TicketMain> createState() => _TicketMainState();
}

//----------------------------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------Variable Globales-------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------------------------------

//Generales
var turno = 'Matutino';
var listaTurno = ['Matutino', 'Vespertin'];

//----------------------------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------Variable Globales-------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------------------------------
class _TicketMainState extends State<TicketMain> {
  //----------------------------------------------------------------------------------------------------------------------------------------------------------------
  //----------------------------------------------------------------------Variables locales-------------------------------------------------------------------------------
  //----------------------------------------------------------------------------------------------------------------------------------------------------------------

  // form key avisa los cambios
  final _formKey = GlobalKey<FormState>();


  // Focus Nodes
  final estadoFocus = FocusNode();
  final municipioFocus = FocusNode();
  final sedeFocus = FocusNode();
  final supervisorFocus = FocusNode();
  final rutaFocus = FocusNode();
  final modalidadFocus = FocusNode();
  final horaFocus = FocusNode();

  // editing controller
  final TextEditingController estadoController = TextEditingController();
  final TextEditingController municipioController = TextEditingController();
  final TextEditingController sedeController = TextEditingController();
  final TextEditingController fechaSupervisionController = TextEditingController();
  final TextEditingController supervisorController = TextEditingController();
  final TextEditingController turnoController = TextEditingController();
  final TextEditingController rutaController = TextEditingController();
  final TextEditingController modalidadController = TextEditingController();
  final TextEditingController horaRecepcionController = TextEditingController();
    

  //----------------------------------------------------------------------------------------------------------------------------------------------------------------
  //----------------------------------------------------------------------Variables locales-------------------------------------------------------------------------------
  //----------------------------------------------------------------------------------------------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------Funciones-------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------

    //Funcion que crea TextFields
    Widget buildTextFieldFlex(String hint, TextEditingController controller,
        IconData icon, bool enable, EdgeInsets pad, int flexInt) {
      return Expanded(
        flex: flexInt,
        child: TextFormField(
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

    //Funcion que crea TextFields
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
      //noeconomicoController.text = '';
    }

    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------Funciones-------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------

    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------Object Variable-------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------

    //-------------------------------------------------estadoField
    final estadoField =
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Expanded(
        flex: 2,
        child: Text("Estado"),
      ),
      const SizedBox(width: 10),
      Expanded(
          flex: 10,
          child: buildTextFieldFocus(
            'Estado',
            estadoController,
            Icons.article_outlined,
            false,
            const EdgeInsets.fromLTRB(10, 05, 10, 05),
            estadoFocus,
            municipioFocus,
          )),
      const SizedBox(width: 50),
    ]);

    //-------------------------------------------------municipioField
    final municipioField =
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Expanded(
        flex: 2,
        child: Text("Municipio"),
      ),
      const SizedBox(width: 10),
      Expanded(
          flex: 10,
          child: buildTextFieldFocus(
            'Municipio',
            municipioController,
            Icons.article_outlined,
            false,
            const EdgeInsets.fromLTRB(10, 05, 10, 05),
            municipioFocus,
            sedeFocus,
          )),
      const SizedBox(width: 50),
    ]);

    //-------------------------------------------------sedeField
    final sedeField =
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Expanded(
        flex: 2,
        child: Text("Sede"),
      ),
      const SizedBox(width: 10),
      Expanded(
          flex: 10,
          child: buildTextFieldFocus(
            'Sede',
            sedeController,
            Icons.article_outlined,
            false,
            const EdgeInsets.fromLTRB(10, 05, 10, 05),
            sedeFocus,
            supervisorFocus,
          )),
      const SizedBox(width: 50),
    ]);

    //-------------------------------------------------fechasupervisionField
    final fechasupervisionField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          flex: 4,
          child: Text("Fecha de Supervision",
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
            controller: fechaSupervisionController,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.calendar_today),
              contentPadding: const EdgeInsets.fromLTRB(05, 0, 05, 0),
              hintText: "Fecha de Supervision",
              
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
                fechaSupervisionController.text = formatedDate.toString();
              }
            },
          ),
        ),
        const SizedBox(width: 50),
      ],
    );

    //-------------------------------------------------supervisorField
    final supervisorField =
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Expanded(
        flex: 2,
        child: Text("Supervisor"),
      ),
      const SizedBox(width: 10),
      Expanded(
          flex: 10,
          child: buildTextFieldFocus(
            'Supervisor',
            supervisorController,
            Icons.article_outlined,
            false,
            const EdgeInsets.fromLTRB(10, 05, 10, 05),
            supervisorFocus,
            rutaFocus,
          )),
      const SizedBox(width: 50),
    ]);

    //-------------------------------------------------turnoField
    final turnoField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          flex: 1,
          child: Text("Turno",
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
              hint: const Text('Turno'),
              value: turno,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: listaTurno.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  turno = newValue.toString();
                });
              },
            ),
          ),
        ),
      ],
    );

    //-------------------------------------------------rutaField
    final rutaField =
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Expanded(
        flex: 2,
        child: Text("Ruta"),
      ),
      const SizedBox(width: 10),
      Expanded(
          flex: 10,
          child: buildTextFieldFocus(
            'Ruta',
            rutaController,
            Icons.article_outlined,
            false,
            const EdgeInsets.fromLTRB(10, 05, 10, 05),
            rutaFocus,
            modalidadFocus,
          )),
      const SizedBox(width: 50),
    ]);

    //-------------------------------------------------modalidadField
    final modalidadField =
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Expanded(
        flex: 2,
        child: Text("Modalidad"),
      ),
      const SizedBox(width: 10),
      Expanded(
          flex: 10,
          child: buildTextFieldFocus(
            'Modalida',
            modalidadController,
            Icons.article_outlined,
            false,
            const EdgeInsets.fromLTRB(10, 05, 10, 05),
            modalidadFocus,
            estadoFocus,
          )),
      const SizedBox(width: 50),
    ]);

    //-------------------------------------------------HourRecepcionField
    final hourRecepcionField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          flex: 4,
          child: Text("Hora",
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
            controller: horaRecepcionController,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.access_alarm),
              contentPadding: const EdgeInsets.fromLTRB(05, 0, 05, 0),
              hintText: "Hora",
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
                horaRecepcionController.text = timePicket.format(context).toString();
              }
            },
          ),
        ),
        const SizedBox(width: 50),
      ],
    );


    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------Object Variable-------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------


    return WillPopScope(
      onWillPop: () async {
        return await QuickAlert.show(
          context: context,
          type: QuickAlertType.confirm,
          title: '¿Quieres salir?',
          text: 'No se guardara nada de la informacion ya capturada',
          confirmBtnText: 'Si',
          cancelBtnText: 'No',
          confirmBtnColor: Colors.green,
          onConfirmBtnTap: () {
            Navigator.pop(context, true);
          },
          onCancelBtnTap: () {
            Navigator.pop(context, false);
          },
        );
      },
      child: Scaffold(
        body: Container(
          height: 1900,
          margin: const EdgeInsets.all(5.0),
          child:
              //------------Formulario
              Form(
            key: _formKey,
            child:
                //------------ColumnaForm
                Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(height: 20),
                estadoField,
                const SizedBox(height: 20),
                municipioField,
                const SizedBox(height: 20),
                sedeField,
                const SizedBox(height: 20),
                fechasupervisionField,
                const SizedBox(height: 20),
                supervisorField,
                const SizedBox(height: 20),
                turnoField,
                const SizedBox(height: 20),
                rutaField,
                const SizedBox(height: 20),
                modalidadField,
                const SizedBox(height: 20),
                hourRecepcionField,
                const Divider(
                  thickness: 2,
                ),
              ],
            ),
            onChanged: () {
              //ActualizarLev();
            },
          ),
        ),
      )
    );
  }
}