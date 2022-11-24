import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movilidad/levantamiento/first_step.dart';
import 'package:movilidad/levantamiento/second_step.dart';

class levMain extends StatefulWidget {
  const levMain({super.key});

  @override
  State<levMain> createState() => _levMainState();
}

class _levMainState extends State<levMain> {
  //-----------Inicio de variables y controladores------------------
  int currStep = 0;

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
            content: const firstStep(),
          ),
          Step(
            state: currStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currStep >= 1,
            title: const Text('Afectados'),
            content: const secondStep(),
          ),
          Step(
            state: currStep > 2 ? StepState.complete : StepState.indexed,
            isActive: currStep >= 2,
            title: const Text('Completado'),
            content: SizedBox(
              height: 500,
              child: TextButton(
                onPressed: () {
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
