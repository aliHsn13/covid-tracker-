import 'dart:convert';

import 'package:covid_tracker/pages/countrypage.dart';
import 'package:covid_tracker/pages/faqspage.dart';
import 'package:covid_tracker/panels/infopanel.dart';
import 'package:covid_tracker/panels/mostAffected.dart';
import 'package:covid_tracker/panels/worldwidepanels.dart';
import 'package:flutter/material.dart';
import 'package:covid_tracker/consts/constants.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map worldData = {};

  fetchWorldwideData() async {
    http.Response response =
        await http.get(Uri.parse('https://disease.sh/v3/covid-19/all'));

    setState(() {
      worldData = json.decode(response.body);
    });
  }

  List countryData = [];
  fetchCountryData() async {
    http.Response response =
        await http.get(Uri.parse('https://disease.sh/v3/covid-19/countries'));

    setState(() {
      countryData = json.decode(response.body);
    });
  }

  Future fetchData() async {
    fetchWorldwideData();
    fetchCountryData();
    print('fetchData called');
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        "Worldwide",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: primaryBlack,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          "Regional",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  )),
              WorldWidePanel(
                worldData: worldData,
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "Most Affected Countries",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              MostAffectedPanel(
                countryData: countryData,
              ),
              const SizedBox(
                height: 15,
              ),
              const InfoPanel()
            ],
          ),
        ),
      ),
    );
  }
}
