import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:movilidad/src/pages/home_screens/home_screen1.dart';
import 'package:movilidad/src/pages/home_screens/home_screen2.dart';
import 'package:movilidad/src/pages/home_screens/home_screen3.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // form key
  final _formKey = GlobalKey<FormState>();

  //PagueController
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('¿Quieres regresar al inicio de secion?'),
              actionsAlignment: MainAxisAlignment.spaceBetween,
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text('Si'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text('No'),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: Scaffold(
        body: Stack(children: [
          PageView(
            controller: _pageController,
            children: const [
              //Screens from page
              HomeScreen1(),
              HomeScreen2(),
              HomeScreen3(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.75),
            child:
                //dot indicator
                SmoothPageIndicator(
              controller: _pageController,
              count: 3,
            ),
          )
        ]),
      ),
    );
  }
}
