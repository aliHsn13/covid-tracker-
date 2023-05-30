// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MostAffectedPanel extends StatelessWidget {
  final List countryData;

  const MostAffectedPanel({super.key, required this.countryData});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Row(
              children: <Widget>[
                Image.network(
                  countryData[index]["countryInfo"]["flag"],
                  height: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(countryData[index]["country"],
                    style: (const TextStyle(fontWeight: FontWeight.bold))),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Deaths${countryData[index]["deaths"]}",
                  style: (const TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold)),
                )
              ],
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
