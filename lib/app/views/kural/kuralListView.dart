import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/controllers.dart';
import '../../data/model/models.dart';
import '../../globalWidgets/widgets.dart';

class KuralsListView extends GetWidget<LibraryController> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  final lk = Get.put(KuralController());
  final KuralController kuralController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: 1,
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
              IyalTabPage(kuralController: kuralController),
              MuppalTabPage(kuralController: kuralController),
              AdhikaramTabPage(kuralController: kuralController),

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
        ),
      ),
    );
  }
}

class IyalTabPage extends StatelessWidget {
  const IyalTabPage({
    Key? key,
    required this.kuralController,
  }) : super(key: key);

  final KuralController kuralController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xffa1c4fd),
            Color(0xffc2e9fb),
          ],
        ),
      ),
      child: ListView.builder(
        itemCount: kuralController.iyalList.length,
        itemBuilder: (_, index) {
          switch (index) {
            case 0:
              return _IyalColumn(kuralController: kuralController, index: 0);

            case 4:
              return _IyalColumn(kuralController: kuralController, index: 1);
            case 11:
              return _IyalColumn(kuralController: kuralController, index: 2);
            default:
              return _IyalCard(
                kuralController: kuralController,
                index: index,
              );
          }
        },
      ),
    );
  }
}

class _IyalColumn extends StatelessWidget {
  const _IyalColumn({
    Key? key,
    required this.kuralController,
    required this.index,
  }) : super(key: key);

  final KuralController kuralController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(kuralController.kuralDetail[index].name),
        SizedBox(
          width: double.maxFinite,
          child: _IyalCard(
            kuralController: kuralController,
            index: index,
          ),
        )
      ],
    );
  }
}

class _IyalCard extends StatelessWidget {
  const _IyalCard(
      {Key? key, required this.kuralController, required this.index})
      : super(key: key);

  final KuralController kuralController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(27.0),
      ),
      elevation: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            kuralController.iyalList[index].name,
          ),
          Text(kuralController.iyalList[index].translation),
          Text(kuralController.iyalList[index].transliteration),
          Text(kuralController.iyalList[index].chapters.detail.length
              .toString()),
          Text((kuralController.iyalList[index].chapters.detail.length * 10)
              .toString()),
        ],
      ),
    );
  }
}

class AdhikaramTabPage extends StatelessWidget {
  const AdhikaramTabPage({
    Key? key,
    required this.kuralController,
  }) : super(key: key);

  final KuralController kuralController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xffa1c4fd),
            Color(0xffc2e9fb),
          ],
        ),
      ),
      child: ListView.builder(
        itemCount: kuralController.adhikaramList.length,
        itemBuilder: (_, index) {
          return Text(kuralController.adhikaramList[index].name);
        },
      ),
    );
  }
}

class MuppalTabPage extends StatelessWidget {
  const MuppalTabPage({
    Key? key,
    required this.kuralController,
  }) : super(key: key);

  final KuralController kuralController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xffa1c4fd),
            Color(0xffc2e9fb),
          ],
        ),
      ),
      child: Column(
        children: List.generate(
          kuralController.kuralDetail.length,
          (index) {
            final kd = kuralController.kuralDetail[index];
            final Color color = index == 0
                ? Colors.lightBlueAccent.shade100
                : index == 1
                    ? Colors.green.shade300
                    : Colors.orange.shade600;
            return Expanded(
              flex: 4,
              child: SizedBox(
                width: double.maxFinite,
                child: Card(
                  color: color,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            kuralController.kuralDetail[index].name,
                            style: TextStyle(
                                letterSpacing: 1,
                                color: Colors.grey.shade800,
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                                fontFamily: "NotoSansTamil"),
                          ),
                        ),
                        MuppaalStat(
                          s1: "Translation",
                          s2: kd.translation,
                          s3: '',
                        ),
                        MuppaalStat(
                          s1: "Transliteration",
                          s2: kd.transliteration,
                          s3: '',
                        ),
                        MuppaalStat(
                          s1: "Iyals",
                          s2: index == 0
                              ? "4"
                              : index == 1
                                  ? "7"
                                  : "2",
                          s3: '',
                        ),
                        MuppaalStat(
                          s1: "Adhikarams",
                          s2: index == 0
                              ? "38"
                              : index == 1
                                  ? "70"
                                  : "25",
                          s3: '',
                        ),
                        MuppaalStat(
                          s1: "Kurals",
                          s2: index == 0
                              ? "380"
                              : index == 1
                                  ? "700"
                                  : "250",
                          s3: '',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        )
          ..add(
            const Spacer(
              flex: 2,
            ),
          )
          ..insert(0, const Spacer()),
      ),
    );
  }
}

class MuppaalStat extends StatelessWidget {
  const MuppaalStat({
    Key? key,
    required this.s1,
    required this.s2,
    required this.s3,
  }) : super(key: key);

  final String s1;
  final String s2;
  final String s3;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$s1: ',
            style: const TextStyle(
              color: Colors.deepPurple,
              fontSize: 15,
              fontWeight: FontWeight.w400,
              // fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: s2,
            style: const TextStyle(
              color: Colors.deepPurpleAccent,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}

class KuralCard extends StatelessWidget {
  const KuralCard({
    Key? key,
    required this.controller,
    required this.kural,
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
