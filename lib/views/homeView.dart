import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matrix4_transform/matrix4_transform.dart';

import '../constants/constants.dart';
import '../controllers/controllers.dart';
import '../widgets/widgets.dart';

// class HomeView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Explore'),
//       ),
//       drawer: Drawer(
//         child: Column(),
//       ),
//       body: Stack(
//         alignment: Alignment.bottomCenter,
//         children: [
//           Column(
//             children: [
//               Expanded(
//                 flex: 3,
//                 child: Column(
//                   children: [
//                     const Expanded(
//                       child: Padding(
//                         padding: EdgeInsets.only(left: 17.0, top: 5),
//                         child: Center(
//                           child: Text(
//                             'Choose Your Favorite From Our Library',
//                             overflow: TextOverflow.fade,
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.black45),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       flex: 3,
//                       child: ListView.builder(
//                         itemCount: topicList.length,
//                         scrollDirection: Axis.horizontal,
//                         itemBuilder: (_, int index) => CustomCard(
//                           topic: topicList[index],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 flex: 4,
//                 child: Container(
//                   color: Colors.pinkAccent,
//                   child: Column(
//                     children: [
//                       Flexible(
//                         child: Stack(
//                           children: [
//                             Positioned(
//                               bottom: 30,
//                               child: Card(
//                                 elevation: 8,
//                                 color: const Color.fromARGB(252, 34, 225, 234),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: const SizedBox(width: 220, height: 250),
//                               ),
//                             ),
//                             Positioned(
//                               bottom: 25,
//                               child: Card(
//                                 elevation: 8,
//                                 color: const Color.fromARGB(255, 0, 255, 0),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: const SizedBox(width: 220, height: 250),
//                               ),
//                             ),
//                             Positioned(
//                               bottom: 20,
//                               child: Card(
//                                 elevation: 8,
//                                 color: const Color.fromARGB(225, 34, 25, 200),
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10)),
//                                 child: const SizedBox(width: 220, height: 250),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               // Expanded(
//               //   flex: 2,
//               //   child: SizedBox(),
//               // )
//             ],
//           ),
//           DraggableScrollableSheet(
//             // maxChildSize: 0.8,
//             initialChildSize: 0.1,
//             minChildSize: 0.1,
//             builder: (BuildContext context, ScrollController scrollController) {
//               return SingleChildScrollView(
//                 controller: scrollController,
//                 child: CustomScrollViewContent(),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

/// Content of the DraggableBottomSheet's child SingleChildScrollView

// class CustomHorizontallyScrollingRestaurants extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 16),
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             CustomRestaurantCategory(),
//             SizedBox(width: 12),
//             CustomRestaurantCategory(),
//             SizedBox(width: 12),
//             CustomRestaurantCategory(),
//             SizedBox(width: 12),
//             CustomRestaurantCategory(),
//             SizedBox(width: 12),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CustomFeaturedListsText extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 16),
//       //only to left align the text
//       child: Row(
//         children: <Widget>[
//           Text("Featured Lists", style: TextStyle(fontSize: 14))
//         ],
//       ),
//     );
//   }
// }

// class CustomFeaturedItemsGrid extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: GridView.count(
//         //to avoid scrolling conflict with the dragging sheet
//         physics: NeverScrollableScrollPhysics(),
//         padding: const EdgeInsets.all(0),
//         crossAxisCount: 2,
//         mainAxisSpacing: 12,
//         crossAxisSpacing: 12,
//         shrinkWrap: true,
//         children: <Widget>[
//           CustomFeaturedItem(),
//           CustomFeaturedItem(),
//           CustomFeaturedItem(),
//           CustomFeaturedItem(),
//         ],
//       ),
//     );
//   }
// }

// class CustomRecentPhotosText extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 16),
//       child: Row(
//         children: <Widget>[
//           Text("Recent Photos", style: TextStyle(fontSize: 14)),
//         ],
//       ),
//     );
//   }
// }

// class CustomRecentPhotoLarge extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: CustomFeaturedItem(),
//     );
//   }
// }

// class CustomRecentPhotosSmall extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return CustomFeaturedItemsGrid();
//   }
// }

// class CustomRestaurantCategory extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 100,
//       width: 100,
//       decoration: BoxDecoration(
//         color: Colors.grey[500],
//         borderRadius: BorderRadius.circular(8),
//       ),
//     );
//   }
// }

// class CustomFeaturedItem extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200,
//       decoration: BoxDecoration(
//         color: Colors.grey[500],
//         borderRadius: BorderRadius.circular(8),
//       ),
//     );
//   }
// }

// child: DraggableScrollableActuator(
//   child: DraggableScrollableSheet(
//     initialChildSize: 0.3,
//     minChildSize: 0.2,
//     maxChildSize: 0.8,
//     builder: (BuildContext context, myscrollController) {
//       return Center(
//         child: Material(
//           // borderRadius: const BorderRadius.all(Radius.circular(35),),
//           color: Colors.limeAccent,
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//               // Radius.elliptical(25, 50),
//               topRight: Radius.circular(35),
//               topLeft: Radius.circular(35),
//             ),
//           ),
//           child: Column(
//             children: [
//               ExpandIcon(
//                 onPressed: (bool value) {
//                   DraggableScrollableActuator.reset(context);
//                 },
//                 // isExpanded: true,
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   controller: myscrollController,
//                   itemCount: 25,
//                   itemBuilder: (BuildContext context, int index) {
//                     return ListTile(
//                       title: Text(
//                         'Dish $index',
//                         style: const TextStyle(color: Colors.black54),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   ),
// ),

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        transform: Matrix4Transform()
            .translate(x: controller.xoffSet.value, y: controller.yoffSet.value)
            .rotate(controller.angle.value)
            .matrix4,
        duration: const Duration(milliseconds: 230),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.blue[200],
            borderRadius: controller.isOpen.value
                ? BorderRadius.circular(10)
                : BorderRadius.circular(0),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: !controller.isOpen.value
                          ? IconButton(
                              icon: const Icon(
                                Icons.menu,
                                color: Color(0xFF1f186f),
                              ),
                              onPressed: controller.drawerOpen)
                          : IconButton(
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: Color(0xFF1f186f),
                              ),
                              onPressed: controller.drawerClose),
                    ),
                    const FittedBox(
                      child: Text('Explore'),
                    )
                  ],
                ),
                Positioned.fill(
                  top: 25,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            const Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 17.0, top: 5),
                                child: Center(
                                  child: Text(
                                    'Choose Your Favorite From Our Library',
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black45),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: topicList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (_, int index) => CustomCard(
                                  topic: topicList[index],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          color: Colors.pinkAccent,
                        ),
                      ),
                    ],
                  ),
                ),
                const CustomDraggableScrollableSheet(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DrawerStack extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FirstLayer(),
          SecondLayer(),
          ThirdLayer(),
          HomeView(),
        ],
      ),
    );
  }
}
