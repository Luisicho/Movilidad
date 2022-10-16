import 'package:flutter/material.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({Key? key}) : super(key: key);

  @override
  _HomeScreen2State createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/fondo2.png",
            ),
            fit: BoxFit.fill
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.black26,
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Ink.image(
                          image: const AssetImage(
                            "assets/BusIcon.png",
                          ),
                          height: 400,
                          width: 400,
                          fit: BoxFit.contain
                        ),
                        const Text(
                          'Vehiculos',
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.white
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            )
        )
    );
  }
}
