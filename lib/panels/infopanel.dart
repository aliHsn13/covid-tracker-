import 'package:covid_tracker/consts/constants.dart';
import 'package:covid_tracker/pages/countrypage.dart';
import 'package:covid_tracker/pages/faqspage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPanel extends StatelessWidget {
  const InfoPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CountryPage()));
            },
            child: Container(
                color: primaryBlack,
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 10.0),
                margin:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text(
                      "FQAs",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    )
                  ],
                )),
          ),
          GestureDetector(
            onTap: () {
              launchUrl(Uri.parse('https://covid19responsefund.org'));
            },
            child: Container(
              color: primaryBlack,
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
              margin:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text(
                    "DONATES",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              launchUrl(Uri.parse(
                  'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters'));
            },
            child: Container(
              color: primaryBlack,
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
              margin:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text(
                    "MYTH BUSTERS",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
