import 'package:flutter/material.dart';
import 'package:movilidad/levantamiento/views/afectado_view.dart';

class secondStep extends StatefulWidget {
  const secondStep({super.key});

  @override
  State<secondStep> createState() => _secondStepState();
}

class _secondStepState extends State<secondStep> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.75,
        child: afectadoView(),
      ),
    );
  }
}
