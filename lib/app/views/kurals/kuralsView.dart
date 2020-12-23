import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/widgets.dart';

class KuralsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEdgeDragWidth: context.widthTransformer(reducedBy: 70),
      // appBar: AppBar(),
      endDrawer: const CustomDrawer(),

      body: const Center(
        child: Text('KuralsView'),
      ),
    );
  }
}
