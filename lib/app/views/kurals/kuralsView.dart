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
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  controller: controller.scrollController,
                  itemCount: controller.contentList.length,
                  itemBuilder: (_, int index) {
                    final Kural kural = controller.contentList[index] as Kural;
                    // final KuralDetail vv = HomeController.to.kuralDetail;

                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: BorderSide(
                          width: 2,
                          color: Colors.cyan.withOpacity(0.8),
                          // style: BorderStyle.solid,
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                            child: ListView(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10),
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                InkWell(
                                  onTap: () => controller.scrollController
                                      .jumpTo(controller.scrollController
                                          .position.minScrollExtent),
                                  child: Text(
                                    // kural.kurals[index].chapter,
                                    kural.toString(),
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.purple),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                  child: VerticalDivider(
                                    color: Colors.redAccent[400],
                                    // thickness: 2,
                                  ),
                                ),
                                InkWell(
                                  onTap: () => controller.scrollController
                                      .jumpTo(controller.scrollController
                                          .position.minScrollExtent),
                                  child: Text(
                                    kural.toString(),
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.purple),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            height: 10,
                            color: Colors.orange,
                          ),
                          ListTile(
                            contentPadding: const EdgeInsets.only(
                              bottom: 20,
                              left: 15,
                            ),
                            title: Text(
                              kural.line1,
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.indigoAccent),
                            ),
                            subtitle: Text(
                              '${kural.line2} [${kural.number}]',
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.indigo),
                            ),
                          ),
                        ],
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
