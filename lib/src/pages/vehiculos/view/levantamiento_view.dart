import 'dart:io';
import 'package:flutter/material.dart';
import 'package:movilidad/src/pages/vehiculos/view/afectadoV_view.dart';

import 'package:movilidad/src/providers/levantamiento_provider.dart';
import '../../../utils/icono_string_util.dart';
import '../../../model/levantamiento_model.dart';

class LevantamientoView extends StatefulWidget {
  //Caracteristicas
  LevantamientoModel levantamiento = LevantamientoModel(
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
  //Constructores
  LevantamientoView({super.key});
  @override
  State<LevantamientoView> createState() => LevantamientoViewState();
}

class LevantamientoViewState extends State<LevantamientoView> {
  @override
  Widget build(BuildContext context) {
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------Funciones-------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------

    Widget _cardTipo1() {
      return Card(
        elevation: 10.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Column(children: <Widget>[
          const ListTile(
            leading: Icon(
              Icons.accessible_outlined,
              color: Colors.blue,
            ),
            title: Text('Title'),
            subtitle: Text('Subtitle'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('Cancelar'),
                onPressed: () {},
              ),
              TextButton(
                child: const Text('Ok'),
                onPressed: () {},
              ),
            ],
          ),
        ]),
      );
    }

    //Funcion que muestra ventada de accidentado
    void mostrarVentanaAccidentado(BuildContext context, String nombre) {
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) {
            return AlertDialog(
              content: Container(
                padding: const EdgeInsets.all(0),
                height: 1000,
                width: MediaQuery.of(context).size.width,
                child: accidentadoVView(nombre),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            );
          });
    } //widget

    //Funcion que agrega elementos a la lista nueva
    List<Widget> _listaItems(List<dynamic>? data, BuildContext context) {
      final List<Widget> opciones = [];

      //Lee toda la informacion del JSON y la agrega a una lista de
      //  widgets que luego se muestran en lista filtrandola para la
      //  busqueda en el txt
      data!.where((element) {
        final folio = element['folio'];
        final input = widget.levantamiento.folio;

        return folio.contains(input);
      }).forEach((element) {
        //Crea card por cada elemento
        final widgetTemp = Card(
          elevation: 10.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Column(children: <Widget>[
            ListTile(
              title: Text(element['nombreAc'],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(element['curp'],
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              leading: getIcon(element['icon'], 34),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('Mas Informacion',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {
                    mostrarVentanaAccidentado(context, element['curp']);
                  },
                ),
                const SizedBox(height: 15),
              ],
            ),
          ]),
        );

        //Agrega a arreglo opciones
        opciones.add(widgetTemp);
      });

      return opciones;
    }

    //Funcion que crea lista nueva
    Widget _lista() {
      //Widget Future para crear lista a futuro luego de resivir la informacion
      return FutureBuilder(
        future: levantamientoProvider.cargarData(),
        initialData: [],
        builder: (context, snapshot) {
          return ListView(
            padding: const EdgeInsets.all(10),
            children: _listaItems(snapshot.data, context),
          );
        },
      );
    }

    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------Funciones-------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------

    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Folio ${widget.levantamiento.folio}'),
        ),
        body: _lista(),
      ),
    );
  }
}
