import 'package:TowardsLife/constants/constants.dart';
import 'package:TowardsLife/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Towards Life'),
      ),
      drawer: Drawer(
        child: Column(),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(
                        25.0,
                        20.0,
                        25.0,
                        15.0,
                      ),
                      child: Center(
                        child: Text(
                          'Choose Your Favorite Topic To Read',
                          style: TextStyle(
                            fontSize: 25,
                            // color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: topicList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, int index) => CustomCard(
                          topic: topicList[index],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  color: Colors.pinkAccent,
                ),
              ),
            ],
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            minChildSize: 0.15,
            maxChildSize: 0.8,
            builder: (BuildContext context, myscrollController) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.tealAccent[200],
                  child: ListView.builder(
                    controller: myscrollController,
                    itemCount: 25,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(
                          'Dish $index',
                          style: const TextStyle(color: Colors.black54),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
