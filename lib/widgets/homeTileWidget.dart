import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTileWidget extends StatelessWidget {
  final String routeName;
  final String tileName;
  final String assetName;

  const HomeTileWidget({
    @required this.routeName,
    @required this.tileName,
    @required this.assetName,
  }) : super();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenRatio = screenWidth / screenHeight;

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.025),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
            Get.toNamed(routeName);
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image(
                  image: AssetImage(assetName),
                  width: screenWidth * 0.35,
                  height: screenHeight * 0.14,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5.0,
                ),
                child: Container(
                  height: 0.5 + (screenHeight / 640),
                  width: screenWidth * 0.4,
                  color: Colors.redAccent,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  tileName,
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
    );
  }
}
