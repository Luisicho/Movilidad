import 'package:flutter/material.dart';
import 'package:movilidad/home_screens/home_screen1.dart';
import 'package:movilidad/home_screens/home_screen2.dart';
import 'package:movilidad/home_screens/home_screen3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // form key
  final _formKey = GlobalKey<FormState>();

  //PagueController
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              //Screens from page
              HomeScreen1(),
              HomeScreen2(),
              HomeScreen3(),
            ],
          ),
          Container(
            alignment: Alignment(0,0.75),
            child: 
            //dot indicator
            SmoothPageIndicator(
              controller: _pageController,
              count: 3,
            ),
          )
        ]
      ),
    );
  }
}
