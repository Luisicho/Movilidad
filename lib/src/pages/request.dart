import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:movilidad/src/providers/ApiWeb_provider.dart';

Future<Album> fetchAlbum() async {
  final response = await http.get(
    Uri.parse('http://10.0.2.2:8000/api/resource/Levantamiento/3'),
    headers: {"Authorization": "token 70ff001acdb9f7c:210a5620fc253a0"},
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    //-------------Toast
    Fluttertoast.showToast(
        msg: response.body,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    //-------------Toast
    return Album.fromJson(jsonDecode(response.body)['data']);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final String folio;
  final String name;
  final String aseguradora;
  final String fechallegada;

  const Album({
    required this.folio,
    required this.name,
    required this.aseguradora,
    required this.fechallegada,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      name: json['name'],
      folio: json['tipo'],
      aseguradora: json['aseguradora'],
      fechallegada: json['fechallegada'],
    );
  }
}

class request extends StatefulWidget {
  const request({super.key});

  @override
  State<request> createState() => _requestState();
}

class _requestState extends State<request> {
  late Future<Album> futureAlbum;
/*
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
      ),
      body: Center(
        child: FutureBuilder(
          future: apiWebProvider.getAllLevantamiento(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: Text(snapshot.toString()),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

/* JUNK CODE 

FutureBuilder(
          future: apiWebProvider.getAllLevantamiento(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Widget> wd = List.generate(
                snapshot.data!.length,
                (index) => Text('My title is $index ' + snapshot.data![index]['name']),
              );

              return Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: wd,
                    ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),

*/

