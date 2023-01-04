import 'package:flutter/material.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({Key? key}) : super(key: key);

  @override
  _HomeScreen1State createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 78, 0, 92),
          image: DecorationImage(
              image: AssetImage(
                "assets/fondoMovilidad.png",
              ),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
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
                          "assets/mapicon.png",
                        ),
                        height: 400,
                        width: 400,
                        fit: BoxFit.contain),
                    const Text(
                      'Maps & GO',
                      style: TextStyle(fontSize: 32, color: Colors.white),
                    ),
                  ],
                ),
              ),
            )
          )
        );
  }

  void goToMain() {
    //Inicia la pantalla MapMain
    Navigator.pushNamed(context, 'map_main');
  }
}
