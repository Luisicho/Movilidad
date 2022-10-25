import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movilidad/levantamiento/first_step.dart';
import 'package:image_picker/image_picker.dart';

class levMain extends StatefulWidget {
  const levMain({super.key});

  @override
  State<levMain> createState() => _levMainState();
}

class _levMainState extends State<levMain> {
  // form key avisa los cambios
  final _formKey = GlobalKey<FormState>();

  // Focus Nodes
  //Step1
  final folioFocus = FocusNode();
  final fechaFocus = FocusNode();
  final hourFocus = FocusNode();
  final userFocus = FocusNode();
  //Step2

  // editing controller
  //Step1
  final TextEditingController folioController = TextEditingController();
  final TextEditingController fechaController = TextEditingController();
  final TextEditingController userController = TextEditingController();
  final TextEditingController hourController = TextEditingController();
  final TextEditingController latController = TextEditingController();
  final TextEditingController lonController = TextEditingController();

  //Step2

  //-----------Inicio de variables y controladores------------------
  int currStep = 0;
  //ImagePicker
  final ImagePicker _picker = ImagePicker();
  final List<XFile>? images = List<XFile>.empty();
  XFile? photo1,photo2,photo3,photo4,photo5,photo6 = XFile("no");
  File? image1,image2,image3,image4,image5,image6;

  //-----Iniciar la ventana
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //ASIGNA HORA DE HOY
    hourController.text = TimeOfDay.now().format(context).toString();
    //ASIGNA DIA DE HOY
    fechaController.text = DateFormat("dd-MM-yyyy").format(DateTime.now());

    //--------------Object Varaible-----------------------
    //--------------Step No1
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

    //PosicionField
    final posicionField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            flex: 1,
            child: TextFormField(
              readOnly: true,
              controller: lonController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.add_location_outlined),
                contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                hintText: "Longitud",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )),
        Expanded(
          flex: 1,
          child: TextFormField(
            readOnly: true,
            controller: latController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.add_location_outlined),
              contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              hintText: "Latitud",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: TextButton(
            child: const Text('Cargar Posicion'),
            onPressed: () async {
              //Pedir permiso para posicion actual
              LocationPermission permission =
                  await Geolocator.requestPermission();
              //Consigue posicion actual
              Position _currentPosition = await Geolocator.getCurrentPosition(
                  desiredAccuracy: LocationAccuracy.high);
              //Asigna coordenadas a Txt
              latController.text = _currentPosition.latitude.toString();
              lonController.text = _currentPosition.longitude.toString();
              print(latController.text);
              print(lonController.text);
            },
          ),
        ),
      ],
    );

    //MultiFotoField
    final multiFotoField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: TextButton.icon(
            icon: const Icon(
              Icons.image_outlined,
              size: 24.0,
            ),
            label: const Text("Abrir Galeria"),
            onPressed: () async {
              //Abro galeria y pido fotografias
              final List<XFile>? images2 = await _picker.pickMultiImage();
              //-----Agregar For y colocanado todas las fotografias en el list de arriba
              //images.add(images2.sin);
            },
          ),
        ),
      ],
    );
    
    //FotoField
    final fotoField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //-------Column 1
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Condicion para reemplazar el boton con la imagen cargada
              image1 != null ? Image.file(image1!,width: 100,height: 100,fit: BoxFit.cover,):
              TextButton(
                child: const Text(" + "),
                onPressed: () async {
                  // Capture a photo
                  photo1 = await _picker.pickImage(source: ImageSource.camera);
                  if (photo1 == null) return;
                  // transforma imagen a file
                  final imageTemporal = File(photo1!.path);
                  setState(() {
                    this.image1 = imageTemporal;
                  });
                },
              ),
              //Condicion para reemplazar el boton con la imagen cargada
              image2 != null ? Image.file(image2!,width: 100,height: 100,fit: BoxFit.cover,):
              TextButton(
                child: const Text(" + "),
                onPressed: () async {
                  // Capture a photo
                  photo2 = await _picker.pickImage(source: ImageSource.camera);
                  if (photo2 == null) return;
                  // transforma imagen a file
                  final imageTemporal = File(photo1!.path);
                  setState(() {
                    this.image2 = imageTemporal;
                  });
                },
              ),
            ],
          ),
        ),
        //-------Column 2
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Condicion para reemplazar el boton con la imagen cargada
              image3 != null ? Image.file(image3!,width: 100,height: 100,fit: BoxFit.cover,):
              TextButton(
                child: const Text(" + "),
                onPressed: () async {
                  // Capture a photo
                  photo3 = await _picker.pickImage(source: ImageSource.camera);
                  if (photo3 == null) return;
                  // transforma imagen a file
                  final imageTemporal = File(photo3!.path);
                  setState(() {
                    this.image3 = imageTemporal;
                  });
                },
              ),
              //Condicion para reemplazar el boton con la imagen cargada
              image4 != null ? Image.file(image4!,width: 100,height: 100,fit: BoxFit.cover,):
              TextButton(
                child: const Text(" + "),
                onPressed: () async {
                  // Capture a photo
                  photo4 = await _picker.pickImage(source: ImageSource.camera);
                  if (photo4 == null) return;
                  // transforma imagen a file
                  final imageTemporal = File(photo4!.path);
                  setState(() {
                    this.image4 = imageTemporal;
                  });
                },
              ),
            ],
          ),
        ),
        //-------Column 3
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Condicion para reemplazar el boton con la imagen cargada
              image5 != null ? Image.file(image5!,width: 100,height: 100,fit: BoxFit.cover,):
              TextButton(
                child: const Text(" + "),
                onPressed: () async {
                  // Capture a photo
                  photo5 = await _picker.pickImage(source: ImageSource.camera);
                  if (photo5 == null) return;
                  // transforma imagen a file
                  final imageTemporal = File(photo5!.path);
                  setState(() {
                    this.image5 = imageTemporal;
                  });
                },
              ),
              //Condicion para reemplazar el boton con la imagen cargada
              image6 != null ? Image.file(image6!,width: 100,height: 100,fit: BoxFit.cover,):
              TextButton(
                child: const Text(" + "),
                onPressed: () async {
                  // Capture a photo
                  photo6 = await _picker.pickImage(source: ImageSource.camera);
                  if (photo6 == null) return;
                  // transforma imagen a file
                  final imageTemporal = File(photo6!.path);
                  setState(() {
                    this.image6 = imageTemporal;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );

    //--------------Step No1
    //--------------Object Varaible-----------------------

    //------------------Functions-----------------
    List<Step> getSteps() => [
          Step(
            state: currStep > 0 ? StepState.complete : StepState.indexed,
            isActive: currStep >= 0,
            title: const Text('Accidende'),
            content: Container(
              height: 800,
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
                          folioField,
                          dateField,
                          hourField,
                          usuarioField,
                          posicionField,
                          fotoField,
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
          Step(
            state: currStep > 2 ? StepState.complete : StepState.indexed,
            isActive: currStep >= 2,
            title: const Text('Completado'),
            content: SizedBox(
              height: 500,
              child: TextButton(
                onPressed: () {
                  //-------------Toast
                  Fluttertoast.showToast(
                      msg: 'Enviando a la nuve',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  //-------------Toast
                },
                child: const Text('Guardar'),
              ),
            ),
          ),
        ];
    //------------------Functions-----------------

    //----return
    return Scaffold(
      body: Stepper(
        type: StepperType.horizontal,
        steps: getSteps(),
        currentStep: currStep,
        onStepContinue: () {
          if (!(currStep == 2)) {
            setState(() {
              currStep++;
            });
          }
        },
        onStepCancel: currStep == 0
            ? null
            : () => setState(() {
                  currStep--;
                }),
      ),
    );
  } //widget
}

void iniComponents(BuildContext context, TextEditingController fechaController,
    TextEditingController hourController) async {}
