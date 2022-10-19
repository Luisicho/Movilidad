import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fluttertoast/fluttertoast.dart';

class levMain extends StatefulWidget {
  const levMain({super.key});

  @override
  State<levMain> createState() => _levMainState();
}

class _levMainState extends State<levMain> {
  // form key avisa los cambios
  final _formKey = GlobalKey<FormState>();

  // Focus Nodes
  final folioFocus = FocusNode();
  final fechaFocus = FocusNode();
  final hourFocus = FocusNode();
  final userFocus = FocusNode();

  // editing controller
  final TextEditingController folioController = new TextEditingController();
  final TextEditingController fechaController = new TextEditingController();
  final TextEditingController userController = new TextEditingController();
  final TextEditingController hourController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Inicio de variables
    //ASIGNA HORA DE HOY
    hourController.text = TimeOfDay.now().format(context).toString();
    //ASIGNA DIA DE HOY
    fechaController.text = DateFormat("dd-MM-yyyy").format(DateTime.now());
    
    
    //--------------Object Varaible-----------------------
    //Folio Field
    final folioField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('No. Folio'),
        const SizedBox(width: 30),
        Expanded(
          flex: 2,
          child: TextFormField(
              focusNode: folioFocus,
              controller: folioController,
              readOnly: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.pages),
                contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                hintText: "Folio",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              )),
        ),
      ],
    );

    //user field
    final usuarioField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Usuario'),
        const SizedBox(width: 30),
        Expanded(
          flex: 2,
          child: TextFormField(
            autofocus: false,
            controller: userController,
            validator: (value) {
              if (value!.isEmpty) {
                return ("El Usuario es requerido para ingresar");
              }
            },
            onSaved: (value) {
              userController.text = value!;
            },
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.person),
              contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              hintText: "Usuario",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );

    //DateField
    final dateField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('No. Folio'),
        const SizedBox(width: 30),
        Expanded(
          flex: 2,
          child: TextFormField(
            readOnly: true,
            controller: fechaController,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(hourFocus);
            },
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.calendar_today),
              contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              hintText: "Fecha",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onTap: () async {
              // Get the date
              // DateTime? datePicket = await showDatePicker(
              //   context: context,
              //   initialDate: DateTime.now(),
              //   firstDate: DateTime(1999),
              //   lastDate: DateTime(2050),
              // );
              // if (datePicket != null) {
              //   //make format to the date
              //   var formatedDate = DateFormat("dd-MM-yyyy").format(datePicket);
              //   fechaController.text = formatedDate.toString();
              // }
            },
          ),
        ),
      ],
    );

    //HourField
    final hourField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Hora llegada'),
        const SizedBox(width: 30),
        Expanded(
          flex: 2,
          child: TextFormField(
            readOnly: true,
            controller: hourController,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(userFocus);
            },
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.access_alarm),
              contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              hintText: "Hora",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onTap: () async {
              // Get the date
              //TimeOfDay? timePicket = await showTimePicker(context: context,initialTime: TimeOfDay.now(),);
              //if (timePicket != null) {
                //make format to the time
                //hourController.text = timePicket.format(context).toString();
              //}
            },
          ),
        ),
      ],
    );

    //--------------Object Varaible-----------------------

    //------------------Functions-----------------

    //------------------Functions-----------------
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                folioField,
                dateField,
                hourField,
                usuarioField,
                TextButton(
                  child: const Text('Posicion Actual'),
                  onPressed: () async {
                    //Pedir permiso para posicion actual
                    LocationPermission permission =
                        await Geolocator.requestPermission();
                    //Consigue posicion actual
                    Position _currentPosition =
                        await Geolocator.getCurrentPosition(
                            desiredAccuracy: LocationAccuracy.high);
                    String mesg = "Lon " +
                        _currentPosition.longitude.toString() +
                        " Lat " +
                        _currentPosition.latitude.toString();
                    Fluttertoast.showToast(
                        msg: mesg,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  },
                ),
              ],
            )),
      ),
    );
  } //widget
}
