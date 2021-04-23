import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:towards_life/app/translation/languages.dart';

class LanguageListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      body: ListView(
        children: languages.map(
          (LanguageModel _language) {
            print(_language.symbol);
            return InkWell(
              onTap: () {
                // controller.selLanguage = _language.symbol;
                Get.back(result: _language.symbol);
              },
              child: Text(_language.language),
            );
          },
        ).toList(),
      ),
    );
  }
}
