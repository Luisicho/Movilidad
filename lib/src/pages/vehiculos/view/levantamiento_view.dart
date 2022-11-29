import 'package:flutter/material.dart';

class LevantamientoView extends StatefulWidget {
  const LevantamientoView({super.key});

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
            title: Text('Folio'),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.back_hand_sharp),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        )
    );
  }
}
