import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    //user field
    final usuarioField = TextFormField(
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
    );

    //DateField
    final dateField = TextFormField(
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
        DateTime? datePicket = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1999),
          lastDate: DateTime(2050),
        );
        if (datePicket != null) {
          //make format to the date
          var formatedDate = DateFormat("dd-MM-yyyy").format(datePicket);
          fechaController.text = formatedDate.toString();
        }
      },
    );

    //HourField
    final hourField = TextFormField(
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
        TimeOfDay? timePicket = await showTimePicker(
          context: context, 
          initialTime: TimeOfDay.now(),
          );
        if (timePicket != null) {
          //make format to the time
          //var formatedDate = DateFormat("dd-MM-yyyy").format(datePicket);
          hourController.text = timePicket.format(context).toString();
        }
      },
    );

    return Scaffold(
      body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('No. Folio'),
                  const SizedBox(width: 30),
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                        focusNode: folioFocus,
                        controller: folioController,
                        readOnly: true,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.pages),
                          contentPadding:
                              const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          hintText: "Folio",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        )),
                  ),
                ],
              ),
              dateField,
              hourField,
              usuarioField,
            ],
          )),
    );
  }
}
