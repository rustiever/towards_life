import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/controllers.dart';

class AdminView extends GetView<AdminController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: const ButtonStyle(),
          // splashColor: Colors.blueGrey,
          onPressed: () {
            controller.setAll();
          },
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
