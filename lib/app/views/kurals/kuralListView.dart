import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/controllers.dart';
import '../../data/model/models.dart';
import '../../widgets/widgets.dart';

class KuralsListView extends GetView<LibraryController> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawerEdgeDragWidth: context.widthTransformer(reducedBy: 40),
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
                    key: listKey,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    controller: controller.scrollController,
                    itemCount: controller.contentList.length,
                    itemBuilder: (
                      _,
                      int index,
                    ) {
                      final Kural kural =
                          controller.contentList[index] as Kural;
                      return Caard(controller: controller, kural: kural);
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
      ),
    );
  }
}

class Caard extends StatelessWidget {
  const Caard({
    Key key,
    @required this.controller,
    @required this.kural,
  }) : super(key: key);

  final LibraryController controller;
  final Kural kural;

  @override
  Widget build(BuildContext context) {
    return Card(
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

class AnimatedListItem extends StatefulWidget {
  final int index;
  final LibraryController controller;
  final Kural kural;

  const AnimatedListItem(this.index,
      {Key key, @required this.controller, @required this.kural})
      : super(key: key);

  @override
  _AnimatedListItemState createState() => _AnimatedListItemState();
}

class _AnimatedListItemState extends State<AnimatedListItem> {
  bool _animate = false;

  static bool _isStart = true;

  @override
  void initState() {
    super.initState();
    _isStart
        ? Future.delayed(Duration(milliseconds: widget.index * 100), () {
            setState(() {
              _animate = true;
              _isStart = false;
            });
          })
        : _animate = true;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 1000),
      opacity: _animate ? 1 : 0,
      curve: Curves.easeInOutQuart,
      child: AnimatedPadding(
          duration: const Duration(milliseconds: 1000),
          padding: _animate
              ? const EdgeInsets.all(4.0)
              : const EdgeInsets.only(top: 10),
          child: Caard(controller: widget.controller, kural: widget.kural)),
    );
  }
}
