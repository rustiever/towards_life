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
  List<Translation> translation;
  List<Transliteration> transliteration;
  List<Explanation> explanation;

  factory Kural.fromJson(Map<String, dynamic> json) => Kural(
        couplet: json["couplet"] == null ? null : json["couplet"] as String,
        line1: json["line1"] == null ? null : json["line1"] as String,
        line2: json["line2"] == null ? null : json["line2"] as String,
        number: json["number"] == null ? null : json["number"] as int,
        translation: json["translation"] == null
            ? null
            : List<Translation>.from(
                json["translation"].map(
                  (x) => Translation.fromJson(x as Map<String, dynamic>),
                ) as Iterable,
              ),
        transliteration: json["transliteration"] == null
            ? null
            : List<Transliteration>.from(
                json["transliteration"].map(
                  (x) => Transliteration.fromJson(x as Map<String, dynamic>),
                ) as Iterable,
              ),
        explanation: json["explanation"] == null
            ? null
            : List<Explanation>.from(
                json["explanation"].map(
                  (x) => Explanation.fromJson(x as Map<String, dynamic>),
                ) as Iterable,
              ),
      );

  Map<String, dynamic> toJson() => {
        "couplet": couplet,
        "line1": line1,
        "line2": line2,
        "number": number,
        "translation": translation == null
            ? null
            : List<dynamic>.from(
                translation.map(
                  (x) => x.toJson(),
                ),
              ),
        "transliteration": transliteration == null
            ? null
            : List<dynamic>.from(
                transliteration.map(
                  (x) => x.toJson(),
                ),
              ),
        "explanation": explanation == null
            ? null
            : List<dynamic>.from(
                explanation.map(
                  (x) => x.toJson(),
                ),
              ),
      };
}

class Explanation {
  Explanation({
    @required this.languageName,
    @required this.details,
  });

  String languageName;
  List<Detail> details;

  factory Explanation.fromJson(Map<String, dynamic> json) => Explanation(
        languageName: json["languageName"] == null
            ? null
            : json["languageName"] as String,
        details: json["details"] == null
            ? null
            : List<Detail>.from(
                json["details"].map(
                  (x) => Detail.fromJson(x as Map<String, dynamic>),
                ) as Iterable,
              ),
      );

  Map<String, dynamic> toJson() => {
        "languageName": languageName,
        "details": details == null
            ? null
            : List<dynamic>.from(
                details.map(
                  (x) => x.toJson(),
                ),
              ),
      };
}

class Detail {
  Detail({
    @required this.author,
    @required this.content,
  });

  String author;
  String content;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        author: json["author"] == null ? null : json["author"] as String,
        content: json["content"] == null ? null : json["content"] as String,
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "content": content,
      };
}

class Translation {
  Translation({
    @required this.language,
    @required this.content,
  });

  String language;
  String content;

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        language: json["language"] == null ? null : json["language"] as String,
        content: json["content"] == null ? null : json["content"] as String,
      );

  Map<String, dynamic> toJson() => {
        "language": language,
        "content": content,
      };
}

class Transliteration {
  Transliteration({
    @required this.language,
    @required this.content,
  });

  String language;
  Content content;

  factory Transliteration.fromJson(Map<String, dynamic> json) =>
      Transliteration(
        language: json["language"] == null ? null : json["language"] as String,
        content: json["content"] == null
            ? null
            : Content.fromJson(json["content"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "language": language,
        "content": content.toJson(),
      };
}

class Content {
  Content({
    @required this.line1,
    @required this.line2,
  });

  String line1;
  String line2;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        line1: json["line1"] == null ? null : json["line1"] as String,
        line2: json["line2"] == null ? null : json["line2"] as String,
      );

  Map<String, dynamic> toJson() => {
        "line1": line1,
        "line2": line2,
      };
}
