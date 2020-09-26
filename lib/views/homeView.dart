import 'package:TowardsLife/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TOWARDS LIFE'),
        titleSpacing: 20,
      ),
      body: Column(
        children: [
          // Container(
          //   decoration: const BoxDecoration(
          //     color: Colors.amber,
          //   ),
          //   height: 60,
          //   child: const Padding(
          //     padding: EdgeInsets.only(
          //         left: 0.1,right: 0.1, top: 10.0, bottom: 10.0),
          //     child: Text(
          //       "Welcome to Towards Life",
          //       style: TextStyle(color: Colors.red, fontSize: 20.0),
          //     ),
          //   ),
          // ),
          Container(
            decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 0.5, color: Color(0xA6865566)),
                  left: BorderSide(width: 0.5, color: Color(0xF6865566)),
                  right: BorderSide(width: 0.5, color: Color(0xF6865566)),
                  bottom: BorderSide(width: 1.5, color: Color(0x25562325)),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 7,
                      spreadRadius: 0.5,
                      offset: Offset(0, 3))
                ]),
            height: 180,
            child: InkWell(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
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
                            Get.toNamed(thirukkuralroute);
                          },
                          // child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
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
                          // ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.00, bottom: 15.00, left: 15, right: 5),
                        child: InkWell(
                          onTap: () async {
                            Get.toNamed(thirukkuralroute);
                          },
                          // child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Image(
                                image: AssetImage('assets/images/avvaiyar.png'),
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
                          // ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.00, bottom: 15.00, left: 15, right: 5),
                        child: InkWell(
                          onTap: () async {
                            Get.toNamed(thirukkuralroute);
                          },
                          // child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Image(
                                image: AssetImage('assets/images/portrait.jpg'),
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
                          // ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.00, bottom: 15.00, left: 15, right: 5),
                        child: InkWell(
                          onTap: () async {
                            Get.toNamed(thirukkuralroute);
                          },
                          // child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
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
                          // ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.00, bottom: 15.00, left: 15, right: 5),
                        child: InkWell(
                          onTap: () async {
                            Get.toNamed(thirukkuralroute);
                          },
                          // child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
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
                          // ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
          ),
          const SizedBox(
            height: 18,
          ),
          Center(
            child: Container(
              width: 350,
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 1.0),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 0.5, color: Color(0xA6865566)),
                  left: BorderSide(width: 0.5, color: Color(0xF6865566)),
                  right: BorderSide(width: 0.5, color: Color(0xF6865566)),
                  bottom: BorderSide(width: 1.5, color: Color(0x25562325)),
                ),
                color: Colors.amber,
              ),
              child: const Padding(
                padding: EdgeInsets.only(
                    top: 20.00, bottom: 82.00, left: 75, right: 5),
                // child: Container(
                child: Text('Quotes Will Come Here'),
                // ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Center(
            child: Container(
              width: 350,
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 85.0),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 0.5, color: Color(0xA6865566)),
                  left: BorderSide(width: 0.5, color: Color(0xF6865566)),
                  right: BorderSide(width: 0.5, color: Color(0xF6865566)),
                  bottom: BorderSide(width: 1.5, color: Color(0x25562325)),
                ),
                color: Colors.amber,
              ),
              child: const Text('Recent Things Come Here...'),
            ),
          ),
        ],
      ),
    );
  }
}
