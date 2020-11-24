import 'package:flutter/material.dart';

import '../constants/constants.dart' show Topic;

class CustomCard extends StatelessWidget {
  final Topic topic;
  const CustomCard({
    Key key,
    @required this.topic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Card(
        borderOnForeground: false,
        margin: const EdgeInsets.symmetric(
          horizontal: 4,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            // Radius.elliptical(25, 50),
            Radius.circular(30),
          ),
        ),
        elevation: 5.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  topic.asset,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(
                  child: Text(topic.name),
                ),
              ),
            ),
            FittedBox(
              child: Text(
                topic.length.toString(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
