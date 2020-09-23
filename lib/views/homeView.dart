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
        Card(
          color: Colors.lime,
          child: InkWell(
            splashColor: Colors.indigo,
            onTap: () async {
              Get.toNamed(Thirukkuralroute);
            },
            child: Row(children: [
              Container(
                height: 100,
                width: 120,
                child: Image.asset('assets/images/thiruvalluvar.png'),
              ),
              Container(
                  margin: EdgeInsets.all(8),
                  height: 100,
                  width: 225,
                  child: Column(children: [
                    Text(
                      'Thirukkurals',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Open Sans',
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: Text(
                        'Thirukkurals of Tamil.Totally 1330 Kurals were there.',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ])),
            ]),
          ),
        ),
        Card(
          color: Colors.lime,
          child: InkWell(
            splashColor: Colors.indigo,
            onTap: () async {
              Get.toNamed(Thirukkuralroute);
            },
            child: Row(children: [
              Container(
                height: 100,
                width: 120,
                child: Image.asset('assets/images/thiruvalluvar.png'),
                // child: Image(image:  AssetImage('assets/images/avvaiyar.png'),),
              ),
              Container(
                  margin: EdgeInsets.all(8),
                  height: 100,
                  width: 225,
                  child: Column(children: [
                    Text(
                      'Thirukkurals',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Open Sans',
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: Text(
                        'Aathichudis of Tamil.Totally 109 were there.',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ])),
            ]),
          ),
        ),
        Card(
          color: Colors.lime,
          child: InkWell(
            splashColor: Colors.indigo,
            onTap: () async {
              Get.toNamed(Thirukkuralroute);
            },
            child: Row(children: [
              Container(
                height: 100,
                width: 120,
                child: Image.asset('assets/images/thiruvalluvar.png'),
              ),
              Container(
                  margin: EdgeInsets.all(8),
                  height: 100,
                  width: 225,
                  child: Column(children: [
                    Text(
                      'Palamuligaz',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Open Sans',
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: Text(
                        'Proverbs of Tamil.Totally 5 proverbs were there.',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ])),
            ]),
          ),
        ),
        
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
      ]),

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
