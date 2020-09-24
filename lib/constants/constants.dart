import 'package:cloud_firestore/cloud_firestore.dart';

//firebase collections
final thirukkuralCollection =
    FirebaseFirestore.instance.collection('ThirukKural');
final aathichoodiCollection =
    FirebaseFirestore.instance.collection('Aathichoodi');

enum Type { kural, choodi, proverbs }
