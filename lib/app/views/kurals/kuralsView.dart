import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/thirukuralController.dart';
import '../../data/model/models.dart';
import '../../widgets/widgets.dart';

class KuralsView extends GetView<NoNameController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEdgeDragWidth: context.widthTransformer(reducedBy: 70),
      // appBar: AppBar(),
      endDrawer: const CustomDrawer(),

      body: Obx(
        () {
          if (controller.contentList.isEmpty && controller.isLoading.isTrue) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: controller.contentList.length,
                  controller: controller.scrollController,
                  itemBuilder: (_, int index) {
                    final Kural kural = controller.contentList[index] as Kural;
                    return SizedBox(
                      height: 300,
                      child: Center(
                        child: Text('KuralsView ${kural.number}'),
                      ),
                    );
                  },
                ),
              ),
              if (controller.isLoading.isTrue)
                const Center(
                  child: CircularProgressIndicator(),
                )
              else
                const SizedBox.shrink()
            ],
          );
        },
      ),
    );
  }
}
