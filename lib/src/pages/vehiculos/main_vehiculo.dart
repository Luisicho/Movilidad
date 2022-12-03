import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:movilidad/src/pages/vehiculos/view/levantamiento_view.dart';
import 'package:movilidad/src/providers/db_provider.dart';
import 'package:movilidad/src/providers/vehiculo_provider.dart';
import 'package:movilidad/src/utils/icono_string_util.dart';
import '../levantamiento/model/levantamiento_model.dart';

class MainVehiculo extends StatefulWidget {
  const MainVehiculo({super.key});

  @override
  State<MainVehiculo> createState() => _MainVehiculoState();
}

class _MainVehiculoState extends State<MainVehiculo> {
  //--------Variables Locales
  final TextEditingController searchController = TextEditingController();
  String valueABuscar = "";
  //Se carga la lista de todos los levantamientos
  List<LevantamientoModel> levantamientos = listEjemploLevantamiento;

  @override
  Widget build(BuildContext context) {
    //-----Variables
    //Base de datos
    DBProvider.db.database;

    //-----------------Funciones
    void searchLevantamiento(String value) {
      //Actualiza lista de pantalla
      setState(() => valueABuscar = value);
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
    //  widgets que luego se muestran en lista filtrandola para la
    //  busqueda en el txt
    data!.where((element) {
      final folio = element['folio'];
      final input = valueABuscar;

      return folio.contains(input);
    }).forEach((element) {
      final widgetTemp = ListTile(
        title: Text(element['folio']),
        subtitle: Text(element['descripcion']),
        leading: getIcon(element['icon']),
        trailing: const Icon(Icons.keyboard_arrow_right),
        onTap: () {
          //Funcion para entrar a la ventana levantamiento
          //Crea ruta estatica
          final route = MaterialPageRoute(builder: ((context) {
            //Se crea nueva vista y se pasa informacion
            LevantamientoView newView = LevantamientoView();
            newView.levantamiento.folio = element['folio'];
            return newView;
          }));
          Navigator.push(context, route);
        },
      );

      //Agrega a arreglo opciones
      opciones
        ..add(widgetTemp)
        ..add(const Divider(
          thickness: 2,
        ));
    });

    return opciones;
  }

  //Crea lista segun el builder
  Widget _crearLista() {
    return ListView.builder(
        itemCount: levantamientos.length,
        itemBuilder: (context, index) {
          //variable que lee levantamiento a levantamiento
          final levantamiento = levantamientos[index];

          return Column(
            children: [
              ListTile(
                title: Text(levantamiento.folio),
                subtitle: Text(levantamiento.descripcion),
                leading: const Icon(Icons.car_crash),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  //Funcion para entrar a la ventana levantamiento
                  //Crea ruta estatica
                  final route = MaterialPageRoute(
                      builder: ((context) => LevantamientoView()));
                  Navigator.push(context, route);
                },
              ),
              const Divider(
                thickness: 2,
              ),
            ],
          );
        });
  }
}

//------------CODIGO DE REPUESTO
/*
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
 */
