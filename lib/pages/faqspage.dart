import 'package:covid_tracker/consts/constants.dart';
import 'package:flutter/material.dart';

class FAQpage extends StatelessWidget {
  const FAQpage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("FQAs"),
        ),
        body: ListView.builder(
          itemCount: ConstDatas.questionAnswers.length,
          itemBuilder: (context, index) {
            return ExpansionTile(
              title: Text(ConstDatas.questionAnswers[index]['question']),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(ConstDatas.questionAnswers[index]['answer']),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
