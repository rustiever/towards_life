import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: const [
          DrawerHeader(
            margin: EdgeInsets.all(50),
            padding: EdgeInsets.all(100),
            decoration: BoxDecoration(
              color: Colors.indigoAccent,
            ),
            child: CircleAvatar(),
          ),
          _DrawerDivider(),
          _DrawerContent(
            title: 'Home',
            iconData: Icons.home_filled,
            route: AppPages.homeRoute,
          ),
          _DrawerDivider(),
          _DrawerContent(
            title: 'Search',
            iconData: Icons.search_sharp,
            route: AppPages.homeRoute,
          ),
          _DrawerContent(
            title: 'Saved',
            iconData: Icons.save_alt_sharp,
            route: AppPages.homeRoute,
          ),
          _DrawerContent(
            title: 'Contribute',
            iconData: Icons.healing_sharp,
            route: AppPages.homeRoute,
          ),
          _DrawerContent(
            title: 'Settings',
            iconData: Icons.settings_outlined,
            route: AppPages.settingsRoute,
          ),
          _DrawerContent(
            title: 'Admin',
            iconData: Icons.admin_panel_settings,
            route: AppPages.adminRoute,
          ),
          AboutListTile(
            applicationIcon: Icon(
              Icons.apps_sharp,
            ),
            icon: Icon(
              Icons.apps_sharp,
            ),
          )
        ],
      ),
    );
  }
}

class _DrawerDivider extends StatelessWidget {
  const _DrawerDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider();
  }
}

class _DrawerContent extends StatelessWidget {
  final String title, route;
  final IconData iconData;

  const _DrawerContent({
    Key key,
    @required this.title,
    @required this.iconData,
    @required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData),
      onTap: () => Get.offAndToNamed(route),
      title: Text(title),
    );
  }
}
