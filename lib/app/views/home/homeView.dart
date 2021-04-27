import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:towards_life/app/controllers/controllers.dart';

import 'widgets/customCard.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 17.0, vertical: 5),
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
            const Expanded(
              flex: 3,
              child: FlipList(),
            ),
            Expanded(
              flex: 3,
              child: Container(),
            )
          ],
        ),
      ),
    );
  }
}
