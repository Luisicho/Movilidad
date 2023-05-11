import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movilidad/src/model/afectado_model.dart';
import 'package:movilidad/src/model/levantamiento_model.dart';
import 'package:movilidad/src/model/vehiculos_model.dart';

import 'package:movilidad/src/pages/levantamiento/first_step.dart';
import 'package:movilidad/src/pages/levantamiento/second_step.dart';
import 'package:movilidad/src/pages/levantamiento/third_step.dart';
import 'package:movilidad/src/providers/ApiWeb_provider.dart';
import 'package:movilidad/src/utils/colors_util.dart';
import 'package:quickalert/quickalert.dart';

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
  thirdStep tercerPaso = thirdStep();

  //-----Iniciar la ventana
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------Funciones-------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------

    void agregarLevantamientoNube(LevantamientoModel levantamiento,
        List<VehiculoModel> vehiculo, List<AfectadoModel> afectado) async {
      //Se agrega aseguradora y vigencia a la lista de afetados
      afectado.forEach((element) {
        element.aseguradora = levantamiento.aseguradora;
        element.vigencia = levantamiento.vigenciaAsc;
      });
      //Peticion de agregar Levantamiento, vehiculo y afectado a API
      //var resul = await apiWebProvider.postAfectado(afectado);
      var resul2 = await apiWebProvider.postVehiculo(vehiculo);
      // var result3 =
      //     await apiWebProvider.postLevantamiento(levantamiento, resul, resul2);
      // resul.isEmpty || resul2.isEmpty || result3.isEmpty
      if (resul2.isEmpty) {
        //-------------Toast
        Fluttertoast.showToast(
          msg: 'Error al enviar',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
        //-------------Toast
      }else{
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
      }
    }

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
            title: const Text('Vehiculos'),
            content: segundoPaso,
          ),
          Step(
            state: currStep > 2 ? StepState.complete : StepState.indexed,
            isActive: currStep >= 2,
            title: const Text('Afectados'),
            content: tercerPaso,
          ),
          Step(
            state: currStep > 3 ? StepState.complete : StepState.indexed,
            isActive: currStep >= 3,
            title: const Text('Completado'),
            content: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/Secretaria-de-Movilidad-01.png",
                    ),
                    fit: BoxFit.fitWidth),
              ),
              child: SizedBox(
                height: 500,
                child: TextButton(
                  onPressed: () {
                    var tempLevfirts = primerPaso.levantamiento;
                    var error = '';
                    var firtStep = true;
                    var thirStep = true;
                    /*if (tempLevfirts.horaAccidente.isEmpty) {
                      QuickAlert.show(
                        context: context,
                        barrierDismissible: true,
                        title: 'Atencion',
                        text: 'Agrege informacion al Levantamiento',
                        type: QuickAlertType.error,
                        confirmBtnText: 'Confirmar',
                      );
                      return;
                    }
                    if (tempLevfirts.horaAccidente.isEmpty) {
                      error += ' Hora accidente faltante \n';
                      firtStep = false;
                    }
                    if (tempLevfirts.concesionario.isEmpty) {
                      error += ' Concesionario faltante \n';
                      firtStep = false;
                    }
                    if (tempLevfirts.vigencia.isEmpty) {
                      error += ' Chofer faltante \n';
                      firtStep = false;
                    }
                    var fotos = 0;
                    for (var element in tempLevfirts.fotosLev) {
                      if (element.path != '') fotos++;
                    }
                    if (fotos < 3) {
                      error += ' Minimo 3 fotos faltante \n';
                      firtStep = false;
                    }*/

                    if (thirStep && firtStep) {
                      agregarLevantamientoNube(tempLevfirts,
                          segundoPaso.vehiculos, tercerPaso.afectados);
                      
                      //Navigator.of(context).pop();
                    } else {
                      //------------------------------QuickAlert
                      QuickAlert.show(
                        context: context,
                        barrierDismissible: true,
                        title: 'Atencion',
                        text: error,
                        type: QuickAlertType.warning,
                        confirmBtnText: 'Confirmar',
                      );
                      //------------------------------QuickAlert
                    }
                  },
                  child: const Text(
                    'Guardar Datos de Accidente',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ),
          ),
        ];
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------Funciones-------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------

    //----return
    return WillPopScope(
      onWillPop: () async {
        return await QuickAlert.show(
          context: context,
          type: QuickAlertType.confirm,
          title: '¿Quieres salir?',
          text: 'No se guardara nada de la informacion ya capturada',
          confirmBtnText: 'Si',
          cancelBtnText: 'No',
          confirmBtnColor: Colors.green,
          onConfirmBtnTap: () {
            Navigator.pop(context, true);
          },
          onCancelBtnTap: () {
            Navigator.pop(context, false);
          },
        );
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
                    if (!(currStep == 3)) {
                      setState(() {
                        currStep++;
                      });
                    }
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(MORADO),
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
                    style: TextStyle(color: MORADO),
                  ),
                ),
              ],
            );
          },
          currentStep: currStep,
          onStepContinue: () {
            if (!(currStep == 3)) {
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
