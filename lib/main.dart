import 'package:flutter/material.dart';

import 'Screens/Home_Screen.dart';
import 'Services/Route_gen.dart';


void main() {


  runApp(  MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/home', //temporarly make this the first page

    //onGenerateRoute: RouteGenerator.generateRoute,


    routes: {
      //placeholder name then name of the class
      //'/': (context) => const Loading(),
      '/home': (context) =>  HomePage(),

      //'/bypassed': (context) =>  WebPageViewer(url: 'null'.toString(),),
      //'/bypassed': (context) =>  WebPageViewer(url: 'https://www.irishtimes.com/opinion/2023/03/07/eviction-ban-removal-will-hit-those-on-cusp-of-homelessness-and-may-prove-unforgivable/'.toString()),
    },




  ));
}