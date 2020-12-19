import 'package:flutter/material.dart';
import 'package:TowardsLife/app/data/model/models.dart';
import 'package:get/get.dart';

class CustomCard extends StatelessWidget {
  final Topic topic;
  const CustomCard({
    Key key,
    @required this.topic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(topic.name),
      child: SizedBox(
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
                    child: Text(
                      topic.name.substring(1),
                    ),
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
      ),
    );
  }
}
