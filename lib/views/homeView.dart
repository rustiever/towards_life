import 'package:TowardsLife/routes.dart';
import 'package:TowardsLife/widgets/homeWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenRatio = screenWidth / screenHeight;

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('TOWARDS LIFE'),
      //   titleSpacing: 20,
      //   backgroundColor: Colors.white,
      // ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: screenHeight * 0.28,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: WaveClipperTwo(),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xfff48f60),
                          Color(0xfff48f80),
                          Color(0xfff48fd5),
                        ],
                      ),
                    ),
                  ),
                ),
                ClipPath(
                  clipper: WaveClipperOne(),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xffdb494d),
                          Color(0xffdb443c),
                          Color(0xffdb343c),
                          Color(0xffdb243c),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.28 * 0.02,
                    left: screenWidth * 0.28 * 0.1,
                    right: screenWidth * 0.28 * 1,
                  ),
                  child: Text(
                    'TOWARDSLIFE',
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: (screenRatio * 16 * 25) / 9,
                      shadows: const <Shadow>[
                        Shadow(
                          offset: Offset(5.0, 5.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(155, 0, 50, 255),
                        ),
                        Shadow(
                          offset: Offset(5.0, 15.0),
                          blurRadius: 8.0,
                          color: Color.fromARGB(255, 100, 25, 255),
                        ),
                      ],
                    ),
                  ),
                ),
                ClipPath(
                  clipper: WaveClipperThree(),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xfff48f60),
                          Color(0xfff48f80),
                          Color(0xfff48fd5),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 2,
                  bottom: 2,
                  left: screenWidth * 0.025,
                  right: screenWidth * 0.025,
                ),
                child: ListView(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.025),
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              color: Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blueGrey,
                                  blurRadius: 7.5,
                                  spreadRadius: 0.05,
                                  offset: Offset(0, 3),
                                )
                              ],
                            ),
                            width: screenWidth * 0.42,
                            height: screenHeight * 1.8 / 7,
                            child: InkWell(
                              splashColor: Colors.blue[900],
                              onTap: () async {
                                Get.toNamed(thirukkuralroute);
                              },
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image(
                                      image: const AssetImage(
                                          'assets/images/ppp.png'),
                                      width: screenWidth * 0.35,
                                      height: screenHeight * 0.14,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    child: Container(
                                      height: 0.5 + (screenHeight / 640),
                                      width: screenWidth * 0.4,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      'Thirukkural',
                                      style: TextStyle(
                                        fontSize: (screenRatio * 16 * 17.5) / 9,
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
                          padding: EdgeInsets.all(screenWidth * 0.025),
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              color: Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blueGrey,
                                  blurRadius: 7.5,
                                  spreadRadius: 0.05,
                                  offset: Offset(0, 3),
                                )
                              ],
                            ),
                            width: screenWidth * 0.42,
                            height: screenHeight * 1.8 / 7,
                            child: InkWell(
                              splashColor: Colors.blue[900],
                              onTap: () async {
                                Get.toNamed(athichoodiroute);
                                // BUG => 43 chudi is null
                              },
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image(
                                      image: const AssetImage(
                                          'assets/images/avvaiyar.png'),
                                      width: screenWidth * 0.35,
                                      height: screenHeight * 0.14,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    child: Container(
                                      height: 0.5 + (screenHeight / 640),
                                      width: screenWidth * 0.4,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      'Aathichudi',
                                      style: TextStyle(
                                        fontSize: (screenRatio * 16 * 17.5) / 9,
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
                              padding: EdgeInsets.all(screenWidth * 0.025),
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  color: Color(0xffffffff),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blueGrey,
                                      blurRadius: 7.5,
                                      spreadRadius: 0.05,
                                      offset: Offset(0, 3),
                                    )
                                  ],
                                ),
                                width: screenWidth * 0.42,
                                height: screenHeight * 1.8 / 7,
                                child: InkWell(
                                  splashColor: Colors.blue[900],
                                  onTap: () async {
                                    Get.toNamed(thirukkuralroute);
                                  },
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Image(
                                          image: const AssetImage(
                                              'assets/images/olai3.png'),
                                          width: screenWidth * 0.35,
                                          height: screenHeight * 0.14,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: Container(
                                          height: 0.5 + (screenHeight / 640),
                                          width: screenWidth * 0.4,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          'Palamuzhigal',
                                          style: TextStyle(
                                            fontSize:
                                                (screenRatio * 16 * 17.5) / 9,
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
                              padding: EdgeInsets.all(screenWidth * 0.025),
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  color: Color(0xffffffff),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blueGrey,
                                      blurRadius: 7.5,
                                      spreadRadius: 0.05,
                                      offset: Offset(0, 3),
                                    )
                                  ],
                                ),
                                width: screenWidth * 0.42,
                                height: screenHeight * 1.8 / 7,
                                child: InkWell(
                                  splashColor: Colors.blue[900],
                                  onTap: () async {
                                    Get.toNamed(thirukkuralroute);
                                  },
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Image(
                                          image: const AssetImage(
                                              'assets/images/portrait.jpg'),
                                          width: screenWidth * 0.35,
                                          height: screenHeight * 0.14,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: Container(
                                          height: 0.5 + (screenHeight / 640),
                                          width: screenWidth * 0.4,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          'Others',
                                          style: TextStyle(
                                            fontSize:
                                                (screenRatio * 16 * 17.5) / 9,
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
                              padding: EdgeInsets.all(screenWidth * 0.025),
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  color: Color(0xffffffff),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blueGrey,
                                      blurRadius: 7.5,
                                      spreadRadius: 0.05,
                                      offset: Offset(0, 3),
                                    )
                                  ],
                                ),
                                width: screenWidth * 0.42,
                                height: screenHeight * 1.8 / 7,
                                child: InkWell(
                                  splashColor: Colors.blue[900],
                                  onTap: () async {
                                    Get.toNamed(thirukkuralroute);
                                  },
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Image(
                                          image: const AssetImage(
                                              'assets/images/ppp.png'),
                                          width: screenWidth * 0.35,
                                          height: screenHeight * 0.14,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: Container(
                                          height: 0.5 + (screenHeight / 640),
                                          width: screenWidth * 0.4,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          'Others',
                                          style: TextStyle(
                                            fontSize:
                                                (screenRatio * 16 * 17.5) / 9,
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
                              padding: EdgeInsets.all(screenWidth * 0.025),
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  color: Color(0xffffffff),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blueGrey,
                                      blurRadius: 7.5,
                                      spreadRadius: 0.05,
                                      offset: Offset(0, 3),
                                    )
                                  ],
                                ),
                                width: screenWidth * 0.42,
                                height: screenHeight * 1.8 / 7,
                                child: InkWell(
                                  splashColor: Colors.blue[900],
                                  onTap: () async {
                                    Get.toNamed(thirukkuralroute);
                                  },
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Image(
                                          image: const AssetImage(
                                              'assets/images/ppp.png'),
                                          width: screenWidth * 0.35,
                                          height: screenHeight * 0.14,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: Container(
                                          height: 0.5 + (screenHeight / 640),
                                          width: screenWidth * 0.4,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          'Others',
                                          style: TextStyle(
                                            fontSize:
                                                (screenRatio * 16 * 17.5) / 9,
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
          ),
        ],
      ),
    );
  }
}
