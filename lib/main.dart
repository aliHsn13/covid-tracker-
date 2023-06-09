import 'package:covid_tracker/consts/constants.dart';
import 'package:covid_tracker/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: "Circular",
      primaryColor: primaryBlack,
    ),
    home: const HomePage(),
  ));
}
