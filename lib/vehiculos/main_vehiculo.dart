import 'package:flutter/material.dart';

class MainVehiculo extends StatefulWidget {
  const MainVehiculo({super.key});

  @override
  State<MainVehiculo> createState() => _MainVehiculoState();
}

class _MainVehiculoState extends State<MainVehiculo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista Vehiculos'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Codigo Lev.',
                contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.blue)
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

