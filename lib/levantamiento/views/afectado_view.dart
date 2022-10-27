import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class afectadoView extends StatefulWidget {
  @override
  State<afectadoView> createState() => _afectadoViewState();
}

//-----------Variables globales
// Focus Nodes
//Step2
final noLicenciaFocus = FocusNode();

// editing controller
//Step2
final TextEditingController polizaController = TextEditingController();
final TextEditingController vigenciaController = TextEditingController();

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
          controller: vigenciaController,
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      padding: EdgeInsets.all(10),
      child:
        //---------------Column
        Column(
          children: [
            //--AseguradoraField
            Container(
              child: Row(
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
              ),
            ),
            //------AseguradoraField
            const SizedBox(height: 10),
            polizaField,
            const SizedBox(height: 10),
            vigenciaField,
            const SizedBox(height: 10),
            nombreAcField,
            
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
