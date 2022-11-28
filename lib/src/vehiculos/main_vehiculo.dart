import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
                child: ListView.builder(
                itemCount: levantamientos.length,
                itemBuilder: (context, index) {
                  //Carga la lista en un ListViewBuilder
                  final levantamiento = levantamientos[index];

                  return ListTile(
                    leading: Text(levantamiento.Folio),
                    title: Text(levantamiento.Descripcion),
                    onTap: () {
                      //Funcion para abrir el levantamiento con su informacion
                      //-------------Toast
                      Fluttertoast.showToast(
                      msg: 'Enviando a la nube',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                     //-------------Toast
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
