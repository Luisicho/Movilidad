import 'package:flutter/material.dart';

import '../levantamiento/lev_main.dart';

class HomeScreen3 extends StatefulWidget {
  const HomeScreen3({Key? key}) : super(key: key);

  @override
  _HomeScreen3State createState() => _HomeScreen3State();
}

class _HomeScreen3State extends State<HomeScreen3> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 155, 115, 40),
          image: DecorationImage(
              image: AssetImage(
                "assets/fondo3.png",
              ),
              fit: BoxFit.fill),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.black26,
                  onTap: () {
                    goToMain();
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Ink.image(
                          image: const AssetImage(
                            "assets/levantamientoIcon.png",
                          ),
                          height: 400,
                          width: 400,
                          fit: BoxFit.contain),
                      const Text(
                        'Levantamientos',
                        style: TextStyle(fontSize: 32, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            )
          )
        );
  }

  void goToMain() {
    //Inicia la pantalla MapVehiculo
    Navigator.pushNamed(context, 'lev_main');
  }
}
