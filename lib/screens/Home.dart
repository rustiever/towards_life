import 'package:TowardsLife/Models/Kurals.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController _controller = ScrollController();
  final CollectionReference t = Firestore.instance.collection('ThirukKural');
  Kural kural;
  var kurals;
  bool shuffle = false, isLoading = true, isPlaying = false;
  int limit = 10;

  bool moreAvail = true, isMoreLoading = false;

  @override
  void initState() {
    _controller.addListener(
      () {
        if (_controller.position.pixels ==
            _controller.position.maxScrollExtent) {
          print('no');
          fetchMoreKurals();
        }
      },
    );
    super.initState();
    fetchKurals();
  }

  List<DocumentSnapshot> krls = [];
  DocumentSnapshot last;
  fetchKurals() async {
    Query query = t.orderBy('number').limit(limit);

    QuerySnapshot snapshot = await query.getDocuments();

    krls = snapshot.documents;
    last = snapshot.documents[krls.length - 1];

    kural = Kural.fromJson(krls);

    setState(() {
      isLoading = false;
    });
  }

  fetchMoreKurals() async {
    print('fetch more');
    if (moreAvail == false) {
      print('no kurals');
      return;
    }

    setState(() {
      isMoreLoading = true;
    });
    Query query =
        t.orderBy('number').startAfter([last.data['number']]).limit(limit);

    print(last.data['number']);

    QuerySnapshot snapshot = await query.getDocuments();

    krls.addAll(snapshot.documents);
    kural = Kural.fromJson(krls);

    if (snapshot.documents.length >= limit)
      last = snapshot.documents[snapshot.documents.length - 1];
    else
      moreAvail = false;

    setState(() {
      isMoreLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.cyanAccent,
        appBar: AppBar(
          primary: true,
          leading: FlutterLogo(size: 100),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.elliptical(50, 45),
            ),
          ),
          title: Text('Towards Life'),
          // centerTitle: true,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: null),
            IconButton(
              icon: Icon(Icons.shuffle),
              onPressed: () => setState(() => shuffle = true),
            )
          ],
        ),
        body: isLoading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      controller: _controller,
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 20),
                      itemBuilder: (BuildContext context, int index) {
                        // Kural kural = Kural.fromJson(krls);
                        kurals = kural.kurals;
                        if (shuffle) {
                          kurals.shuffle();
                          shuffle = false;
                        } //else
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            side: BorderSide(
                              width: 2,
                              color: Colors.cyan.withOpacity(0.8),
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 30,
                                child: ListView(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, top: 10),
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  children: <Widget>[
                                    Text(
                                      kural.kurals[index].chapter,
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.purple),
                                    ),
                                    Container(
                                      // margin: EdgeInsets.only(bottom: 10),
                                      height: 20,
                                      child: VerticalDivider(
                                        color: Colors.redAccent[400],
                                        // thickness: 2,
                                      ),
                                    ),
                                    Text(
                                      kural.kurals[index].section,
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.purple),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 10,
                                color: Colors.orange,
                              ),
                              ListTile(
                                trailing: IconButton(
                                  alignment: Alignment.center,
                                  icon: isPlaying == false
                                      ? Icon(Icons.play_circle_filled)
                                      : Icon(Icons.stop),
                                  onPressed: () =>
                                      setState(() => isPlaying = !isPlaying),
                                ),
                                // isThreeLine: true,
                                contentPadding: EdgeInsets.only(
                                  bottom: 20,
                                  left: 15,
                                ),
                                title: Text(
                                  kural.kurals[index].kural[0],
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.indigoAccent),
                                ),
                                subtitle: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                    kural.kurals[index].kural[1] +
                                        ' [' +
                                        kural.kurals[index].number.toString() +
                                        ']',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.indigo),
                                  ),
                                ),
                              ),
                              // Row(
                              //   children: <Widget>[
                              //     IconButton(
                              //       icon: Icon(Icons.shuffle),
                              //       onPressed: () => setState(() => shuffle = true),
                              //     ),
                              //   ],
                              // )
                            ],
                          ),
                        );
                      },
                      itemCount: kural.kurals.length,
                      // separatorBuilder: (BuildContext context, int index) {
                      //   // return Divider(
                      //   //   indent: 20,
                      //   //   endIndent: 20,
                      //   //   thickness: 1,
                      //   // );
                      //   return Container();
                      // },
                    ),
                  ),
                  isMoreLoading ? CircularProgressIndicator() : Container()
                ],
              ),
      ),
    );
  }
}
