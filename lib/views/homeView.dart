import 'package:TowardsLife/routes.dart';
import 'package:TowardsLife/widgets/homeTileWidget.dart';
import 'package:TowardsLife/widgets/homeWidget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenRatio = screenWidth / screenHeight;

    return Scaffold(
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
                      children: const [
                        HomeTileWidget(
                          routeName: thirukkuralroute,
                          tileName: 'Thirukkural',
                          assetName: 'assets/images/ppp.png',
                        ),
                        HomeTileWidget(
                          routeName: athichoodiroute,
                          tileName: 'Aathichudi',
                          assetName: 'assets/images/avvaiyar.png',
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        HomeTileWidget(
                          routeName: thirukkuralroute,
                          tileName: 'Palamuzhigal',
                          assetName: 'assets/images/olai3.png',
                        ),
                        HomeTileWidget(
                          routeName: athichoodiroute,
                          tileName: 'Others',
                          assetName: 'assets/images/portrait.jpg',
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        HomeTileWidget(
                          routeName: thirukkuralroute,
                          tileName: 'Others',
                          assetName: 'assets/images/ppp.png',
                        ),
                        HomeTileWidget(
                          routeName: athichoodiroute,
                          tileName: 'Others',
                          assetName: 'assets/images/ppp.png',
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        HomeTileWidget(
                          routeName: thirukkuralroute,
                          tileName: 'Others',
                          assetName: 'assets/images/ppp.png',
                        ),
                        HomeTileWidget(
                          routeName: athichoodiroute,
                          tileName: 'Others',
                          assetName: 'assets/images/ppp.png',
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
