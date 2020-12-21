import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/controllers.dart';

class AdminView extends GetView<AdminController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          color: Colors.blue,
          onPressed: () {
            controller.setAll();
          },
          splashColor: Colors.blueGrey,
          child: const Text(
            'Upload',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
