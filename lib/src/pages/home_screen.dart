import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
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
        return await QuickAlert.show(
          context: context,
          type: QuickAlertType.confirm,
          title: '¿Quieres regresar al inicio de secion?',
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
        body: Stack(children: [
          PageView(
            controller: _pageController,
            children: const [
              //Screens from page
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
              count: 2,
            ),
          )
        ]),
      ),
    );
  }
}
