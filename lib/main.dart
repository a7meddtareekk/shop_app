import 'package:flutter/material.dart';
import 'package:shop_app/Modules/Login/LoginScreen.dart';

import 'Modules/OnBoarding/OnBoarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,

        primarySwatch: Colors.deepOrange
      ),
      routes: {
          LoginScreen.ROUTE_NAME: (context) => LoginScreen(),
          OnBoarding.ROUTE_NAME: (context) => OnBoarding(),
        },
       home: OnBoarding(),

    );
  }
}

