import 'package:TowardsLife/routes.dart';
import 'package:TowardsLife/widgets/homeWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('TOWARDS LIFE'),
      //   titleSpacing: 20,
      //   backgroundColor: Colors.white,
      // ),
      backgroundColor: Colors.white,
      // resizeToAvoidBottomPadding: false,
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: WaveClipperOne(),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Color(0xffdb494d),
                      Color(0xffdb343c),
                      Color(0xffdb243c),
                      Color(0xffdb143C),
                    ])),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 45,
                    left: 2,
                    right: 170,
                  ),
                  child: Text(
                    'TOWARDSLIFE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                    ),
                  ),
                ),
                ClipPath(
                  clipper: WaveClipperTwo(),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Color(0xffc21851),
                      Color(0xffad1457),
                      Color(0xff880e4f),
                    ])),
                  ),
                ),
                ClipPath(
                  clipper: WaveClipperFour(),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Color(0xfff48f60),
                      Color(0xfff48f80),
                      Color(0xfff48fd5),
                    ])),
                  ),
                ),
                ClipPath(
                  clipper: WaveClipperThree(),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Color(0xffffea00),
                      Color(0xffffd600),
                    ])),
                  ),
                ),
                ClipPath(
                  clipper: WaveClipperFive(),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Color(0xffc21851),
                      Color(0xffad1457),
                      Color(0xff880e4f),
                    ])),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 220,
                    right: 75,
                    left: 2,
                  ),
                  child: Text(
                    'Select a Item which you wish...',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 18,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    bottom: 200,
                    top: 5,
                    left: 285,
                    right: 5,
                  ),
                  child: Icon(
                    Icons.home,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 370,
            width: 350,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 5,
                bottom: 5,
                left: 5,
                right: 5,
              ),
              child: ListView(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          bottom: 10,
                          right: 10,
                        ),
                        child: Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              color: Color(0xffffcfff),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.redAccent,
                                  blurRadius: 7.5,
                                  spreadRadius: 0.05,
                                  offset: Offset(0, 3),
                                )
                              ]),
                          width: 150,
                          height: 160,
                          child: InkWell(
                            splashColor: Colors.blue[900],
                            onTap: () async {
                              Get.toNamed(thirukkuralroute);
                            },
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Image(
                                    image: AssetImage('assets/images/ppp.png'),
                                    width: 80.0,
                                    height: 90.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: Container(
                                    height: 1.0,
                                    width: 140.0,
                                    color: Colors.redAccent,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    'Thirukkural',
                                    style: TextStyle(
                                      fontSize: 17.5,
                                      color: Colors.brown,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, bottom: 10, right: 10),
                        child: Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              color: Color(0xffffcfff),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.redAccent,
                                  blurRadius: 7.5,
                                  spreadRadius: 0.05,
                                  offset: Offset(0, 3),
                                )
                              ]),
                          width: 150,
                          height: 160,
                          child: InkWell(
                            splashColor: Colors.blue[900],
                            onTap: () async {
                              Get.toNamed(thirukkuralroute);
                            },
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/avvaiyar.png'),
                                    width: 80.0,
                                    height: 90.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: Container(
                                    height: 1.0,
                                    width: 140.0,
                                    color: Colors.redAccent,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    'Aathichudi',
                                    style: TextStyle(
                                      fontSize: 17.5,
                                      color: Colors.brown,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, right: 10, top: 10),
                            child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  color: Color(0xffffcfff),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.redAccent,
                                      blurRadius: 7.5,
                                      spreadRadius: 0.05,
                                      offset: Offset(0, 3),
                                    )
                                  ]),
                              width: 150,
                              height: 160,
                              child: InkWell(
                                splashColor: Colors.blue[900],
                                onTap: () async {
                                  Get.toNamed(thirukkuralroute);
                                },
                                child: Column(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/olai3.png'),
                                        width: 80.0,
                                        height: 90.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      child: Container(
                                        height: 1.0,
                                        width: 140.0,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Text(
                                        'Palamuzhigal',
                                        style: TextStyle(
                                          fontSize: 17.5,
                                          color: Colors.brown,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, right: 10, top: 10),
                            child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  color: Color(0xffffcfff),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.redAccent,
                                      blurRadius: 7.5,
                                      spreadRadius: 0.05,
                                      offset: Offset(0, 3),
                                    )
                                  ]),
                              width: 150,
                              height: 160,
                              child: InkWell(
                                splashColor: Colors.blue[900],
                                onTap: () async {
                                  Get.toNamed(thirukkuralroute);
                                },
                                child: Column(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/portrait.jpg'),
                                        width: 80.0,
                                        height: 90.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      child: Container(
                                        height: 1.0,
                                        width: 140.0,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Text(
                                        'Others',
                                        style: TextStyle(
                                          fontSize: 17.5,
                                          color: Colors.brown,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, right: 10, top: 10),
                            child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  color: Color(0xffffcfff),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.redAccent,
                                      blurRadius: 7.5,
                                      spreadRadius: 0.05,
                                      offset: Offset(0, 3),
                                    )
                                  ]),
                              width: 150,
                              height: 160,
                              child: InkWell(
                                splashColor: Colors.blue[900],
                                onTap: () async {
                                  Get.toNamed(thirukkuralroute);
                                },
                                child: Column(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Image(
                                        image:
                                            AssetImage('assets/images/ppp.png'),
                                        width: 80.0,
                                        height: 90.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      child: Container(
                                        height: 1.0,
                                        width: 140.0,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Text(
                                        'Others',
                                        style: TextStyle(
                                          fontSize: 17.5,
                                          color: Colors.brown,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, right: 10, top: 10),
                            child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  color: Color(0xffffcfff),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.redAccent,
                                      blurRadius: 7.5,
                                      spreadRadius: 0.05,
                                      offset: Offset(0, 3),
                                    )
                                  ]),
                              width: 150,
                              height: 160,
                              child: InkWell(
                                splashColor: Colors.blue[900],
                                onTap: () async {
                                  Get.toNamed(thirukkuralroute);
                                },
                                child: Column(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Image(
                                        image:
                                            AssetImage('assets/images/ppp.png'),
                                        width: 80.0,
                                        height: 90.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      child: Container(
                                        height: 1.0,
                                        width: 140.0,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Text(
                                        'Others',
                                        style: TextStyle(
                                          fontSize: 17.5,
                                          color: Colors.brown,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Column(
//   children: [
//     Container(
// decoration: const BoxDecoration(
//     border: Border(
//       top: BorderSide(width: 0.5, color: Color(0xA6865566)),
//       left: BorderSide(width: 0.5, color: Color(0xF6865566)),
//       right: BorderSide(width: 0.5, color: Color(0xF6865566)),
//       bottom: BorderSide(width: 1.5, color: Color(0x25562325)),
//     ),
//     color: Colors.deepPurpleAccent,
//     boxShadow: [
//       BoxShadow(
//           color: Colors.grey,
//           blurRadius: 7,
//           spreadRadius: 0.5,
//           offset: Offset(0, 3))
//     ]),
//       height: 183,
//       child: InkWell(
//           child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Expanded(
//             child: ListView(
//               scrollDirection: Axis.horizontal,
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       top: 15.00, bottom: 10.00, left: 15, right: 5),
//                   child: InkWell(
// splashColor: Colors.blue[900],
// onTap: () async {
//   Get.toNamed(thirukkuralroute);
// },
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Container(
//                           decoration: const BoxDecoration(
//                               border: Border(
//                                 top: BorderSide(
//                                     width: 0.5, color: Color(0xA6865566)),
//                                 left: BorderSide(
//                                     width: 0.5, color: Color(0xF6865566)),
//                                 right: BorderSide(
//                                     width: 0.5, color: Color(0xF6865566)),
//                                 bottom: BorderSide(
//                                     width: 1.5, color: Color(0x25562325)),
//                               ),
//                               color: Colors.white,
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.indigo,
//                                   blurRadius: 2,
//                                   spreadRadius: 0.5,
//                                   offset: Offset(1, 1),
//                                 )
//                               ]),
//                           child: const Image(
//                             image: AssetImage(
//                                 'assets/images/thiruvalluvar.png'),
//                             width: 80.0,
//                             height: 80.0,
//                           ),
//                         ),
//                         const Padding(
//                           padding: EdgeInsets.all(2.0),
//                         ),
//                         const Text(
//                           "Thirukkural",
//                           style: TextStyle(
//                             color: Colors.red,
//                             fontSize: 15.0,
//                           ),
//                         ),
//                         const Text(
//                           "Count-1330",
//                           style: TextStyle(
//                               color: Color(0xff202124), fontSize: 15.0),
//                         ),
//                       ],
//                     ),
//                     // ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       top: 15.00, bottom: 10.00, left: 15, right: 5),
//                   child: InkWell(
//                     onTap: () async {
//                       Get.toNamed(thirukkuralroute);
//                     },
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Container(
//                           decoration: const BoxDecoration(
//                               border: Border(
//                                 top: BorderSide(
//                                     width: 0.5, color: Color(0xA6865566)),
//                                 left: BorderSide(
//                                     width: 0.5, color: Color(0xF6865566)),
//                                 right: BorderSide(
//                                     width: 0.5, color: Color(0xF6865566)),
//                                 bottom: BorderSide(
//                                     width: 1.5, color: Color(0x25562325)),
//                               ),
//                               color: Colors.white,
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.indigo,
//                                   blurRadius: 2,
//                                   spreadRadius: 0.5,
//                                   offset: Offset(1, 1),
//                                 )
//                               ]),
//                           child: const Image(
//                             image:
//                                 AssetImage('assets/images/avvaiyar.png'),
//                             width: 80.0,
//                             height: 80.0,
//                           ),
//                         ),
//                         const Padding(
//                           padding: EdgeInsets.all(2.0),
//                         ),
//                         const Text(
//                           "Aathichudi",
//                           style: TextStyle(
//                             color: Colors.red,
//                             fontSize: 15.0,
//                           ),
//                         ),
//                         const Text(
//                           "Count-109",
//                           style: TextStyle(
//                               color: Color(0xff202124), fontSize: 15.0),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       top: 15.00, bottom: 10.00, left: 15, right: 5),
//                   child: InkWell(
//                     onTap: () async {
//                       Get.toNamed(thirukkuralroute);
//                     },
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Container(
//                           decoration: const BoxDecoration(
//                               border: Border(
//                                 top: BorderSide(
//                                     width: 0.5, color: Color(0xA6865566)),
//                                 left: BorderSide(
//                                     width: 0.5, color: Color(0xF6865566)),
//                                 right: BorderSide(
//                                     width: 0.5, color: Color(0xF6865566)),
//                                 bottom: BorderSide(
//                                     width: 1.5, color: Color(0x25562325)),
//                               ),
//                               color: Colors.white,
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.indigo,
//                                   blurRadius: 2,
//                                   spreadRadius: 0.5,
//                                   offset: Offset(1, 1),
//                                 )
//                               ]),
//                           child: const Image(
//                             image:
//                                 AssetImage('assets/images/portrait.jpg'),
//                             width: 80.0,
//                             height: 80.0,
//                           ),
//                         ),
//                         const Padding(
//                           padding: EdgeInsets.all(2.0),
//                         ),
//                         const Text(
//                           "Palamuligal",
//                           style: TextStyle(
//                             color: Colors.red,
//                             fontSize: 15.0,
//                           ),
//                         ),
//                         const Text(
//                           "Count-555",
//                           style: TextStyle(
//                               color: Color(0xff202124), fontSize: 15.0),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       top: 15.00, bottom: 10.00, left: 15, right: 5),
//                   child: InkWell(
//                     onTap: () async {
//                       Get.toNamed(thirukkuralroute);
//                     },
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Container(
//                           decoration: const BoxDecoration(
//                               border: Border(
//                                 top: BorderSide(
//                                     width: 0.5, color: Color(0xA6865566)),
//                                 left: BorderSide(
//                                     width: 0.5, color: Color(0xF6865566)),
//                                 right: BorderSide(
//                                     width: 0.5, color: Color(0xF6865566)),
//                                 bottom: BorderSide(
//                                     width: 1.5, color: Color(0x25562325)),
//                               ),
//                               color: Colors.white,
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.indigo,
//                                   blurRadius: 2,
//                                   spreadRadius: 0.5,
//                                   offset: Offset(1, 1),
//                                 )
//                               ]),
//                           child: const Image(
//                             image: AssetImage('assets/images/olai1.png'),
//                             width: 80.0,
//                             height: 80.0,
//                           ),
//                         ),
//                         const Padding(
//                           padding: EdgeInsets.all(2.0),
//                         ),
//                         const Text(
//                           "For you",
//                           style: TextStyle(
//                             color: Colors.red,
//                             fontSize: 15.0,
//                           ),
//                         ),
//                         const Text(
//                           "Count-555",
//                           style: TextStyle(
//                               color: Color(0xff202124), fontSize: 15.0),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       top: 15.00, bottom: 10.00, left: 15, right: 5),
//                   child: InkWell(
//                     onTap: () async {
//                       Get.toNamed(thirukkuralroute);
//                     },
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Container(
//                           decoration: const BoxDecoration(
//                               border: Border(
//                                 top: BorderSide(
//                                     width: 0.5, color: Color(0xA6865566)),
//                                 left: BorderSide(
//                                     width: 0.5, color: Color(0xF6865566)),
//                                 right: BorderSide(
//                                     width: 0.5, color: Color(0xF6865566)),
//                                 bottom: BorderSide(
//                                     width: 1.5, color: Color(0x25562325)),
//                               ),
//                               color: Colors.white,
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.indigo,
//                                   blurRadius: 2,
//                                   spreadRadius: 0.5,
//                                   offset: Offset(1, 1),
//                                 )
//                               ]),
//                           child: const Image(
//                             image: AssetImage('assets/images/olai2.png'),
//                             width: 80.0,
//                             height: 80.0,
//                           ),
//                         ),
//                         const Padding(
//                           padding: EdgeInsets.all(2.0),
//                         ),
//                         const Text(
//                           "For you",
//                           style: TextStyle(
//                             color: Colors.red,fontSize: 15.0,
//                           ),
//                         ),
//                         const Text(
//                           "Count-555",
//                           style: TextStyle(
//                               color: Color(0xff202124), fontSize: 15.0),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       )),
//     ),
//     const SizedBox(
//       height: 18,
//     ),
//     Expanded(
//       child: Container(
//         height: 80.0,
//         width: 345.0,
//         color: Colors.transparent,
//         child: Container(
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 border: Border.all(
//                   color: Colors.red[500],
//                   width: 3,
//                 ),
//                 borderRadius:
//                     const BorderRadius.all(Radius.circular(18.0))),
//             child: ListView(
//               children: [
//                 const Center(
//                   heightFactor: 1,
//                   child: Text(
//                     'Quote',
//                     style: TextStyle(
//                       color: Color(0xFFE65100),
//                       fontSize: 20,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Container(
//                     height: 1.8,
//                     width: 345.0,
//                     color: Colors.green,
//                   ),
//                 ),
//                 Center(
//                   child: Padding(
//                     padding: const EdgeInsets.only(
//                       top: 8.0,
//                       left: 20,
//                       right: 10,
//                       bottom: 8,
//                     ),
//                     child: Text(
//                       "'$quote'",
//                       style: const TextStyle(
//                         color: Colors.indigo,
//                         fontSize: 15,
//                       ),
//                       textAlign: TextAlign.left,
//                     ),
//                   ),
//                 ),
//               ],
//             )),
//       ),
//     ),
//     const SizedBox(
//       height: 10,
//     ),
//     Container(
//       height: 180.0,
//       width: 345.0,
//       color: Colors.transparent,
//       child: Container(
//           decoration: BoxDecoration(
//               color: Colors.white,
//               border: Border.all(
//                 color: Colors.cyan,
//                 width: 2,
//               ),
//               borderRadius:
//                   const BorderRadius.all(Radius.circular(18.0))),
//           child: ListView(
//             children: [
//               const Padding(
//                 padding: EdgeInsets.only(
//                   top: 5,
//                   bottom: 1,
//                   left: 15,
//                 ),
//                 child: Text(
//                   'Recents',
//                   style: TextStyle(
//                     color: Color(0xFFE65100),
//                     fontSize: 20,
//                   ),
//                   textAlign: TextAlign.left,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: Container(
//                   height: 1.8,
//                   width: 345.0,
//                   color: Colors.orange,
//                 ),
//               ),
//               Center(
//                 child: Padding(
//                   padding: const EdgeInsets.only(
//                     top: 8.0,
//                     left: 20,
//                     right: 10,
//                     bottom: 8.0,
//                   ),
//                   child: Text(
//                     "'$quote'",
//                     style: const TextStyle(
//                       color: Colors.indigo,
//                       fontSize: 15,
//                     ),
//                     textAlign: TextAlign.left,
//                   ),
//                 ),
//               ),
//             ],
//           )),
//     ),
//     const SizedBox(
//       height: 10,
//     )
//   ],
// ),
