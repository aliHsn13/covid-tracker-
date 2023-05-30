import 'package:flutter/material.dart';

class WorldWidePanel extends StatelessWidget {
  final Map worldData;

  const WorldWidePanel({super.key, required this.worldData});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2,
        ),
        children: <Widget>[
          StatusPanel(
            title: "CONFIRMED",
            panelColor: (Colors.red[100])!,
            textColor: Colors.red,
            count: worldData["cases"].toString(),
          ),
          StatusPanel(
            title: "ACTIVE",
            panelColor: (Colors.blue[100])!,
            textColor: (Colors.blue[900])!,
            count: worldData["active"].toString(),
          ),
          StatusPanel(
            title: "RECOVERD",
            panelColor: (Colors.green[100])!,
            textColor: Colors.green,
            count: worldData["recovered"].toString(),
          ),
          StatusPanel(
            title: "DEATH",
            panelColor: (Colors.grey[400])!,
            textColor: (Colors.grey[900])!,
            count: worldData["deaths"].toString(),
          ),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;
  const StatusPanel(
      {super.key,
      required this.panelColor,
      required this.textColor,
      required this.title,
      required this.count});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.all(10.0),
      height: 80,
      color: panelColor,
      width: width / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(title,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16, color: textColor)),
          Text(count,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16, color: textColor))
        ],
      ),
    );
  }
}
