import 'package:flutter/material.dart';

//RootWidget, creating a blank app for google materials design features
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Movilidad APP'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Hellow ninjas',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: Colors.grey,
            fontFamily: 'Roboto-Regular',
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('click'),
        backgroundColor: Colors.red[600],),
    ),
  ));
}
