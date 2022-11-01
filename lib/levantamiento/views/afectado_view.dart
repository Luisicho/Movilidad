import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:movilidad/levantamiento/model/afectado.dart';

class afectadoView extends StatefulWidget {
  //variables
  final Function(Afectado) addAfectado;
  afectadoView(this.addAfectado);

  @override
  State<afectadoView> createState() => _afectadoViewState();
}

//-----------Variables globales
// Focus Nodes
//Step2
final nombreAFocus = FocusNode();
final CURPFocus = FocusNode();
final domicilioFocus = FocusNode();
final descripcionFocus = FocusNode();

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
final TextEditingController descripcionController = TextEditingController();
final TextEditingController tipoARController = TextEditingController();

//Generales
var aseguradora = "item1";
var listaAseguradora = ["item1", "item2", "item3"];

var institucionMed = "item1";
var listaInstitucionMed = ["item1", "item2", "item3"];

class _afectadoViewState extends State<afectadoView> {
  //----------------Variables Locales

  //polizaField
  final polizaField = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        flex: 3,
        child: TextFormField(
          controller: polizaController,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.article_outlined),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Poliza",
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
    //vigenciaField
    final vigenciaField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 10),
        Expanded(
          flex: 1,
          child: TextFormField(
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
              );
              if (datePicket != null) {
                //make format to the date
                var formatedDate = DateFormat("dd-MM-yyyy").format(datePicket);
                vigenciaController.text = formatedDate.toString();
              }
            },
          ),
        ),
      ],
    );

    //nombreAcField
    final nombreAcField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: TextFormField(
            focusNode: nombreAFocus,
            controller: nombreAcController,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(CURPFocus);
            },
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.attribution_outlined),
              contentPadding: const EdgeInsets.fromLTRB(20, 15, 05, 15),
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
        Expanded(
          flex: 1,
          child: TextFormField(
            focusNode: CURPFocus,
            controller: CURPController,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(domicilioFocus);
            },
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.badge_outlined),
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
        Expanded(
          flex: 1,
          child: TextFormField(
            focusNode: domicilioFocus,
            controller: domicilioController,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(descripcionFocus);
            },
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.add_home_outlined),
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

    //aseguradoraField
    final aseguradoraField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          flex: 1,
          child: Text("Aseguradora"),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: DropdownButton(
              // Initial Value
              value: aseguradora,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: listaAseguradora.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),

              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  aseguradora = newValue!;
                });
              },
            ),
          ),
        ),
      ],
    );

    //DateRecepcionField
    final dateRecepcionField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
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
        const Expanded(
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
                hourRecepcionController.text =
                    timePicket.format(context).toString();
              }
            },
          ),
        ),
      ],
    );

    //RecepcionField
    final RecepcionField =
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(flex: 2, child: dateRecepcionField),
      const SizedBox(width: 10),
      Expanded(flex: 1, child: hourRecepcionField),
    ]);

    //DateAltaField
    final dateAltaField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
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
        const Expanded(
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
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(flex: 2, child: dateAltaField),
      const SizedBox(width: 10),
      Expanded(flex: 1, child: hourAltaField),
    ]);

    //tipoARField
    final tipoARField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: TextFormField(
            controller: tipoARController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.airline_seat_flat_outlined),
              contentPadding: const EdgeInsets.fromLTRB(20, 15, 05, 15),
              hintText: "Tipo Atencion",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );

    //institucionMedField
    final institucionMedField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          flex: 1,
          child: Text("Institucion Medica"),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: DropdownButton(
              // Initial Value
              value: institucionMed,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: listaInstitucionMed.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),

              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  institucionMed = newValue!;
                });
              },
            ),
          ),
        ),
      ],
    );

    //DescripcionField
    final descripcionField = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 4,
          child: TextFormField(
            focusNode: descripcionFocus,
            controller: descripcionController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.bar_chart_outlined),
              contentPadding: const EdgeInsets.fromLTRB(20, 15, 05, 30),
              hintText: "Descripcion",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );

    void limpiarCeldas() {
      polizaController.text = "";
      vigenciaController.text = "";
      nombreAcController.text = "";
      CURPController.text = "";
      vigenciaController.text = "";
      domicilioController.text = "";
      tipoARController.text = "";
      fechaRecepcionController.text = "";
      hourRecepcionController.text = "";
      fechaAltaController.text = "";
      hourAltaController.text = "";
      descripcionController.text = "";
    }

    //----Return
    return Container(
      height: 800,
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child:
            //---------------Column
            Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Agregar Afectado',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 10),
            aseguradoraField,
            const SizedBox(height: 10),
            polizaField,
            const SizedBox(height: 10),
            vigenciaField,
            const SizedBox(height: 10),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(height: 10),
            nombreAcField,
            const SizedBox(height: 10),
            CURPField,
            const SizedBox(height: 10),
            domicilioField,
            const SizedBox(height: 10),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(height: 10),
            tipoARField,
            const SizedBox(height: 10),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(height: 10),
            institucionMedField,
            const SizedBox(height: 10),
            dateRecepcionField,
            const SizedBox(height: 10),
            hourRecepcionField,
            const Divider(
              thickness: 2,
            ),
            const SizedBox(height: 10),
            dateAltaField,
            const SizedBox(height: 10),
            hourAltaField,
            const SizedBox(height: 10),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(height: 10),
            descripcionField,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //--------------Boton para agregar Afectado
                ElevatedButton(
                  onPressed: () {
                    try {
                      //Funcion agregar afectado
                      final afectado = Afectado(
                          aseguradora,
                          polizaController.text,
                          vigenciaController.text,
                          nombreAcController.text,
                          CURPController.text,
                          domicilioController.text,
                          tipoARController.text,
                          institucionMed,
                          fechaRecepcionController.text,
                          hourRecepcionController.text,
                          fechaAltaController.text,
                          hourAltaController.text,
                          descripcionController.text);
                      limpiarCeldas();
                      //Agrega afectado
                      widget.addAfectado(afectado);
                      //-------------Toast
                      Fluttertoast.showToast(
                          msg: "Se agrego correctamente",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      //-------------Toast
                      Navigator.of(context).pop();
                    } catch (e) {
                      //-------------Toast
                      Fluttertoast.showToast(
                          msg: "Error al agregar",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      //-------------Toast
                    }
                  },
                  child: const Text('Agregar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
