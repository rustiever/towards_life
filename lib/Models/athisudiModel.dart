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
        number: json["number"] as int,
        poem: json["poem"] as String,
        meaning: json["meaning"] as String,
        paraphrase: json["paraphrase"] as String,
        translation: json["translation"] as String,
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
        line1: json["line1"] as String,
        line2: json["line2"] as String,
        meaning: json["meaning"] as String,
        paraphase: json["paraphase"] as String,
      );
}
