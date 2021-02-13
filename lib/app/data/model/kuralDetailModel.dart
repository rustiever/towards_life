// To parse this JSON data, do
//
//     final kuralDetail = kuralDetailFromJson(jsonString);

import 'dart:convert';
import 'package:meta/meta.dart';

List<KuralDetail> kuralDetailFromJson(String str) => List<KuralDetail>.from(
      json.decode(str).map(
            (x) => KuralDetail.fromJson(x as Map<String, dynamic>),
          ) as Iterable,
    );

String kuralDetailToJson(List<KuralDetail> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KuralDetail {
  KuralDetail({
    @required this.name,
    @required this.transliteration,
    @required this.translation,
    @required this.number,
    @required this.chapterGroup,
  });

  final String name;
  final String transliteration;
  final String translation;
  final int number;
  final ChapterGroup chapterGroup;

  factory KuralDetail.fromJson(Map<String, dynamic> json) => KuralDetail(
        name: json["name"] == null ? null : json["name"] as String,
        transliteration: json["transliteration"] == null
            ? null
            : json["transliteration"] as String,
        translation:
            json["translation"] == null ? null : json["translation"] as String,
        number: json["number"] == null ? null : json["number"] as int,
        chapterGroup: json["chapterGroup"] == null
            ? null
            : ChapterGroup.fromJson(
                json["chapterGroup"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "transliteration": transliteration,
        "translation": translation,
        "number": number,
        "chapterGroup": chapterGroup ?? chapterGroup.toJson(),
      };
}

class ChapterGroup {
  ChapterGroup({
    @required this.tamil,
    @required this.detail,
  });

  final String tamil;
  final List<ChapterGroupDetail> detail;

  factory ChapterGroup.fromJson(Map<String, dynamic> json) => ChapterGroup(
        tamil: json["tamil"] == null ? null : json["tamil"] as String,
        detail: json["detail"] == null
            ? null
            : List<ChapterGroupDetail>.from(
                json["detail"].map(
                  (x) => ChapterGroupDetail.fromJson(x as Map<String, dynamic>),
                ) as Iterable,
              ),
      );

  Map<String, dynamic> toJson() => {
        "tamil": tamil,
        "detail": detail == null
            ? null
            : List<dynamic>.from(
                detail.map(
                  (x) => x.toJson(),
                ),
              ),
      };
}

class ChapterGroupDetail {
  ChapterGroupDetail({
    @required this.name,
    @required this.transliteration,
    @required this.translation,
    @required this.number,
    @required this.chapters,
  });

  final String name;
  final String transliteration;
  final String translation;
  final int number;
  final Chapters chapters;

  factory ChapterGroupDetail.fromJson(Map<String, dynamic> json) =>
      ChapterGroupDetail(
        name: json["name"] == null ? null : json["name"] as String,
        transliteration: json["transliteration"] == null
            ? null
            : json["transliteration"] as String,
        translation:
            json["translation"] == null ? null : json["translation"] as String,
        number: json["number"] == null ? null : json["number"] as int,
        chapters: json["chapters"] == null
            ? null
            : Chapters.fromJson(json["chapters"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "transliteration": transliteration,
        "translation": translation,
        "number": number,
        "chapters": chapters ?? chapters.toJson(),
      };
}

class Chapters {
  Chapters({
    @required this.tamil,
    @required this.detail,
  });

  final String tamil;
  final List<ChaptersDetail> detail;

  factory Chapters.fromJson(Map<String, dynamic> json) => Chapters(
        tamil: json["tamil"] == null ? null : json["tamil"] as String,
        detail: json["detail"] == null
            ? null
            : List<ChaptersDetail>.from(
                json["detail"].map(
                  (x) => ChaptersDetail.fromJson(x as Map<String, dynamic>),
                ) as Iterable,
              ),
      );

  Map<String, dynamic> toJson() => {
        "tamil": tamil,
        "detail": detail == null
            ? null
            : List<dynamic>.from(
                detail.map(
                  (x) => x.toJson(),
                ),
              ),
      };
}

class ChaptersDetail {
  ChaptersDetail({
    @required this.name,
    @required this.translation,
    @required this.transliteration,
    @required this.number,
    @required this.start,
    @required this.end,
  });

  final String name;
  final String translation;
  final String transliteration;
  final int number;
  final int start;
  final int end;

  factory ChaptersDetail.fromJson(Map<String, dynamic> json) => ChaptersDetail(
        name: json["name"] == null ? null : json["name"] as String,
        translation:
            json["translation"] == null ? null : json["translation"] as String,
        transliteration: json["transliteration"] == null
            ? null
            : json["transliteration"] as String,
        number: json["number"] == null ? null : json["number"] as int,
        start: json["start"] == null ? null : json["start"] as int,
        end: json["end"] == null ? null : json["end"] as int,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "translation": translation,
        "transliteration": transliteration,
        "number": number,
        "start": start,
        "end": end,
      };
}
