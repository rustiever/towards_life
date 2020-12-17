// To parse this JSON data, do
//
//     final kural = kuralFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

Kural kuralFromJson(String str) =>
    Kural.fromJson(json.decode(str) as Map<String, dynamic>);

String kuralToJson(Kural data) => json.encode(data.toJson());

class Kural {
  Kural({
    @required this.couplet,
    @required this.line1,
    @required this.line2,
    @required this.number,
    @required this.translation,
    @required this.transliteration,
    @required this.explanation,
  });

  String couplet;
  String line1;
  String line2;
  int number;
  List<Ation> translation;
  List<Ation> transliteration;
  List<Explanation> explanation;

  factory Kural.fromJson(Map<String, dynamic> json) => Kural(
        couplet: json["couplet"] == null ? null : json["couplet"] as String,
        line1: json["line1"] == null ? null : json["line1"] as String,
        line2: json["line2"] == null ? null : json["line2"] as String,
        number: json["number"] == null ? null : json["number"] as int,
        translation: json["translation"] == null
            ? null
            : List<Ation>.from(
                json["translation"].map(
                  (x) => Ation.fromJson(x as Map<String, dynamic>),
                ) as Iterable<Ation>,
              ),
        transliteration: json["transliteration"] == null
            ? null
            : List<Ation>.from(
                json["transliteration"].map(
                  (x) => Ation.fromJson(x as Map<String, dynamic>),
                ) as Iterable<Ation>,
              ),
        explanation: json["explanation"] == null
            ? null
            : List<Explanation>.from(
                json["explanation"].map(
                  (x) => Explanation.fromJson(x as Map<String, dynamic>),
                ) as Iterable<Explanation>,
              ),
      );

  Map<String, dynamic> toJson() => {
        "couplet": couplet,
        "line1": line1,
        "line2": line2,
        "number": number,
        "translation": translation == null
            ? null
            : List<dynamic>.from(translation.map((x) => x.toJson())),
        "transliteration": transliteration == null
            ? null
            : List<dynamic>.from(transliteration.map((x) => x.toJson())),
        "explanation": explanation == null
            ? null
            : List<dynamic>.from(explanation.map((x) => x.toJson())),
      };
}

class Explanation {
  Explanation({
    @required this.language,
  });

  Language language;

  factory Explanation.fromJson(Map<String, dynamic> json) => Explanation(
        language: json["language"] == null
            ? null
            : Language.fromJson(json["language"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "language": language,
      };
}

class Language {
  Language({
    @required this.author,
    @required this.content,
  });

  String author;
  String content;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        author: json["author"] == null ? null : json["author"] as String,
        content: json["content"] == null ? null : json["content"] as String,
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "content": content,
      };
}

class Ation {
  Ation({
    @required this.language,
    @required this.content,
  });

  String language;
  String content;

  factory Ation.fromJson(Map<String, dynamic> json) => Ation(
        language: json["language"] == null ? null : json["language"] as String,
        content: json["content"] == null ? null : json["content"] as String,
      );

  Map<String, dynamic> toJson() => {
        "language": language,
        "content": content,
      };
}
