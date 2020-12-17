import 'package:TowardsLife/app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ListTile(
            onLongPress: () => Get.toNamed(AppPages.adminRoute),
            title: const Text('Admin'),
          ),
          const AboutListTile()
        ],
      ),
    );
  }
}
