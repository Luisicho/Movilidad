import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';


import 'package:movilidad/src/pages/levantamiento/model/levantamiento.dart';

class firstStep extends StatefulWidget {
  //objeto
  final Levantamiento levantamiento = Levantamiento();
  firstStep({super.key, levantamiento});

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

  //-----------Inicio de variables y controladores------------------

  String VehiRespondable = "1";
  //ImagePicker
  final ImagePicker _picker = ImagePicker();
  final List<XFile>? images = List<XFile>.empty();
  XFile? photo1, photo2, photo3, photo4, photo5, photo6 = XFile("no");
  File? image1, image2, image3, image4, image5, image6;

  @override
  Widget build(BuildContext context) {

    //FUNCION PARA CONSEGUIR FOLIO NUEVO
    String getFolio() {
      return "";
    }

    //ASIGNA HORA DE HOY
    hourLlegadaController.text = TimeOfDay.now().format(context).toString();
    //Objeto
    widget.levantamiento.HoraLlegada =
        TimeOfDay.now().format(context).toString();
    //ASIGNA DIA DE HOY
    fechaController.text = DateFormat("dd-MM-yyyy").format(DateTime.now());
    //Objeto
    widget.levantamiento.FechaLlegada =
        DateFormat("dd-MM-yyyy").format(DateTime.now());

    //Consigue folio nuevo
    folioController.text = getFolio();

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
                widget.levantamiento.HoraAccidente =
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
              widget.levantamiento.Ubicacion = value;
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
              widget.levantamiento.Entre = value;
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
              widget.levantamiento.Y = value;
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
              widget.levantamiento.Latitud = _currentPosition.latitude.toString();
              widget.levantamiento.Longitud = _currentPosition.longitude.toString();
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
                  ? Image.file(
                      image1!,
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
                        widget.levantamiento.FotosLev[0] = imageTemporal;
                        setState(() {
                          this.image1 = imageTemporal;
                        });
                      },
                    ),
              //Condicion para reemplazar el boton con la imagen cargada
              image2 != null
                  ? Image.file(
                      image2!,
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
                        widget.levantamiento.FotosLev[1] = imageTemporal;
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
                  ? Image.file(
                      image3!,
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
                        widget.levantamiento.FotosLev[2] = imageTemporal;
                        setState(() {
                          this.image3 = imageTemporal;
                        });
                      },
                    ),
              //Condicion para reemplazar el boton con la imagen cargada
              image4 != null
                  ? Image.file(
                      image4!,
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
                        widget.levantamiento.FotosLev[3] = imageTemporal;
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
                  ? Image.file(
                      image5!,
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
                        widget.levantamiento.FotosLev[4] = imageTemporal;
                        setState(() {
                          this.image5 = imageTemporal;
                        });
                      },
                    ),
              //Condicion para reemplazar el boton con la imagen cargada
              image6 != null
                  ? Image.file(
                      image6!,
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
                        widget.levantamiento.FotosLev[5] = imageTemporal;
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
                      widget.levantamiento.NoEconomico = value;
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
                      widget.levantamiento.Placas = value;
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
              //-------------Toast
              Fluttertoast.showToast(
                  msg: 'Buscando en nube',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
              //-------------Toast
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
              //-------------Toast
              Fluttertoast.showToast(
                  msg: 'Buscando en nube',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
              //-------------Toast
              //Cambia Objeto
              widget.levantamiento.NoLicencia = nolicenciaController.text;
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

    //--------------Step No1
    //multi foto, Descripcion, concecionario, vehiculo field, no licencia, tipo, nombre, vigencia

    //--------------Object Varaible-----------------------

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
