import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class afectadoView extends StatefulWidget {
  @override
  State<afectadoView> createState() => _afectadoViewState();
}

//-----------Variables globales
// Focus Nodes
//Step2
final hourFocus = FocusNode();

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



//Generales
var initialList = "item1";
var lista = ["item1", "item2", "item3"];

class _afectadoViewState extends State<afectadoView> {
  //----------------Variables Locales
  //polizaField
  final polizaField = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Expanded(
        flex: 1,
        child: Text("Poliza"),
      ),
      Expanded(
        flex: 3,
        child: TextFormField(
          readOnly: true,
          controller: polizaController,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.ad_units_rounded),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
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
      const Expanded(
        flex: 1,
        child: Text("Vigencia"),
      ),
      Expanded(
        flex: 2,
        child: TextFormField(
          readOnly: true,
          controller: vigenciaController,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.ad_units_rounded),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    ],
  );

  //nombreAcField
  final nombreAcField = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Expanded(
        flex: 1,
        child: Text("Nombre Accidentado"),
      ),
      Expanded(
        flex: 3,
        child: TextFormField(
          controller: nombreAcController,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.ad_units_rounded),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
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
      const Expanded(
        flex: 1,
        child: Text("CURP"),
      ),
      Expanded(
        flex: 4,
        child: TextFormField(
          controller: CURPController,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.ad_units_rounded),
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
      const Expanded(
        flex: 1,
        child: Text("Domicilio"),
      ),
      Expanded(
        flex: 4,
        child: TextFormField(
          controller: domicilioController,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.ad_units_rounded),
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

  @override
  Widget build(BuildContext context) {
    //---------------Variables Locales Widget
    //aseguradoraField
    final aseguradoraField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Text("Aseguradora"),
        ),
        const SizedBox(width: 10),
        Expanded(
            flex: 2,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(color: Colors.black38, width: 1),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: DropdownButton(
                  // Initial Value
                  value: initialList,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: lista.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),

                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      initialList = newValue!;
                    });
                  },
                ),
              ),
            )),
      ],
    );

    //DateRecepcionField
    final dateRecepcionField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
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
        Expanded(
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
                hourRecepcionController.text = timePicket.format(context).toString();
              }
            },
          ),
        ),
      ],
    );

    //RecepcionField
    final RecepcionField =
      Row(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          Expanded(
            flex: 2,
            child: dateRecepcionField
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: hourRecepcionField
          ),
        ]
    );

    //DateAltaField
    final dateAltaField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
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
        Expanded(
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
      Row(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          Expanded(
            flex: 2,
            child: dateAltaField
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: hourAltaField
          ),
        ]
    );



    //----Return
    return Container(
      height: 800,
      padding: EdgeInsets.all(10),
      child:
          //---------------Column
          Column(
        children: [
          const SizedBox(height: 10),
          aseguradoraField,
          const SizedBox(height: 10),
          polizaField,
          const SizedBox(height: 10),
          vigenciaField,
          const SizedBox(height: 10),
          nombreAcField,
          const SizedBox(height: 10),
          CURPField,
          const SizedBox(height: 10),
          domicilioField,
          const SizedBox(height: 10),
          RecepcionField,
          const SizedBox(height: 10),
          AltaField,
          //--------------Pruebas Flutter
          TextButton(
            onPressed: () {
              //-------------Toast
              Fluttertoast.showToast(
                  msg: initialList,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
              //-------------Toast
            },
            child: const Text('Buscar'),
          ),
        ],
      ),
    );
  }
}
