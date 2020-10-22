import 'package:TowardsLife/controllers/chudiController.dart';
// import 'package:TowardsLife/controllers/homeController.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class AthichudiLists extends GetView<ChudiController> {
  final TextStyle dropdownMenuItem =
      const TextStyle(color: Colors.black, fontSize: 18);

  final primary = const Color(0xff696b9e);
  final secondary = const Color(0xfff29a94);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff0f0f0),
      body: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 170),
            width: double.infinity,
            child: Obx(
              () {
                if (controller.chudis.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  controller: controller.controller,
                  itemCount: controller.chudis.length,
                  itemBuilder: (_, index) {
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
                        children: <Widget>[
                          Container(
                            height: 30,
                            child: ListView(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10),
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                InkWell(
                                  onTap: () => controller.controller.jumpTo(
                                      controller
                                          .controller.position.minScrollExtent),
                                  child: Text(
                                    // kural.kurals[index].chapter,
                                    '${controller.chudis[index].poem.toString()} [${controller.chudis[index].number}]',
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
                              bottom: 5,
                              left: 15,
                            ),
                            title: Text(
                              controller.chudis[index].meaning.toString(),
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.indigoAccent),
                            ),
                            subtitle: Text(
                              '\n- ${controller.chudis[index].paraphrase}',
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.indigo),
                            ),
                          ),
                          const Divider(
                            height: 10,
                            color: Colors.orange,
                          ),
                          ListTile(
                            contentPadding: const EdgeInsets.only(
                              bottom: 5,
                              left: 15,
                            ),
                            title: Text(
                              '${controller.chudis[index].translation}.',
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.indigoAccent),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Container(
            height: 140,
            width: double.infinity,
            decoration: BoxDecoration(
                color: primary,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: const Icon(
                  //     Icons.menu,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  const Text(
                    "Aathichudi",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.filter_list_sharp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: <Widget>[
              const SizedBox(
                height: 110,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Material(
                  elevation: 5.0,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: TextField(
                    // controller: TextEditingController(text: locations[0]),
                    cursorColor: Theme.of(context).primaryColor,
                    style: dropdownMenuItem,
                    decoration: const InputDecoration(
                      hintText: "type here to find the athichudi's",
                      hintStyle: TextStyle(color: Colors.black38, fontSize: 16),
                      prefixIcon: Material(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                        child: Icon(Icons.search),
                      ),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 13),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
