import 'package:flutter/material.dart';
import 'package:matrix4_transform/matrix4_transform.dart';

class FirstLayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF4c41a3), Color(0xFF1f186f)],
        ),
      ),
    );
  }
}

class ThirdLayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FlutterLogo(
                      size: MediaQuery.of(context).size.width / 4,
                    ),
                    Row(
                      children: [
                        const Text(
                          "FLUTTER",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "HOLIC",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.blue[200],
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Home Screen",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                ),
                // const Text(
                //   "Screen 2",
                //   style: TextStyle(
                //     color: Colors.white,
                //   ),
                // ),
                // const Padding(
                //   padding: EdgeInsets.only(bottom: 20),
                // ),
                // Divider(
                //   color: Color(0xFF5950a0),
                //   thickness: 2,
                // ),
                // Padding(
                //   padding: EdgeInsets.only(bottom: 20),
                // ),
                // Text(
                //   "About",
                //   style: TextStyle(
                //     color: Colors.white,
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.only(bottom: 20),
                // ),
                // Text(
                //   "Share App",
                //   style: TextStyle(
                //     color: Colors.white,
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.only(bottom: 20),
                // ),
                // Divider(
                //   color: Color(0xFF5950a0),
                //   thickness: 2,
                // ),
                // Padding(
                //   padding: EdgeInsets.only(bottom: 20),
                // ),
                // Text(
                //   "Bye",
                //   style: TextStyle(
                //     color: Colors.white,
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.only(bottom: 10),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

SecondLayerState secondLayerState;

class SecondLayer extends StatefulWidget {
  @override
  SecondLayerState createState() => SecondLayerState();

  // openTab() => createState().openTab();
}

class SecondLayerState extends State<SecondLayer> {
  double xoffSet = 0;
  double yoffSet = 0;
  double angle = 0;

  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    secondLayerState = this;
    return AnimatedContainer(
      transform: Matrix4Transform()
          .translate(x: xoffSet, y: yoffSet)
          .rotate(angle)
          .matrix4,
      duration: Duration(milliseconds: 500),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF4c41a3),
      ),
    );
  }
}
