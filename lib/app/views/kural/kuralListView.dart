import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/controllers.dart';
import '../../data/model/models.dart';
import '../../globalWidgets/widgets.dart';

class KuralsListView extends GetWidget<LibraryController> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  final KuralController kuralController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          drawerEdgeDragWidth: context.widthTransformer(reducedBy: 80),
          appBar: AppBar(
            bottom: const TabBar(
              indicatorWeight: 3.4,
              tabs: [
                Tab(
                  text: 'Iyals',
                ),
                Tab(
                  text: 'Muppals',
                ),
                Tab(
                  text: 'Adhikarams',
                ),
              ],
            ),
            title: const FittedBox(
              child: Text('திருக்குறள்'),
            ),
          ),
          endDrawer: const CustomDrawer(),
          body: TabBarView(
            children: [
              ListView.builder(
                  itemCount: kuralController.iyalList.length,
                  itemBuilder: (_, index) {
                    return Text(kuralController.iyalList[index].name);
                  }),
              ListView.builder(
                  itemCount: kuralController.kuralDetail.length,
                  itemBuilder: (_, index) {
                    return Text(kuralController.kuralDetail[index].name);
                  }),
              ListView.builder(
                  itemCount: kuralController.adhikaramList.length,
                  itemBuilder: (_, index) {
                    return Text(kuralController.adhikaramList[index].name);
                  }),

              // Obx(
              //   () {
              //     if (controller.contentList.isEmpty &&
              //         controller.isLoading.isTrue) {
              //       return const Center(
              //         child: CircularProgressIndicator(),
              //       );
              //     }
              //     return Column(
              //       children: [
              //         Expanded(
              //           child: Scrollbar(
              //             radius: const Radius.circular(30),
              //             thickness: 30,
              //             controller: controller.scrollController,
              //             child: LiveList(
              //               controller: controller.scrollController,
              //               physics: const BouncingScrollPhysics(),
              //               showItemDuration: const Duration(milliseconds: 350),
              //               padding: const EdgeInsets.all(16),
              //               reAnimateOnVisibility: true,
              //               itemCount: controller.contentList.length,
              //               itemBuilder: (_, index, animation) {
              //                 final Kural kural =
              //                     controller.contentList[index] as Kural;
              //                 return FadeTransition(
              //                   opacity: Tween<double>(
              //                     begin: 0,
              //                     end: 1,
              //                   ).animate(animation),
              //                   child: SlideTransition(
              //                     position: Tween<Offset>(
              //                       begin: Offset(index.isEven ? 0.15 : -0.15, 0.1),
              //                       end: Offset.zero,
              //                     ).animate(animation),
              //                     child: KuralCard(
              //                       controller: controller,
              //                       kural: kural,
              //                     ),
              //                   ),
              //                 );
              //               },
              //             ),
              //           ),
              //         ),
              //         if (controller.isLoading.isTrue)
              //           const Center(
              //             child: CircularProgressIndicator(),
              //           )
              //         else
              //           const SizedBox.shrink()
              //       ],
              //     );
              //   },
              // ),
            ],
          ),
          extendBody: true,
        ),
      ),
    );
  }
}

class KuralCard extends StatelessWidget {
  const KuralCard({
    Key key,
    @required this.controller,
    @required this.kural,
  }) : super(key: key);

  final LibraryController controller;
  final Kural kural;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      color: Colors.lightBlue[100],
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
        side: BorderSide(
          width: 2,
          color: Colors.cyan.withOpacity(0.8),
          // style: BorderStyle.solid,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Colors.lightBlueAccent,
            ),
            height: 150,
          ),
          ClipPath(
            // clipper: CustomClipPath(),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.white,
              ),
              height: 150,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 30,
                child: ListView(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    InkWell(
                      onTap: () => controller.scrollController.jumpTo(
                          controller.scrollController.position.minScrollExtent),
                      child: Text(
                        // kural.kurals[index].chapter,
                        kural.adikaram.name,
                        style:
                            const TextStyle(fontSize: 15, color: Colors.purple),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      child: VerticalDivider(
                        color: Colors.redAccent[400],
                        thickness: 0.9,
                      ),
                    ),
                    InkWell(
                      onTap: () => controller.scrollController.jumpTo(
                          controller.scrollController.position.maxScrollExtent),
                      child: Text(
                        kural.paal.name,
                        style:
                            const TextStyle(fontSize: 15, color: Colors.purple),
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
                    // bottom: 20,
                    left: 8,
                    right: 8),
                leading: CircleAvatar(
                  radius: 25,
                  child: FittedBox(
                    child: Text(
                      kural.number.toString(),
                    ),
                  ),
                ),
                title: Text(
                  kural.line1,
                  style:
                      const TextStyle(color: Colors.indigoAccent, fontSize: 18),
                ),
                subtitle: Text(
                  kural.line2,
                  style: const TextStyle(color: Colors.indigo, fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, 0.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true; // TODO change
}
