import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

import 'package:movilidad/src/model/levantamiento_model.dart';

class firstStep extends StatefulWidget {
  //objeto
  final LevantamientoModel levantamiento = LevantamientoModel(
    folio: '',
    fechaLlegada: '',
    horaLlegada: '',
    horaAccidente: '',
    ubicacion: '',
    entre: '',
    y: '',
    longitud: '',
    latitud: '',
    noEconomico: '',
    placas: '',
    descripcion: '',
    concesionario: '',
    noLicencia: '',
    tipo: '',
    nombre: '',
    vigencia: '',
    fotosLev: [
      File(''),
      File(''),
      File(''),
      File(''),
      File(''),
      File(''),
    ],
    icon: 'car_crash',
  );
  firstStep({super.key});

  @override
  State<firstStep> createState() => _firstStepState();
}

class _firstStepState extends State<firstStep> {
  // form key avisa los cambios
  final _formKey = GlobalKey<FormState>();

  // Focus Nodes
  //Step1
  final noLicenciaFocus = FocusNode();
  final ubicacionFocus = FocusNode();
  final entreFocus = FocusNode();
  final yFocus = FocusNode();
  final noEconomicoFocus = FocusNode();
  final placasFocus = FocusNode();

  // editing controller
  //Step1
  final TextEditingController folioController = TextEditingController();
  final TextEditingController fechaController = TextEditingController();
  final TextEditingController hourAccidenteController = TextEditingController();
  final TextEditingController latController = TextEditingController();
  final TextEditingController lonController = TextEditingController();
  final TextEditingController noeconomicoController = TextEditingController();
  final TextEditingController placasController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController concesionController = TextEditingController();
  final TextEditingController nolicenciaController = TextEditingController();
  final TextEditingController tipoController = TextEditingController();
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController vigenciaController = TextEditingController();
  final TextEditingController hourLlegadaController = TextEditingController();
  final TextEditingController ubicacionController = TextEditingController();
  final TextEditingController entreController = TextEditingController();
  final TextEditingController yController = TextEditingController();

  //---------------------------------------------Inicio de variables y controladores------------------

  String VehiRespondable = "1";
  //ImagePicker
  final ImagePicker _picker = ImagePicker();
  final List<XFile>? images = List<XFile>.empty();
  XFile? photo1, photo2, photo3, photo4, photo5, photo6 = XFile("no");
  File? image1, image2, image3, image4, image5, image6;

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

  var Placas = [
    {
      'placas': '1234',
      'descripcion': "NISSAN",
      'concecion': 'PEDRO PEREZ LOPEZ'
    },
    {
      'placas': ',RGD-40-00',
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
      'tipo': "C",
      'nombre': 'ABNER ULISES MENDOZA HERNANDEZ',
      'vigencia': '07/26/2025'
    },
    {
      'licencia': '11BDGTTN029448',
      'tipo': "B",
      'nombre': 'FERNANDO ELIASPALOMEQUE PEREZ',
      'vigencia': '7/26/2024'
    },
    {
      'licencia': '11BDGTTN029445',
      'tipo': "B",
      'nombre': 'YESSICA SANDOVAL CASTILLO',
      'vigencia': '7/26/2024'
    },
    {
      'licencia': '11ADGTTN005413',
      'tipo': "A",
      'nombre': 'ANA  MATILDE DE LAS MERCEDESPARDO HERNANDEZ',
      'vigencia': '7/26/2024'
    },
    {
      'licencia': '11ADGTTN005414',
      'tipo': "C",
      'nombre': 'ROSALIA GUADALUPEPEREZ PEREZ',
      'vigencia': '7/26/2024,A'
    },
  ];

  @override
  Widget build(BuildContext context) {
    //FUNCION PARA CONSEGUIR FOLIO NUEVO
    String getFolio() {
      return "01";
    }

    //ASIGNA HORA DE HOY
    hourLlegadaController.text = TimeOfDay.now().format(context).toString();
    //Objeto
    widget.levantamiento.horaLlegada =
        TimeOfDay.now().format(context).toString();
    //ASIGNA DIA DE HOY
    fechaController.text = DateFormat("dd-MM-yyyy").format(DateTime.now());
    //Objeto
    widget.levantamiento.fechaLlegada =
        DateFormat("dd-MM-yyyy").format(DateTime.now());

    //Consigue folio nuevo
    folioController.text = getFolio();

    //--------------------------------------------------Object Varaible-----------------------
    //----------------------------------------------Step No1
    //Folio Field
    final folioField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('No. Folio'),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: TextFormField(
            controller: folioController,
            readOnly: true,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.pages),
              contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              hintText: "Folio",
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
        const Text('Fecha llegada'),
        const SizedBox(width: 30),
        Expanded(
          flex: 2,
          child: TextFormField(
            readOnly: true,
            controller: fechaController,
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

    //HourLlegadaField
    final hourLlegadaField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Hora llegada'),
        const SizedBox(width: 30),
        Expanded(
          flex: 2,
          child: TextFormField(
            readOnly: true,
            controller: hourLlegadaController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.access_alarm),
              contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              hintText: "Hora llegada",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );

    //hourAccidenteField
    final hourAccidenteField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          flex: 1,
          child: Text("Hora Accidente"),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: TextFormField(
            readOnly: true,
            controller: hourAccidenteController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.access_alarm),
              contentPadding: const EdgeInsets.fromLTRB(05, 0, 05, 0),
              hintText: "Hora Accidente",
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
                hourAccidenteController.text =
                    timePicket.format(context).toString();
                //Guarda hora en objeto levantamiento
                widget.levantamiento.horaAccidente =
                    timePicket.format(context).toString();
              }
            },
          ),
        ),
      ],
    );

    //UbicacionField
    final ubicacionField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Ubicación'),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: TextFormField(
            focusNode: ubicacionFocus,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(entreFocus);
            },
            controller: ubicacionController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.add_location_alt_outlined),
              contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              hintText: "Ubicacion",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onChanged: ((value) {
              //Objeto ubicacion
              widget.levantamiento.ubicacion = value;
            }),
          ),
        ),
      ],
    );

    //entreField
    final entreField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Entre'),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: TextFormField(
            focusNode: entreFocus,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(yFocus);
            },
            controller: entreController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.add_location_alt_outlined),
              contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              hintText: "Entre",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onChanged: ((value) {
              //Objeto cambio
              widget.levantamiento.entre = value;
            }),
          ),
        ),
      ],
    );

    //YField
    final yField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('y'),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: TextFormField(
            focusNode: yFocus,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(noEconomicoFocus);
            },
            controller: yController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.add_location_alt_outlined),
              contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              hintText: "y",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onChanged: ((value) {
              //Objeto cambio
              widget.levantamiento.y = value;
            }),
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
                contentPadding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                hintText: "Longitud",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )),
        const SizedBox(width: 05),
        Expanded(
          flex: 1,
          child: TextFormField(
            readOnly: true,
            controller: latController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.add_location_outlined),
              contentPadding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
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
              widget.levantamiento.latitud =
                  _currentPosition.latitude.toString();
              widget.levantamiento.longitud =
                  _currentPosition.longitude.toString();
              //print(latController.text);
              //print(lonController.text);
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
              image1 != null
                  ? FadeInImage(
                      image: FileImage(image1!),
                      placeholder: const AssetImage('assets/jar-loading.gif'),
                      fadeInDuration: const Duration(milliseconds: 200),
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    )
                  : TextButton(
                      child: const Text(" + "),
                      onPressed: () async {
                        // Capture a photo
                        photo1 =
                            await _picker.pickImage(source: ImageSource.camera);
                        if (photo1 == null) return;
                        // transforma imagen a file
                        final imageTemporal = File(photo1!.path);
                        //Agrega foto a la lista
                        widget.levantamiento.fotosLev[0] = imageTemporal;
                        setState(() {
                          this.image1 = imageTemporal;
                        });
                      },
                    ),
              //Condicion para reemplazar el boton con la imagen cargada
              image2 != null
                  ? FadeInImage(
                      image: FileImage(image2!),
                      placeholder: const AssetImage('assets/jar-loading.gif'),
                      fadeInDuration: const Duration(milliseconds: 200),
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    )
                  : TextButton(
                      child: const Text(" + "),
                      onPressed: () async {
                        // Capture a photo
                        photo2 =
                            await _picker.pickImage(source: ImageSource.camera);
                        if (photo2 == null) return;
                        // transforma imagen a file
                        final imageTemporal = File(photo2!.path);
                        //Agrega foto a la lista
                        widget.levantamiento.fotosLev[1] = imageTemporal;
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
              image3 != null
                  ? FadeInImage(
                      image: FileImage(image3!),
                      placeholder: const AssetImage('assets/jar-loading.gif'),
                      fadeInDuration: const Duration(milliseconds: 200),
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    )
                  : TextButton(
                      child: const Text(" + "),
                      onPressed: () async {
                        // Capture a photo
                        photo3 =
                            await _picker.pickImage(source: ImageSource.camera);
                        if (photo3 == null) return;
                        // transforma imagen a file
                        final imageTemporal = File(photo3!.path);
                        //Agrega foto a la lista
                        widget.levantamiento.fotosLev[2] = imageTemporal;
                        setState(() {
                          this.image3 = imageTemporal;
                        });
                      },
                    ),
              //Condicion para reemplazar el boton con la imagen cargada
              image4 != null
                  ? FadeInImage(
                      image: FileImage(image4!),
                      placeholder: const AssetImage('assets/jar-loading.gif'),
                      fadeInDuration: const Duration(milliseconds: 200),
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    )
                  : TextButton(
                      child: const Text(" + "),
                      onPressed: () async {
                        // Capture a photo
                        photo4 =
                            await _picker.pickImage(source: ImageSource.camera);
                        if (photo4 == null) return;
                        // transforma imagen a file
                        final imageTemporal = File(photo4!.path);
                        //Agrega foto a la lista
                        widget.levantamiento.fotosLev[3] = imageTemporal;
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
              image5 != null
                  ? FadeInImage(
                      image: FileImage(image5!),
                      placeholder: const AssetImage('assets/jar-loading.gif'),
                      fadeInDuration: const Duration(milliseconds: 200),
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    )
                  : TextButton(
                      child: const Text(" + "),
                      onPressed: () async {
                        // Capture a photo
                        photo5 =
                            await _picker.pickImage(source: ImageSource.camera);
                        if (photo5 == null) return;
                        // transforma imagen a file
                        final imageTemporal = File(photo5!.path);
                        //Agrega foto a la lista
                        widget.levantamiento.fotosLev[4] = imageTemporal;
                        setState(() {
                          this.image5 = imageTemporal;
                        });
                      },
                    ),
              //Condicion para reemplazar el boton con la imagen cargada
              image6 != null
                  ? FadeInImage(
                      image: FileImage(image6!),
                      placeholder: const AssetImage('assets/jar-loading.gif'),
                      fadeInDuration: const Duration(milliseconds: 200),
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    )
                  : TextButton(
                      child: const Text(" + "),
                      onPressed: () async {
                        // Capture a photo
                        photo6 =
                            await _picker.pickImage(source: ImageSource.camera);
                        if (photo6 == null) return;
                        // transforma imagen a file
                        final imageTemporal = File(photo6!.path);
                        //Agrega foto a la lista
                        widget.levantamiento.fotosLev[5] = imageTemporal;
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

    //VehiculoField
    final vehiculoField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: RadioListTile(
            title: const Text("Servicio Publico"),
            value: "1",
            groupValue: VehiRespondable,
            onChanged: (value) {
              setState(() {
                VehiRespondable = value.toString();
                noeconomicoController.text = "";
                placasController.text = "";
              });
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: RadioListTile(
            title: const Text("Particular"),
            value: "2",
            groupValue: VehiRespondable,
            onChanged: (value) {
              setState(() {
                VehiRespondable = value.toString();
                noeconomicoController.text = "";
                placasController.text = "";
              });
            },
          ),
        ),
      ],
    );

    //PlacasField
    final placasField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            flex: 1,
            child: VehiRespondable == "1"
                ? TextFormField(
                    enabled: true,
                    controller: noeconomicoController,
                    focusNode: noEconomicoFocus,
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(noLicenciaFocus);
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.all_inbox),
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "No.Economico",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      widget.levantamiento.noEconomico = value;
                    })
                : TextFormField(
                    enabled: false,
                    controller: noeconomicoController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.all_inbox),
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "No.Economico",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )),
        const SizedBox(width: 05),
        Expanded(
            flex: 1,
            child: VehiRespondable == "2"
                ? TextFormField(
                    enabled: true,
                    controller: placasController,
                    focusNode: placasFocus,
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(noLicenciaFocus);
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.calendar_view_week),
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Placas",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      widget.levantamiento.placas = value;
                    })
                : TextFormField(
                    enabled: false,
                    controller: placasController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.calendar_view_week),
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Placas",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )),
      ],
    );

    //BuscarPlaca
    final buscarPlaca = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: TextButton(
            onPressed: () {
              var mensaje = 'No encontrado';
              var color = Colors.red;
              if (noeconomicoController.text != "") {
                //Variables locales 
                //Condicion para la busqueda
                var busquedatemp = servicioP.where((element) =>
                    element['noeconomico'] == noeconomicoController.text);
                
                if (busquedatemp.isNotEmpty) {
                  descripcionController.text =
                      busquedatemp.first['descripcion']!;
                  concesionController.text = busquedatemp.first['concecion']!;
                  mensaje = 'Encontrado en nube';
                  color = Colors.green;
                  //Cambia objeto
                  widget.levantamiento.noEconomico = noeconomicoController.text;
                  widget.levantamiento.concesionario = concesionController.text;
                  widget.levantamiento.descripcion = descripcionController.text;
                }
                var busquedatemp2 = servicioP.where((element) =>
                    element['nuevonoeconomico'] == noeconomicoController.text);
                    
                if (busquedatemp2.isNotEmpty) {
                  descripcionController.text =
                      busquedatemp2.first['descripcion']!;
                  concesionController.text = busquedatemp2.first['concecion']!;
                  mensaje = 'Encontrado en nube';
                  color = Colors.green;
                  //Cambia objeto
                  widget.levantamiento.noEconomico = noeconomicoController.text;
                  widget.levantamiento.concesionario = concesionController.text;
                  widget.levantamiento.descripcion = descripcionController.text;
                }
              }
              if (placasController.text != "") {
                //Variables locales 
                //Condicion para la busqueda
                var busquedatemp = Placas.where(
                    (element) => element['placas'] == placasController.text);
                if (busquedatemp.isNotEmpty) {
                  descripcionController.text =
                      busquedatemp.first['descripcion']!;
                  concesionController.text = busquedatemp.first['concecion']!;
                  mensaje = 'Encontrado en nube';
                  color = Colors.green;
                  //Cambiar objeto
                  widget.levantamiento.placas = placasController.text;
                  widget.levantamiento.descripcion = descripcionController.text;
                  widget.levantamiento.concesionario = concesionController.text;
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

    //DescripcionField
    final descripcionField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          flex: 1,
          child: Text("Descripcion"),
        ),
        Expanded(
          flex: 3,
          child: TextFormField(
            readOnly: true,
            controller: descripcionController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.assessment_outlined),
              contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );

    //Consen/particularField
    final consenParticularField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          flex: 1,
          child: Text("Concensionario / Particular"),
        ),
        Expanded(
          flex: 2,
          child: TextFormField(
            readOnly: true,
            controller: concesionController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.account_circle_outlined),
              contentPadding: const EdgeInsets.fromLTRB(05, 15, 05, 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );

    //NoLicencia
    final noLicenciaField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          flex: 1,
          child: Text("No. Licencia"),
        ),
        Expanded(
          flex: 3,
          child: TextFormField(
            focusNode: noLicenciaFocus,
            controller: nolicenciaController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.account_box_sharp),
              contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              hintText: "No. Licencia",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: TextButton(
            onPressed: () {
              var mensaje = 'No encontrado';
              var color = Colors.red;
              if (nolicenciaController.text != "") {
                var busquedatemp = licencias.where((element) =>
                    element['licencia'] == nolicenciaController.text);
                if (busquedatemp.isNotEmpty) {
                  tipoController.text = busquedatemp.first['tipo']!;
                  nombreController.text = busquedatemp.first['nombre']!;
                  vigenciaController.text = busquedatemp.first['vigencia']!;
                  mensaje = 'Encontrado en nube';
                  color = Colors.green;
                  //Cambia Objeto
                  widget.levantamiento.noLicencia = nolicenciaController.text;
                  widget.levantamiento.tipo = tipoController.text;
                  widget.levantamiento.nombre = tipoController.text;
                  widget.levantamiento.vigencia = vigenciaController.text;
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
            child: const Text('Buscar'),
          ),
        ),
      ],
    );

    //TipoField
    final tipoField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          flex: 1,
          child: Text("Tipo"),
        ),
        Expanded(
          flex: 5,
          child: TextFormField(
            readOnly: true,
            controller: tipoController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.contacts_outlined),
              contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );

    //NombreField
    final nombreField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          flex: 1,
          child: Text("Nombre"),
        ),
        Expanded(
          flex: 4,
          child: TextFormField(
            readOnly: true,
            controller: nombreController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.document_scanner_outlined),
              contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );

    //VigenciaField
    final vigenciaField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          flex: 1,
          child: Text("Vigencia"),
        ),
        Expanded(
          flex: 4,
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

    //------------------------------------------------------------------Step No1
    //multi foto, Descripcion, concecionario, vehiculo field, no licencia, tipo, nombre, vigencia

    //------------------------------------------------------------Object Variable-----------------------

    return Container(
      height: 1200,
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
            const Divider(
              thickness: 2,
            ),
            dateField,
            hourLlegadaField,
            hourAccidenteField,
            const Divider(
              thickness: 2,
            ),
            ubicacionField,
            entreField,
            yField,
            posicionField,
            fotoField,
            const Divider(
              thickness: 2,
            ),
            vehiculoField,
            placasField,
            buscarPlaca,
            descripcionField,
            consenParticularField,
            const Divider(
              thickness: 2,
            ),
            noLicenciaField,
            tipoField,
            nombreField,
            vigenciaField,
          ],
        ),
      ),
    );
  } //widget
}
