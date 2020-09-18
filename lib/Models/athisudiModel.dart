// To parse this JSON data, do
//
//     final athisudiModel = athisudiModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class AthisudiModel {
  AthisudiModel({
    @required this.lordCompliment,
    @required this.athisudi,
  });

  LordCompliment lordCompliment;
  List<Athisudi> athisudi;

  factory AthisudiModel.fromJson(String str) =>
      AthisudiModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AthisudiModel.fromMap(Map<String, dynamic> json) => AthisudiModel(
        lordCompliment: json["lord_compliment"] == null
            ? null
            : LordCompliment.fromMap(json["lord_compliment"]),
        athisudi: json["athisudi"] == null
            ? null
            : List<Athisudi>.from(
                json["athisudi"].map((x) => Athisudi.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "lord_compliment":
            lordCompliment == null ? null : lordCompliment.toMap(),
        "athisudi": athisudi == null
            ? null
            : List<dynamic>.from(athisudi.map((x) => x.toMap())),
      };
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

  factory Athisudi.fromJson(String str) => Athisudi.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Athisudi.fromMap(Map<String, dynamic> json) => Athisudi(
        number: json["number"] == null ? null : json["number"],
        poem: json["poem"] == null ? null : json["poem"],
        meaning: json["meaning"] == null ? null : json["meaning"],
        paraphrase: json["paraphrase"] == null ? null : json["paraphrase"],
        translation: json["translation"] == null ? null : json["translation"],
      );

  Map<String, dynamic> toMap() => {
        "number": number == null ? null : number,
        "poem": poem == null ? null : poem,
        "meaning": meaning == null ? null : meaning,
        "paraphrase": paraphrase == null ? null : paraphrase,
        "translation": translation == null ? null : translation,
      };
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

  factory LordCompliment.fromJson(String str) =>
      LordCompliment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LordCompliment.fromMap(Map<String, dynamic> json) => LordCompliment(
        line1: json["line1"] == null ? null : json["line1"],
        line2: json["line2"] == null ? null : json["line2"],
        meaning: json["meaning"] == null ? null : json["meaning"],
        paraphase: json["paraphase"] == null ? null : json["paraphase"],
      );

  Map<String, dynamic> toMap() => {
        "line1": line1 == null ? null : line1,
        "line2": line2 == null ? null : line2,
        "meaning": meaning == null ? null : meaning,
        "paraphase": paraphase == null ? null : paraphase,
      };
}
