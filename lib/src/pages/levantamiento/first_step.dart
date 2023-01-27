import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

import 'package:movilidad/src/model/levantamiento_model.dart';

import '../../providers/afectadoView_provider.dart';

class firstStep extends StatefulWidget {
  //objeto
  final LevantamientoModel levantamiento = LevantamientoModel(
    folio: '',
    poliza: '',
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
//----------------------------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------Variables Globales-------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------------------------------

var estado = 'Aguascalientes';
var listaestado = [
  'Aguascalientes',
  'Nayarit',
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

//----------------------------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------Variables Globales-------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------------------------------

class _firstStepState extends State<firstStep> {
//----------------------------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------Variables locales-------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------------------------------

  // form key avisa los cambios
  final _formKey = GlobalKey<FormState>();

  // Focus Nodes
  //Step1
  final ubicacionFocus = FocusNode();
  final entreFocus = FocusNode();
  final yentreFocus = FocusNode();
  final noEconomicoFocus = FocusNode();
  final placasFocus = FocusNode();
  final conceFocus = FocusNode();
  final descFocus = FocusNode();
  final noLicenciaFocus = FocusNode();
  final tipoFocus = FocusNode();
  final vigenciaFocus = FocusNode();
  final nombreFocus = FocusNode();
  final polizaFocus = FocusNode();

  // editing controller
  //Step1
  final TextEditingController folioController = TextEditingController();
  final TextEditingController polizaController = TextEditingController();
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
  final TextEditingController vigenciaAscController = TextEditingController();

  //---------------------------------------------Inicio de variables y controladores------------------

  String? aseguradora;
  String VehiRespondable = "1";
  //ImagePicker
  final ImagePicker _picker = ImagePicker();
  final List<XFile>? images = List<XFile>.empty();
  XFile? photo1, photo2, photo3, photo4, photo5, photo6 = XFile("no");
  File? image1, image2, image3, image4, image5, image6;

  //DropDowns
  var tipo = 'Automovilista';
  var tipoLicArray = [
    'Automovilista',
    'Chofer',
    'Motociclista',
    'Chofer Servicio Publico'
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

  var Placas = [
    {
      'placas': '1234',
      'descripcion': "NISSAN",
      'concecion': 'PEDRO PEREZ LOPEZ'
    },
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
      'tipo': "B",
      'nombre': 'ABNER ULISES MENDOZA HERNANDEZ',
      'vigencia': '07/26/2025',
    },
    {
      'licencia': '11BDGTTN029448',
      'tipo': "B",
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
      'tipo': "A",
      'nombre': 'ANA  MATILDE DE LAS MERCEDES PARDO HERNANDEZ',
      'vigencia': '7/26/2024'
    },
    {
      'licencia': '11ADGTTN005414',
      'tipo': "C",
      'nombre': 'ROSALIA GUADALUPEPEREZ PEREZ',
      'vigencia': '7/26/2024,A'
    },
  ];

//----------------------------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------Variables locales-------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    /* A MEJORAR
      Reduccion de funciones tipo buildField
    */

    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------Funciones-------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------

    //FUNCION PARA CONSEGUIR FOLIO NUEVO
    String getFolio() {
      return "01";
    }

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
      noeconomicoController.text = '';
      placasController.text = '';
      descripcionController.text = '';
      concesionController.text = '';
      nolicenciaController.text = '';
      tipoController.text = '';
      vigenciaController.text = '';
      nombreController.text = '';
    }

    Widget _listaAseguradora() {
      return FutureBuilder(
          future: afectadoViewProvider.cargarDataAseguradora(),
          initialData: [],
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //Variable que contiene la informacion
              var data = snapshot.data!;
              //Lista temporal con la informacion para los dropdown
              List<DropdownMenuItem> tempList = [];
              data.forEach((element) {
                tempList.add(DropdownMenuItem(
                  child: Text(element['nombre']),
                  value: element['nombre'],
                ));
              });
              //Retrona objeto dropdown
              return DropdownButton(
                hint: const Text('Selecciona Aseguradora'),
                value: aseguradora,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: tempList,
                onChanged: (newValue) {
                  setState(() {
                    aseguradora = newValue.toString();
                  });
                },
              );
            }
            return const Text('no data');
          });
    }

    //Actualiza levantamiento
    void ActualizarLev() {
      widget.levantamiento.concesionario = concesionController.text;
      widget.levantamiento.folio = folioController.text;
      widget.levantamiento.fechaLlegada = fechaController.text;
      widget.levantamiento.horaLlegada = hourLlegadaController.text;
      widget.levantamiento.horaAccidente = hourAccidenteController.text;
      widget.levantamiento.ubicacion = ubicacionController.text;
      widget.levantamiento.entre = entreController.text;
      widget.levantamiento.yentre = yentreController.text;
      widget.levantamiento.longitud = lonController.text;
      widget.levantamiento.latitud = latController.text;
      widget.levantamiento.noEconomico = noeconomicoController.text;
      widget.levantamiento.placas = placasController.text;
      widget.levantamiento.descripcion = descripcionController.text;
      widget.levantamiento.concesionario = concesionController.text;
      widget.levantamiento.noLicencia = nolicenciaController.text;
      estado == 'Nayarit'
          ? widget.levantamiento.tipo = tipoController.text
          : widget.levantamiento.tipo = tipo;
      widget.levantamiento.nombre = nombreController.text;
      widget.levantamiento.vigencia = vigenciaController.text;
      widget.levantamiento.poliza = polizaController.text;
      widget.levantamiento.aseguradora = aseguradora;
      widget.levantamiento.vigenciaAsc = vigenciaAscController.text;
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

    //-------------------------------------------------Folio Field
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

    //-------------------------------------------------DateField
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

    //-------------------------------------------------HourLlegadaField
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

    //-------------------------------------------------hourAccidenteField
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

    //-------------------------------------------------UbicacionField
    final ubicacionField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Ubicacion'),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: buildTextFieldFocus(
            'Ubicacion',
            ubicacionController,
            Icons.add_location_alt_outlined,
            false,
            const EdgeInsets.fromLTRB(20, 15, 20, 15),
            ubicacionFocus,
            entreFocus,
          ),
        ),
      ],
    );

    //-------------------------------------------------entreField
    final entreField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Entre'),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: buildTextFieldFocus(
            'Entre',
            entreController,
            Icons.add_location_alt_outlined,
            false,
            const EdgeInsets.fromLTRB(20, 15, 20, 15),
            entreFocus,
            yentreFocus,
          ),
        ),
      ],
    );

    //-------------------------------------------------entre2Field
    final yentreField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('y entre'),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: buildTextFieldFocus(
            'yEntre',
            yentreController,
            Icons.add_location_alt_outlined,
            false,
            const EdgeInsets.fromLTRB(20, 15, 20, 15),
            yentreFocus,
            ubicacionFocus,
          ),
        ),
      ],
    );

    //-------------------------------------------------PosicionField
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

    //-------------------------------------------------MultiFotoField
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

    //-------------------------------------------------FotoField
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

    //-------------------------------------------------VehiculoField
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

    //-------------------------------------------------PlacasField
    final placasField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            flex: 1,
            child: VehiRespondable == "1"
                ? buildTextFieldFocus(
                    'No.Economico',
                    noeconomicoController,
                    Icons.all_inbox,
                    false,
                    const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    noEconomicoFocus,
                    descFocus,
                  )
                : buildTextFieldFocus(
                    'No.Economico',
                    noeconomicoController,
                    Icons.all_inbox,
                    true,
                    const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    noEconomicoFocus,
                    descFocus,
                  )),
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
                    noLicenciaFocus,
                  )
                : buildTextFieldFocus(
                    'Placas',
                    placasController,
                    Icons.calendar_view_week,
                    true,
                    const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    placasFocus,
                    noLicenciaFocus,
                  )),
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

    //-------------------------------------------------DescripcionField
    final descripcionField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Descripcion"),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: buildTextFieldFocus(
            '',
            descripcionController,
            Icons.assessment_outlined,
            true,
            const EdgeInsets.fromLTRB(20, 15, 20, 15),
            descFocus,
            conceFocus,
          ),
        ),
      ],
    );

    //-------------------------------------------------Consen/particularField
    final consenParticularField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Concensionario / Particular"),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: buildTextFieldFocus(
            '',
            concesionController,
            Icons.account_circle_outlined,
            true,
            const EdgeInsets.fromLTRB(20, 15, 20, 15),
            conceFocus,
            noLicenciaFocus,
          ),
        ),
        const SizedBox(width: 100),
      ],
    );

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
              if (nolicenciaController.text != "") {
                var busquedatemp = licencias.where((element) =>
                    element['licencia'] == nolicenciaController.text);
                if (busquedatemp.isNotEmpty) {
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
                  tipoController.text = tipoLic;
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
      ],
    );

    //-------------------------------------------------NoLicencia
    final noLicenciaField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("No. Licencia"),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: buildTextFieldFocus(
            'No. Licencia',
            nolicenciaController,
            Icons.account_circle_outlined,
            false,
            const EdgeInsets.fromLTRB(20, 15, 20, 15),
            noLicenciaFocus,
            tipoFocus,
          ),
        ),
        const SizedBox(width: 05),
      ],
    );

    //-------------------------------------------------TipoField
    final tipoField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Tipo"),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: buildTextFieldFocus(
            '',
            tipoController,
            Icons.contacts_outlined,
            true,
            const EdgeInsets.fromLTRB(20, 15, 20, 15),
            tipoFocus,
            vigenciaFocus,
          ),
        ),
        const SizedBox(width: 100),
      ],
    );

    //-------------------------------------------------NombreField
    final nombreField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Nombre"),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: buildTextFieldFocus(
            '',
            nombreController,
            Icons.document_scanner_outlined,
            true,
            const EdgeInsets.fromLTRB(20, 15, 20, 15),
            nombreFocus,
            tipoFocus,
          ),
        ),
        const SizedBox(width: 100),
      ],
    );

    //-------------------------------------------------vigenciaField
    final vigenciaField = TextFormField(
      readOnly: true,
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
          locale: const Locale('es', 'ES'),
        );
        if (datePicket != null) {
          //make format to the date
          var formatedDate = DateFormat("dd-MM-yyyy").format(datePicket);
          vigenciaController.text = formatedDate.toString();
        }
      },
      onChanged: (value) {
        vigenciaController.text = value;
      },
    );

    //-------------------------------------------------tipoLicenciaField
    final tipoLic = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          flex: 1,
          child: Text("Tipo Licencia"),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: DropdownButton(
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
          child: Text("Estado"),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: DropdownButton(
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

    //-------------------------------------------------polizaField
    final polizaField =
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Expanded(
        flex: 2,
        child: Text("Poliza"),
      ),
      const SizedBox(width: 10),
      Expanded(
          flex: 10,
          child: buildTextFieldFocus(
            'Poliza',
            polizaController,
            Icons.article_outlined,
            false,
            const EdgeInsets.fromLTRB(10, 05, 10, 05),
            polizaFocus,
            noLicenciaFocus,
          )),
      const SizedBox(width: 50),
    ]);

    //-------------------------------------------------aseguradoraField
    final aseguradoraField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Aseguradora",
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: _listaAseguradora(),
          ),
        ),
      ],
    );

    //vigenciaAseField
    final vigenciaAseField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: TextFormField(
            readOnly: true,
            controller: vigenciaAscController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.calendar_today, color: Colors.black),
              contentPadding: const EdgeInsets.fromLTRB(05, 0, 05, 0),
              hintText: "Vigencia de poliza",
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
              );
              if (datePicket != null) {
                //make format to the date
                var formatedDate = DateFormat("dd-MM-yyyy").format(datePicket);
                vigenciaAscController.text = formatedDate.toString();
              }
            },
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
          Expanded(flex: 1, child: vigenciaField),
        ],
      ),
      const SizedBox(height: 20),
      nombreField,
      const SizedBox(height: 20),
      polizaField,
      const SizedBox(height: 10),
      aseguradoraField,
      const SizedBox(height: 10),
      vigenciaAseField,
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
          descFocus,
          conceFocus,
        ),
        const SizedBox(height: 10),
        buildTextFieldFocus(
          'Concensionario / Particular',
          concesionController,
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
          nolicenciaController,
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
          '',
          nombreController,
          Icons.document_scanner_outlined,
          false,
          const EdgeInsets.fromLTRB(20, 15, 20, 15),
          nombreFocus,
          polizaFocus,
        ),
        const SizedBox(height: 10),
        polizaField,
        const SizedBox(height: 10),
        aseguradoraField,
        const SizedBox(height: 10),
        vigenciaAseField,
      ],
    );

    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------Object Variable-------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------

    return Container(
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
            folioField,
            const SizedBox(height: 20),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: dateField),
                Expanded(flex: 1, child: hourLlegadaField),
              ],
            ),
            const SizedBox(height: 20),
            hourAccidenteField,
            const SizedBox(height: 20),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(height: 20),
            ubicacionField,
            const SizedBox(height: 20),
            entreField,
            const SizedBox(height: 20),
            yentreField,
            const SizedBox(height: 20),
            posicionField,
            const SizedBox(height: 20),
            fotoField,
            const SizedBox(height: 20),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(height: 20),
            const Text(
              'Vehiculo Responsable',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            estadosField,
            const SizedBox(height: 20),
            estado == 'Nayarit' ? vehiculoConBD : vehiculoManual,
            const SizedBox(height: 20),
          ],
        ),
        onChanged: () {
          ActualizarLev();
        },
      ),
    );
  }
}
