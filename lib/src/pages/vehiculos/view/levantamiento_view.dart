import 'package:flutter/material.dart';
import 'package:movilidad/src/providers/levantamiento_provider.dart';

import '../../../utils/icono_string_util.dart';
import '../../levantamiento/model/levantamiento.dart';

class LevantamientoView extends StatefulWidget {
  //Caracteristicas
  Levantamiento levantamiento = Levantamiento();
  //Constructores
  LevantamientoView({super.key});
  @override
  State<LevantamientoView> createState() => LevantamientoViewState();
}

class LevantamientoViewState extends State<LevantamientoView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Folio ${widget.levantamiento.Folio}'),
        ),
        body: _lista(),
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
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
              child: Text('Cancelar'),
              onPressed: () {},
            ),
            TextButton(
              child: Text('Ok'),
              onPressed: () {},
            ),
          ],
        ),
      ]),
    );
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

  //Funcion que agrega elementos a la lista nueva
  List<Widget> _listaItems(List<dynamic>? data, BuildContext context) {
    final List<Widget> opciones = [];

    //Lee toda la informacion del JSON y la agrega a una lista de
    //  widgets que luego se muestran en lista filtrandola para la
    //  busqueda en el txt
    data!.where((element) {
      final folio = element['folio'];
      final input = widget.levantamiento.Folio;

      return folio.contains(input);
    }).forEach((element) {
      //Crea card por cada elemento
      final widgetTemp = Card(
        elevation: 10.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Column(children: <Widget>[
          ListTile(
            title: Text(element['folio']),
            subtitle: Text(element['descripcion']),
            leading: getIcon('accessible_outlined'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('Mas Informacion'),
                onPressed: () {},
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
}
