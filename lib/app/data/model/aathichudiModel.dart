// To parse this JSON data, do
//
//     final aathichudi = aathichudiFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

import 'models.dart';

Aathichudi aathichudiFromJson(String str) =>
    Aathichudi.fromJson(json.decode(str) as Map<String, dynamic>);

String aathichudiToJson(Aathichudi data) => json.encode(data.toJson());

class Aathichudi {
  Aathichudi({
    @required this.number,
    @required this.poem,
    @required this.meaning,
    @required this.paraphrase,
    @required this.translations,
  });

  final int number;
  final String poem;
  final String meaning;
  final String paraphrase;
  final List<Translation> translations;

  factory Aathichudi.fromJson(Map<String, dynamic> json) => Aathichudi(
        number: json["number"] as int,
        poem: json["poem"] as String,
        meaning: json["meaning"] as String,
        paraphrase: json["paraphrase"] as String,
        translations: List<Translation>.from(
          json["translations"].map(
            (x) => Translation.fromJson(x as Map<String, dynamic>),
          ) as Iterable,
        ),
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "poem": poem,
        "meaning": meaning,
        "paraphrase": paraphrase,
        "translations": List<dynamic>.from(translations.map((x) => x.toJson())),
      };
}

class LordCompliment {
  LordCompliment({
    @required this.line1,
    @required this.line2,
    @required this.meaning,
    @required this.paraphase,
  });

  final String line1;
  final String line2;
  final String meaning;
  final String paraphase;

  factory LordCompliment.fromJson(Map<String, dynamic> json) => LordCompliment(
        line1: json["line1"] as String,
        line2: json["line2"] as String,
        meaning: json["meaning"] as String,
        paraphase: json["paraphase"] as String,
      );

  Map<String, dynamic> toJson() => {
        "line1": line1,
        "line2": line2,
        "meaning": meaning,
        "paraphase": paraphase,
      };
}
