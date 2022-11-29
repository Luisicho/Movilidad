import 'package:flutter/material.dart';

import '../../levantamiento/model/levantamiento.dart';

class LevantamientoView extends StatefulWidget {
  //Caracteristicas
  Levantamiento levantamiento = Levantamiento();
  //Constructores
  LevantamientoView({super.key});
  LevantamientoView._init(this.levantamiento);
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
            title: Text('Folio '),
          ),
          body: ListView(
            padding: const EdgeInsets.all(10),
            children: <Widget>[
              _cardTipo1(),
            ],
          ),
        ));
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          const ListTile(
            leading: Icon(Icons.accessible_outlined, color: Colors.blue,),
            title: Text('Luis Miguel Hernandez Macias'),
            subtitle: Text('Usuario se estrello contra una bicicleta y ahora esta gravemente herido'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: Text('Cancelar'),
                onPressed: () {
                },
              ),
              TextButton(
                child: Text('Ok'),
                onPressed: () {
                },
              ),
            ],
          ),
        ]
      ),
    );
  }
}
