import 'package:cloud_firestore/cloud_firestore.dart';

class Kural {
  List<Kurals> kurals;

  Kural({
    this.kurals,
  });

  Kural.fromDocumentSnapshot(List<DocumentSnapshot> json) {
    if (json != null) {
      kurals = new List<Kurals>();
      json.forEach((v) {
        kurals.add(new Kurals.fromJson(v.data()));
      });
    }
  }
}

class Kurals {
  String chapter;
  List<String> kural;
  int number;
  String section;
  Meaning meaning;
  bool isPlaying;

  Kurals(
      {this.chapter,
      this.kural,
      this.number,
      this.section,
      this.meaning,
      this.isPlaying});

  Kurals.fromJson(Map<String, dynamic> json) {
    chapter = json['chapter'] as String;
    kural = json['kural'].cast<String>() as List<String>;
    number = json['number'] as int;
    section = json['section'] as String;
    meaning = Meaning.fromJson(json['meaning'] as Map<String, dynamic>);
    isPlaying = false;
  }
}

class Meaning {
  String taMuVa;
  String taSalamon;
  String en;

  Meaning({this.taMuVa, this.taSalamon, this.en});

  Meaning.fromJson(Map<String, dynamic> json) {
    taMuVa = json['ta_mu_va'] as String;
    taSalamon = json['ta_salamon'] as String;
    en = json['en'] as String;
  }
}
