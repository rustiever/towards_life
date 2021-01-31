import 'package:TowardsLife/app/controllers/controllers.dart';
import 'package:TowardsLife/app/routes.dart';
import 'package:TowardsLife/app/translation/languages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsView extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ExpansionTile(
              leading: const CircleAvatar(
                child: Icon(Icons.app_settings_alt_sharp),
              ),
              title: const Text('Appearence'),
              children: [
                Text('greeting'.tr),
                ListTile(
                  title: const Text('Language'),
                  trailing: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed: () async {
                      final val = await Get.toNamed(AppPages.languageListRoute);
                      controller.selLanguage = val as String;

                      print('here');
                      print(val);
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Dark Mode'),
                  trailing: Switch.adaptive(
                    value: true,
                    onChanged: (bool value) {},
                  ),
                )
              ],
            ),
            ExpansionTile(
              leading: const CircleAvatar(
                child: Icon(Icons.network_cell),
              ),
              title: const Text('NetWork & Local'),
              children: [
                ListTile(
                  trailing: Switch.adaptive(
                    value: true,
                    onChanged: (bool value) {},
                  ),
                )
              ],
            ),
            ExpansionTile(
              leading: const CircleAvatar(
                child: Icon(Icons.info_sharp),
              ),
              title: const Text('About'),
              children: [
                ListTile(
                  trailing: Switch.adaptive(
                    value: true,
                    onChanged: (bool value) {},
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
