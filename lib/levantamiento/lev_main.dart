import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movilidad/levantamiento/first_step.dart';

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
  final TextEditingController folioController = TextEditingController();
  final TextEditingController fechaController = TextEditingController();
  final TextEditingController userController = TextEditingController();
  final TextEditingController hourController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    //Inicio de variables
    int currStep = 0;
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
        const SizedBox(width: 10),
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
          ),
        ),
      ],
    );

    //--------------Object Varaible-----------------------

    //------------------Functions-----------------
    List<Step> getSteps() => [
       Step(
        state: currStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currStep >= 0,
        title: const Text('Accidende'), 
        content: Container(
          height: 500,
          margin: const EdgeInsets.all(10.0),
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
            ),
          ),
        ),
      ),
      Step(
        state: currStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currStep >= 1,
        title: const Text('Afectados'), 
        content: const SizedBox(
          height: 500,
          child: Text('data'),
        ),
      ),
    ];
    //------------------Functions-----------------

    //return
    return Scaffold(
      body: Stepper(
        type: StepperType.horizontal,
        steps: getSteps(),
        currentStep: currStep,
        onStepContinue: () {
          setState(() {
            currStep++;
          });
        },
        onStepCancel: currStep == 0 ? null : () => setState(() {
          currStep--;
        }),
      ),
    );
  } //widget
}
