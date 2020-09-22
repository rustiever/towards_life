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
      body: ListView(padding: const EdgeInsets.all(10.0), children: [
        InkWell(
          splashColor: Colors.indigo,
          hoverColor: Colors.blueAccent,
          onTap: () {
            //Todo
          },
          child: Row(children: [
            Container(
              height: 125,
              width: 125,
              child: Icon(
                Icons.star,
                color: Colors.red[500],
              ),
            ),
            Container(
              color: Colors.orangeAccent,
              height: 125,
              width: 500,
              child: Icon(
                Icons.star,
                color: Colors.red[500],
              ),
            ),
          ]),
        ),
        InkWell(
          splashColor: Colors.indigo,
         hoverColor: Colors.red,
          onTap: () async {
            Get.toNamed(Thirukkuralroute);
          },
          child: Row(children: [
            Container(
              color: Colors.blueAccent,
              height: 125,
              width : 125,
              child: Card(

                child: Text('Aathichudi'),
              ),
            ),
          ]
          ),
        ),
        InkWell(
          splashColor: Colors.indigo,
         hoverColor: Colors.red,
          onTap: () async {
            Get.toNamed(Thirukkuralroute);
          },
          child: Row(children: [
            Container(
              height: 125,
              width : 125,
              child: Card(
                child: Text('Proverb'),
              ),
            ),
          ]
          ),
        ),
      ]),
      // body: ListView(
      //   padding: const EdgeInsets.all(10.0),
      //     // shrinkWrap: true,
      //     children: [
      //       Material(
      //         color: Colors.grey[800],
      //         child: Row(
      //           children: [
                  // InkWell(
                  //   hoverColor: Colors.black,
                  //     splashColor: Colors.indigo,
                  //     onTap: () async {
                  //       Get.toNamed(Thirukkuralroute);
                  //     },
                  //     child: Container(
                  //       height: 125,
                  //       child: Card(
                  //         child: Text('Thirukkral'),
                  //       ),
                  //     ),
                  //   ),
                    // child: Ink.image(
                    //   image: AssetImage('assets/icon/t1.png'),
                    //   fit: BoxFit.cover,
                    //   // width: 300.0,
                    //   height: 125.0,
                    //   child: InkWell(
                    //       onTap: () async{
                    //         Get.toNamed(Thirukkuralroute);
                    //       },
                    //       child: Align(
                    //         alignment: Alignment.topLeft,
                    //         child: Padding(
                    //           padding: const EdgeInsets.all(10.0),
                    //           child: Text('KITTEN',
                    //               style: TextStyle(
                    //                   fontWeight: FontWeight.w900,
                    //                   color: Colors.white)),
                    //         ),
                    //       )),
                    // ),
                  
            //     ],
            //   ),
            // // ),
            // InkWell(
            //   splashColor: Colors.indigo,
            //   onTap: () async {
            //     Get.toNamed(Thirukkuralroute);
            //   },
            //   child: Container(
            //     height: 125,
            //     child: Card(
            //       child: Text('Thirukkral'),
            //     ),
            //   ),
            // ),
            // InkWell(
          //     splashColor: Colors.indigo,
          //     onTap: () async {
          //       Get.toNamed(Thirukkuralroute);
          //     },
          //     child: Container(
          //       height: 125,
          //       child: Card(
          //         child: Text('Aathichudi'),
          //       ),
          //     ),
          //   ),
          //   InkWell(
          //     splashColor: Colors.indigo,
          //     onTap: () async {
          //       Get.toNamed(Thirukkuralroute);
          //     },
          //     child: Container(
          //       height: 125,
          //       child: Card(
          //         child: Text('Proverb'),
          //       ),
          //     ),
          //   ),
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
    );
  }
}
