import 'package:TowardsLife/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TOWARDSLIFE'),
        titleSpacing: 20,
      ),
      backgroundColor: Colors.amber[100],
      body: Column(
        children: [
          Container(
            // decoration: new BoxDecoration(
            //   boxShadow: [
            //     // color: Colors.white, //background color of box
            //     BoxShadow(
            //       color: Colors.red,
            //       blurRadius: 25.0, // soften the shadow
            //       spreadRadius: 5.0, //extend the shadow
            //       offset: Offset(
            //         15.0, // Move to right 10  horizontally
            //         15.0, // Move to bottom 10 Vertically
            //       ),
            //     )
            //   ],
            // ),
            height: 225,
            child: InkWell(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                  child: Text(
                    "Welcome to Towards Life",
                    style: TextStyle(color: Colors.red, fontSize: 16.0),
                  ),
                ),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.00, bottom: 15.00, left: 15, right: 5),
                        child: InkWell(
                          splashColor: Colors.blue[900],
                          onTap: () async {
                            Get.toNamed(Thirukkuralroute);
                          },
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Image(
                                  image: AssetImage(
                                      'assets/images/thiruvalluvar.png'),
                                  width: 80.0,
                                  height: 80.0,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2.0),
                                ),
                                Text(
                                  "Thirukkural",
                                  style: TextStyle(
                                    color: Color(0xff202124),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2.0),
                                ),
                                Text(
                                  "Count-1330",
                                  style: TextStyle(
                                      color: Color(0xff5f6368), fontSize: 12.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.00, bottom: 15.00, left: 15, right: 5),
                        child: InkWell(
                          onTap: () async {
                            Get.toNamed(Thirukkuralroute);
                          },
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Image(
                                  image:
                                      AssetImage('assets/images/avvaiyar.png'),
                                  width: 80.0,
                                  height: 80.0,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2.0),
                                ),
                                Text(
                                  "Aathichudi",
                                  style: TextStyle(
                                    color: Color(0xff202124),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2.0),
                                ),
                                Text(
                                  "Count-109",
                                  style: TextStyle(
                                      color: Color(0xff5f6368), fontSize: 12.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.00, bottom: 15.00, left: 15, right: 5),
                        child: InkWell(
                          onTap: () async {
                            Get.toNamed(Thirukkuralroute);
                          },
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Image(
                                  image:
                                      AssetImage('assets/images/portrait.jpg'),
                                  width: 80.0,
                                  height: 80.0,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2.0),
                                ),
                                Text(
                                  "Palamuligal",
                                  style: TextStyle(
                                    color: Color(0xff202124),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2.0),
                                ),
                                Text(
                                  "Count-555",
                                  style: TextStyle(
                                      color: Color(0xff5f6368), fontSize: 12.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.00, bottom: 15.00, left: 15, right: 5),
                        child: InkWell(
                          onTap: () async {
                            Get.toNamed(Thirukkuralroute);
                          },
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Image(
                                  image: AssetImage('assets/images/olai1.png'),
                                  width: 80.0,
                                  height: 80.0,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2.0),
                                ),
                                Text(
                                  "For you you",
                                  style: TextStyle(
                                    color: Color(0xff202124),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2.0),
                                ),
                                Text(
                                  "555",
                                  style: TextStyle(
                                      color: Color(0xff5f6368), fontSize: 12.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.00, bottom: 15.00, left: 15, right: 5),
                        child: InkWell(
                          onTap: () async {
                            Get.toNamed(Thirukkuralroute);
                          },
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Image(
                                  image: AssetImage('assets/images/olai2.png'),
                                  width: 80.0,
                                  height: 80.0,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2.0),
                                ),
                                Text(
                                  "For you you",
                                  style: TextStyle(
                                    color: Color(0xff202124),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2.0),
                                ),
                                Text(
                                  "555",
                                  style: TextStyle(
                                      color: Color(0xff5f6368), fontSize: 12.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 15.00, bottom: 82.00, left: 5, right: 5),
            child: Container(
              child: Text('Quotes Will Come Here'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 15.00, bottom: 15.00, left: 5, right: 5),
            child: Container(
              child: Text('Recents Will Come Here'),
            ),
          ),
        ],
      ),
    );
  }
}

// body: ListView(padding: const EdgeInsets.all(10.0), children: [
//   Card(
//     color: Colors.lime,
//     child: InkWell(
//       splashColor: Colors.indigo,
//       onTap: () async {
//         Get.toNamed(Thirukkuralroute);
//       },
//       child: Row(children: [
//         Container(
//           height: 100,
//           width: 100,
//           child: Image.asset('assets/images/thiruvalluvar.png'),
//         ),
//         Container(
//             margin: EdgeInsets.all(8),
//             height: 100,
//             width: 200,
//             child: Column(children: [
//               Text(
//                 'Thirukkural',
//                 textAlign: TextAlign.start,
//                 style: TextStyle(
//                   color: Colors.red,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: 'Open Sans',
//                   fontSize: 25,
//                 ),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Center(
//                 child: Text(
//                   'Thirukkural of Tamil.Totally 1330 Kurals were there.',
//                   style: TextStyle(
//                     color: Colors.grey[800],
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ])),
//       ]),
//     ),
//   ),
//   Card(
//     color: Colors.lime,
//     child: InkWell(
//       splashColor: Colors.indigo,
//       onTap: () async {
//         Get.toNamed(Thirukkuralroute);
//       },
//       child: Row(children: [
//         Container(
//           height: 100,
//           width: 100,
//           child: Image.asset('assets/images/thiruvalluvar.png'),
//         ),
//         Container(
//             margin: EdgeInsets.all(8),
//             height: 100,
//             width: 200,
//             child: Column(children: [
//               Text(
//                 'Aathichudi',
//                 textAlign: TextAlign.start,
//                 style: TextStyle(
//                   color: Colors.red,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: 'Open Sans',
//                   fontSize: 25,
//                 ),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Center(
//                 child: Text(
//                   'Aathichudis of Tamil.Totally 109 were there.',
//                   style: TextStyle(
//                     color: Colors.grey[800],
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ])),
//       ]),
//     ),
//   ),
//   Card(
//     color: Colors.lime,
//     child: InkWell(
//       splashColor: Colors.indigo,
//       onTap: () async {
//         Get.toNamed(Thirukkuralroute);
//       },
//       child: Row(children: [
//         Container(
//           height: 100,
//           width: 100,
//           child: Image.asset('assets/images/thiruvalluvar.png'),
//         ),
//         Container(
//             margin: EdgeInsets.all(8),
//             height: 100,
//             width: 200,
//             child: Column(children: [
//               Text(
//                 'Palamuligaz',
//                 textAlign: TextAlign.start,
//                 style: TextStyle(
//                   color: Colors.red,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: 'Open Sans',
//                   fontSize: 25,
//                 ),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Center(
//                 child: Text(
//                   'Proverbs of Tamil.Totally 5 proverbs were there.',
//                   style: TextStyle(
//                     color: Colors.grey[800],
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ])),
//       ]),
//     ),
//   ),

// InkWell(
//   splashColor: Colors.indigo,
//   hoverColor: Colors.blueAccent,
//   onTap: () {
//     Get.toNamed(Thirukkuralroute);
//   },
//   child: Row(children: [
//     Container(
//       height: 125,
//       width: 125,
//       child: Icon(
//         Icons.star,
//         color: Colors.red[500],
//       ),
//     ),
//     Container(
//       color: Colors.orangeAccent,
//       height: 125,
//       width: 500,
//       child: Icon(
//         Icons.star,
//         color: Colors.red[500],
//       ),
//     ),
//   ]),
// ),
// InkWell(
//   splashColor: Colors.indigo,
//  hoverColor: Colors.red,
//   onTap: () async {
//     Get.toNamed(Thirukkuralroute);
//   },
//   child: Row(children: [
//     Container(
//       color: Colors.blueAccent,
//       height: 125,
//       width : 125,
//       child: Card(

//         child: Text('Aathichudi'),
//       ),
//     ),
//   ]
//   ),
// ),
// InkWell(
//   splashColor: Colors.indigo,
//  hoverColor: Colors.red,
//   onTap: () async {
//     Get.toNamed(Thirukkuralroute);
//   },
//   child: Row(children: [
//     Container(
//       height: 125,
//       width : 125,
//       child: Card(
//         child: Text('Proverb'),
//       ),
//     ),
//   ]
//   ),
// ),
// ]),

// body: Column(
//   mainAxisAlignment: MainAxisAlignment.center,

//   children: [
//     ListTile(

//     ),
//     InkWell(
//       onTap: () async {
//         Get.toNamed(Thirukkuralroute);
//       },
//       child: Container(
//         height: 100,
//         child: Card(
//           child: Text('aathichudi'),
//         ),
//       ),
//     ),
//     InkWell(
//       onTap: () async {
//         Get.toNamed(Thirukkuralroute);
//       },
//       child: Container(
//         height: 100,
//         child: Card(
//           child: Text('kurals'),
//         ),
//       ),
//     ),
//   ],
// ),
