import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class AthisudiModel {
  List<Athisudi> athisudi;
  AthisudiModel({
    this.athisudi,
  });

  AthisudiModel.fromDocumentSnapshot(List<DocumentSnapshot> json) {
    if (json != null) {
      athisudi = new List<Athisudi>();
      json.forEach((element) {
        athisudi.add(Athisudi.fromMap(element.data()));
      });
    }
  }
}

class Athisudi {
  Athisudi({
    @required this.number,
    @required this.poem,
    @required this.meaning,
    @required this.paraphrase,
    @required this.translation,
  });

  int number;
  String poem;
  String meaning;
  String paraphrase;
  String translation;

  factory Athisudi.fromMap(Map<String, dynamic> json) => Athisudi(
        number: json["number"] == null ? null : json["number"],
        poem: json["poem"] == null ? null : json["poem"],
        meaning: json["meaning"] == null ? null : json["meaning"],
        paraphrase: json["paraphrase"] == null ? null : json["paraphrase"],
        translation: json["translation"] == null ? null : json["translation"],
      );
}

class LordCompliment {
  LordCompliment({
    @required this.line1,
    @required this.line2,
    @required this.meaning,
    @required this.paraphase,
  });

  String line1;
  String line2;
  String meaning;
  String paraphase;

  factory LordCompliment.fromMap(Map<String, dynamic> json) => LordCompliment(
        line1: json["line1"] == null ? null : json["line1"],
        line2: json["line2"] == null ? null : json["line2"],
        meaning: json["meaning"] == null ? null : json["meaning"],
        paraphase: json["paraphase"] == null ? null : json["paraphase"],
      );
}
