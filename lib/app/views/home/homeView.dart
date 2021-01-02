import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/controllers.dart';
import '../../globalWidgets/widgets.dart';
import '../../translation/languages.dart';
import 'widgets/widgets.dart';

class HomeView extends GetView<HomeController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('greeting'.tr),
          actions: [
            DropdownButton<String>(
              hint: const Text('Please choose a location'),
              onChanged: (symbol) {
                controller.changeLanguage = symbol;
              },
              items: languages.map(
                (LanguageModel _language) {
                  print(_language.symbol);
                  return DropdownMenuItem<String>(
                    value: _language.symbol,
                    child: Text(_language.language),
                  );
                },
              ).toList(),
            )
          ],
        ),
        drawerEdgeDragWidth: context.widthTransformer(reducedBy: 85),
        key: _scaffoldKey,
        endDrawer: const CustomDrawer(),
        // floatingActionButton: const CustomFloatingActionButton(),
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
                  const Expanded(
                    flex: 3,
                    child: FlipList(),
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
                  child: OutlineButton(
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
