import 'package:cloud_firestore/cloud_firestore.dart';

class Kural {
  List<Kurals> kurals;

  Kural({
    this.kurals,
  });

  Kural.fromJson(List<DocumentSnapshot> json) {
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
    chapter = json['chapter'];
    kural = json['kural'].cast<String>();
    number = json['number'];
    section = json['section'];
    meaning =
        json['meaning'] != null ? new Meaning.fromJson(json['meaning']) : null;
    isPlaying = false;
  }
}

class Meaning {
  String taMuVa;
  String taSalamon;
  String en;

  Meaning({this.taMuVa, this.taSalamon, this.en});

  Meaning.fromJson(Map<String, dynamic> json) {
    taMuVa = json['ta_mu_va'];
    taSalamon = json['ta_salamon'];
    en = json['en'];
  }
}
