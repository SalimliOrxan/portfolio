import 'package:flutter/material.dart';
import 'package:portfolio/productPage.dart';

import 'homePage.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        "/": (_) => HomePage(),
        "product": (_) => ProductPage()
      }
    );
  }
}