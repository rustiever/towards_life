import 'package:TowardsLife/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Topic topic;
  const CustomCard({
    Key key,
    @required this.topic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Card(
        borderOnForeground: false,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.elliptical(25, 50),
          ),
        ),
        elevation: 2.5,
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
                  // fit: BoxFit.fitWidth,
                  child: Text(topic.name),
                ),
              ),
            ),
            FittedBox(
              // fit: BoxFit.fitWidth,
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
