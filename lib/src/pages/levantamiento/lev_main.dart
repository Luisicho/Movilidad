import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:movilidad/src/pages/levantamiento/first_step.dart';
import 'package:movilidad/src/pages/levantamiento/second_step.dart';

class levMain extends StatefulWidget {
  const levMain({super.key});

  @override
  State<levMain> createState() => _levMainState();
}

class _levMainState extends State<levMain> {
  //-----------Inicio de variables y controladores------------------
  int currStep = 0;
  firstStep primerPaso = firstStep();
  secondStep segundoPaso = secondStep();

  //-----Iniciar la ventana
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //------------------Functions-----------------
    List<Step> getSteps() => [
          Step(
            state: currStep > 0 ? StepState.complete : StepState.indexed,
            isActive: currStep >= 0,
            title: const Text('Accidende'),
            content: primerPaso,
          ),
          Step(
            state: currStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currStep >= 1,
            title: const Text('Afectados'),
            content: segundoPaso,
          ),
          Step(
            state: currStep > 2 ? StepState.complete : StepState.indexed,
            isActive: currStep >= 2,
            title: const Text('Completado'),
            content: SizedBox(
              height: 500,
              child: TextButton(
                onPressed: () {
                  var tempfirts = primerPaso.levantamiento;
                  var error = '';
                  var firtStep = true;
                  var secStep = true;
                  if (tempfirts.horaAccidente.isEmpty) {
                    error += ' Hora accidente faltante \n';
                    firtStep = false;
                  }
                  if (tempfirts.descripcion.isEmpty) {
                    error += ' concesionario faltante \n';
                    firtStep = false;
                  }
                  if (tempfirts.tipo.isEmpty) {
                    error += ' chofer faltante \n';
                    firtStep = false;
                  }
                  var fotos = 0;
                  tempfirts.fotosLev.forEach((element) {
                    if (element.path != '') fotos++;
                  });
                  if (fotos < 3) {
                    error += ' minimo 3 fotos faltante \n';
                    firtStep = false;
                  }

                  if (segundoPaso.afectados.isEmpty) {
                    error += ' Agrege minimo 1 afectado \n';
                    secStep = false;
                  }

                  if (secStep && firtStep) {
                    //-------------Toast
                    Fluttertoast.showToast(
                        msg: 'Enviando a la nube',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    //-------------Toast
                  } else {
                    //-------------Toast
                    Fluttertoast.showToast(
                        msg: error,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    //-------------Toast
                  }
                },
                child: const Text('Guardar Datos de Accidente'),
              ),
            ),
          ),
        ];
    //------------------Functions-----------------

    //----return
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return false;
      },
      child: Scaffold(
        body: Stepper(
          type: StepperType.horizontal,
          steps: getSteps(),
          //Builder para personalizar los botones continue,cancel
          controlsBuilder: (context, _) {
            return Row(
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    //onStepContinue(),
                    if (!(currStep == 2)) {
                      setState(() {
                        currStep++;
                      });
                    }
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  ),
                  child: const Text(
                    'Continuar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  //onStepCancel()
                  onPressed: currStep == 0
                      ? null
                      : () => setState(() {
                            currStep--;
                          }),
                  style: const ButtonStyle(),
                  child: const Text(
                    'Regresar',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            );
          },
          currentStep: currStep,
          onStepContinue: () {
            if (!(currStep == 2)) {
              setState(() {
                currStep++;
              });
            }
          },
          onStepCancel: currStep == 0
              ? null
              : () => setState(() {
                    currStep--;
                  }),
        ),
      ),
    );
  } //widget
}
