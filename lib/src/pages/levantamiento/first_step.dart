import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

import 'package:movilidad/src/model/levantamiento_model.dart';
import 'package:movilidad/src/pages/levantamiento/views/licencias_view.dart';
import 'package:movilidad/src/pages/levantamiento/views/placasEconomico_view.dart';

class firstStep extends StatefulWidget {
  //objeto
  final LevantamientoModel levantamiento = LevantamientoModel(
    folio: '',
    fotosLev: [
      File(''),
      File(''),
      File(''),
      File(''),
      File(''),
      File(''),
    ],
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
  final yentreFocus = FocusNode();
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
  final TextEditingController yentreController = TextEditingController();

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
    /* A MEJORAR
      Se puede crear funcion que cree Fileds donde se pase nombre de field, icono y controlador asi reducimos codigo

    */

    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------Funciones-------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------

    //FUNCION PARA CONSEGUIR FOLIO NUEVO
    String getFolio() {
      return "01";
    }

    void agregarManual(LevantamientoModel lev) {
      //Limpia celdas
      noeconomicoController.text = '';
      placasController.text = '';
      //Validacion
      if (lev.placas != '') {
        placasController.text = lev.placas!;
        //Cambia objeto
        widget.levantamiento.placas = lev.placas;
        VehiRespondable = "2";
      }
      if (lev.noEconomico != '') {
        noeconomicoController.text = lev.noEconomico!;
        //Cambia objeto
        widget.levantamiento.noEconomico = lev.noEconomico;
        VehiRespondable = "1";
      }
      //Asignacion
      descripcionController.text = lev.descripcion!;
      concesionController.text = lev.concesionario!;
      //Cambia objeto
      widget.levantamiento.concesionario = concesionController.text;
      widget.levantamiento.descripcion = descripcionController.text;
      setState(() {}); //Actualiza pantalla
    }

    void mostrarVentanaEmergente(BuildContext context) {
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) {
            return AlertDialog(
              content: Container(
                padding: const EdgeInsets.all(0),
                width: MediaQuery.of(context).size.width,
                child: placasEcoView(agregarManual),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            );
          });
    } //widget

    void agregarManualLicencia(LevantamientoModel lev) {
      //Asignacion
      nolicenciaController.text = lev.noLicencia!;
      tipoController.text = lev.tipo!;
      vigenciaController.text = lev.vigencia!;
      nombreController.text = lev.nombre!;
      //Cambia objeto
      widget.levantamiento.noLicencia = nolicenciaController.text;
      widget.levantamiento.tipo = tipoController.text;
      widget.levantamiento.vigencia = vigenciaController.text;
      widget.levantamiento.nombre = nombreController.text;
      setState(() {}); //Actualiza pantalla
    }

    void mostrarVentanaEmergenteLicencia(BuildContext context) {
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) {
            return AlertDialog(
              content: Container(
                padding: const EdgeInsets.all(0),
                width: MediaQuery.of(context).size.width,
                child: licenciasView(agregarManualLicencia),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            );
          });
    } //widget

    FadeInImage fadeImg(File? file) {
      return FadeInImage(
        image: FileImage(file!),
        placeholder: const AssetImage('assets/jar-loading.gif'),
        fadeInDuration: const Duration(milliseconds: 200),
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      );
    }

    //Funcion que crea TextFields
    Widget buildTextField(String hint, TextEditingController controller,
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

    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------Funciones-------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------

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

    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------Object Variable-------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //Folio Field
    final folioField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('No. Folio'),
        const SizedBox(width: 10),
        buildTextField('Folio', folioController, Icons.pages, true,
            const EdgeInsets.fromLTRB(20, 15, 20, 15), 2),
        const SizedBox(width: 500),
      ],
    );

    //DateField
    final dateField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Fecha llegada'),
        const SizedBox(width: 30),
        buildTextField('Fecha', fechaController, Icons.calendar_today, true,
            const EdgeInsets.fromLTRB(20, 15, 20, 15), 2),
        const SizedBox(width: 70),
      ],
    );

    //HourLlegadaField
    final hourLlegadaField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Hora llegada'),
        const SizedBox(width: 20),
        buildTextField(
            'Hora llegada',
            hourLlegadaController,
            Icons.access_alarm,
            true,
            const EdgeInsets.fromLTRB(20, 15, 20, 15),
            2),
        const SizedBox(width: 100),
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
        const SizedBox(width: 400),
      ],
    );

    //UbicacionField
    final ubicacionField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Ubicacion'),
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
              FocusScope.of(context).requestFocus(yentreFocus);
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

    //entre2Field
    final yentreField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('y entre'),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: TextFormField(
            focusNode: yentreFocus,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(noEconomicoFocus);
            },
            controller: yentreController,
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
              widget.levantamiento.yentre = value;
            }),
          ),
        ),
      ],
    );

    //PosicionField
    final posicionField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildTextField('Longitud', lonController, Icons.add_location_outlined,
            true, const EdgeInsets.fromLTRB(20, 15, 20, 15), 1),
        const SizedBox(width: 05),
        buildTextField('Latitud', latController, Icons.add_location_outlined,
            true, const EdgeInsets.fromLTRB(20, 15, 20, 15), 1),
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
                  ? fadeImg(image1)
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
                  ? fadeImg(image2)
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
                  ? fadeImg(image3)
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
                  ? fadeImg(image4)
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
                  ? fadeImg(image5)
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
                  ? fadeImg(image6)
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
        ), //-------------Fin boton Buscar placas
        Expanded(
          flex: 1,
          child: TextButton(
              child: const Text('Agregado Manual'),
              onPressed: () {
                mostrarVentanaEmergente(context);
              }),
        ),
      ],
    );

    //DescripcionField
    final descripcionField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Descripcion"),
        const SizedBox(width: 10),
        buildTextField('', descripcionController, Icons.assessment_outlined,
            true, const EdgeInsets.fromLTRB(20, 15, 20, 15), 2),
      ],
    );

    //Consen/particularField
    final consenParticularField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Concensionario / Particular"),
        const SizedBox(width: 10),
        buildTextField('', concesionController, Icons.account_circle_outlined,
            true, const EdgeInsets.fromLTRB(20, 15, 20, 15), 2),
        const SizedBox(width: 100),
      ],
    );

    //Busqueda Button
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
          ),
        ),
        Expanded(
          flex: 1,
          child: TextButton(
            child: const Text('Agregado Manual'),
            onPressed: () {
              mostrarVentanaEmergenteLicencia(context);
            },
          ),
        ),
      ],
    );

    //NoLicencia
    final noLicenciaField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("No. Licencia"),
        const SizedBox(width: 10),
        buildTextField(
            'No. Licencia',
            nolicenciaController,
            Icons.account_box_sharp,
            false,
            const EdgeInsets.fromLTRB(20, 15, 20, 15),
            2),
        const SizedBox(width: 05),
      ],
    );

    //TipoField
    final tipoField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Tipo"),
        const SizedBox(width: 10),
        buildTextField('', tipoController, Icons.contacts_outlined, true,
            const EdgeInsets.fromLTRB(20, 15, 20, 15), 2),
        const SizedBox(width: 100),
      ],
    );

    //VigenciaField
    final vigenciaField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Vigencia"),
        const SizedBox(width: 05),
        buildTextField('', vigenciaController, Icons.ad_units_rounded, true,
            const EdgeInsets.fromLTRB(20, 15, 20, 15), 2),
        const SizedBox(width: 100),
      ],
    );

    //NombreField
    final nombreField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Nombre"),
        const SizedBox(width: 10),
        buildTextField('', nombreController, Icons.document_scanner_outlined,
            true, const EdgeInsets.fromLTRB(20, 15, 20, 15), 2),
        const SizedBox(width: 100),
      ],
    );

    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------Object Variable-------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: dateField),
                Expanded(flex: 1, child: hourLlegadaField),
              ],
            ),
            hourAccidenteField,
            const Divider(
              thickness: 2,
            ),
            ubicacionField,
            entreField,
            yentreField,
            posicionField,
            fotoField,
            const Divider(
              thickness: 2,
            ),
            const Text('Vehiculo Responsable',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
            vehiculoField,
            placasField,
            buscarPlaca,
            descripcionField,
            consenParticularField,
            const Divider(
              thickness: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: noLicenciaField),
                Expanded(flex: 1, child: busquedaButton),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: tipoField),
                Expanded(flex: 1, child: vigenciaField),
              ],
            ),
            nombreField,
          ],
        ),
      ),
    );
  }
}
