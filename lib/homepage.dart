import 'package:covid_tracker/panels/worldwidepanels.dart';
import 'package:flutter/material.dart';
import 'package:covid_tracker/consts/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("COVID-19 TRACKER APP"),
        backgroundColor: primaryBlack,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(15),
            alignment: Alignment.center,
            height: 100,
            color: Colors.orange[100],
            child: Text(
              ConstDatas.quote,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[800]),
            ),
          ),
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Text(
                "Worldwide",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              )),
          WorldWidePanel(),
        ],
      )),
    );
  }
}
