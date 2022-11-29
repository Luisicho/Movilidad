import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:movilidad/src/pages/vehiculos/view/levantamiento_view.dart';
import 'package:movilidad/src/providers/vehiculo_provider.dart';
import 'package:movilidad/src/utils/icono_string_util.dart';
import '../levantamiento/model/levantamiento.dart';

class MainVehiculo extends StatefulWidget {
  const MainVehiculo({super.key});

  @override
  State<MainVehiculo> createState() => _MainVehiculoState();
}

class _MainVehiculoState extends State<MainVehiculo> {
  //--------Variables Locales
  final TextEditingController searchController = TextEditingController();
  //Se carga la lista de todos los levantamientos
  List<Levantamiento> levantamientos = listEjemploLevantamiento;

  @override
  Widget build(BuildContext context) {
    //-----------------Funciones
    void searchLevantamiento(String value) {
      //Busca en la lista de levantamientos el folio que se pide
      final suggestions = listEjemploLevantamiento.where((obj) {
        final folio = obj.Folio.toLowerCase();
        final input = value.toLowerCase();

        return folio.contains(input);
      }).toList();
      //Actualiza lista de pantalla
      setState(() => levantamientos = suggestions);
    }

    //-----Return
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Lista Vehiculos'),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: searchController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Codigo Folio',
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.blue)),
                ),
                onChanged: searchLevantamiento,
              ),
            ),
            Expanded(
              child: _lista(),
            ),
          ],
        ),
      ),
    );
  }

  //Funcion que crea lista nueva
  Widget _lista() {
    //Widget Future para crear lista a futuro luego de resivir la informacion
    return FutureBuilder(
      future: vehiculoProvider.cargarData(),
      initialData: [],
      builder: (context, snapshot) {
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }

  //Funcion que agrega elementos a la lista nueva
  List<Widget> _listaItems(List<dynamic>? data, BuildContext context) {
    final List<Widget> opciones = [];

    //Lee toda la informacion del JSON y la agrega a una lista de
    //  widgets que luego se muestran en lista
    data!.forEach((element) {
      final widgetTemp = ListTile(
        title: Text(element['folio']),
        subtitle: Text(element['descripcion']),
        leading: getIcon(element['icon']),
        trailing: const Icon(Icons.keyboard_arrow_right),
        onTap: () {
          //Funcion para entrar a la ventana levantamiento
          //Crea ruta estatica
          final route = MaterialPageRoute(builder: ((context) => const LevantamientoView()));
          Navigator.push(context, route);
        },
      );

      //Agrega a arreglo opciones
      opciones
        ..add(widgetTemp)
        ..add(Divider(
          thickness: 2,
        ));
    });

    return opciones;
  }
}

//------------CODIGO DE REPUESTO
/*
.builder(
                itemCount: levantamientos.length,
                itemBuilder: (context, index) {
                  //Carga la lista en un ListViewBuilder
                  final levantamiento = levantamientos[index];

                  return Column(
                    children: [
                      ListTile(
                        title: Text(levantamiento.Folio),
                        subtitle: Text(levantamiento.Descripcion),
                        leading: const Icon(Icons.car_crash),
                        trailing: const Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          //Funcion para abrir el levantamiento con su informacion
                          //-------------Toast
                          Fluttertoast.showToast(
                              msg: 'Abre Levantamiento ' + levantamiento.Folio,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          //-------------Toast
                        },
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                    ],
                  );
                },
              ),
 */
