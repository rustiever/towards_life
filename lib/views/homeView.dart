import 'package:TowardsLife/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            child: Text('Athichoodi'),
          ),
          InkWell(
            onTap: () async {
              Get.toNamed(Thirukkuralroute);
            },
            child: Container(
              height: 100,
              child: Card(
                child: Text('kurals'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
