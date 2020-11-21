import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

//firebase collections
final thirukkuralCollection =
    FirebaseFirestore.instance.collection('ThirukKural');
final aathichoodiCollection =
    FirebaseFirestore.instance.collection('Aathichoodi');

enum Type { kural, choodi, proverbs }

List<Topic> topicList = [
  Topic(
      asset: 'assets/images/thiruvalluvar.png',
      length: 1330,
      name: 'Thirukkural'),
  Topic(asset: 'assets/images/avvaiyar.png', length: 130, name: 'Aathichudi'),
  Topic(
      asset: 'assets/images/thiruvalluvar.png',
      length: 1330,
      name: 'Thirukkural'),
];

class Topic {
  String asset, name;
  int length;
  Topic({
    @required this.asset,
    @required this.length,
    @required this.name,
  });
}
