import 'dart:ui';
import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../widgets/widgets.dart';

class HomeView extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void _openEndDrawer() {
    _scaffoldKey.currentState.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: _openEndDrawer,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text('Explore'),
        ),
        endDrawer: Drawer(
          child: Column(),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 17.0, vertical: 5),
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Column(
                          children: const [
                            Text(
                              'Choose Your Favorite ',
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                  // fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black45),
                            ),
                            Text(
                              'From Our Library ',
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                  // fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black45),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
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
              flex: 2,
              child: Container(
                color: Colors.pinkAccent,
              ),
            ),
            Expanded(
              // flex: 3,
              child: Container(
                color: Colors.deepOrange,
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.greenAccent,
                  height: 40,
                  width: double.infinity,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
