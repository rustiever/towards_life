// To parse this JSON data, do
//
//     final kuralDetail = kuralDetailFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

KuralDetail kuralDetailFromJson(String str) =>
    KuralDetail.fromJson(json.decode(str) as Map<String, dynamic>);

String kuralDetailToJson(KuralDetail data) => json.encode(data.toJson());

class KuralDetail {
  KuralDetail({
    @required this.tamil,
    @required this.section,
  });

  String tamil;
  Section section;

  factory KuralDetail.fromJson(Map<String, dynamic> json) => KuralDetail(
        tamil: json["tamil"] == null ? null : json["tamil"] as String,
        section: json["section"] == null
            ? null
            : Section.fromJson(json["section"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "tamil": tamil,
        "section": section ?? section.toJson(),
      };
}

class Section {
  Section({
    @required this.tamil,
    @required this.detail,
  });

  String tamil;
  List<SectionDetail> detail;

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        tamil: json["tamil"] == null ? null : json["tamil"] as String,
        detail: json["detail"] == null
            ? null
            : List<SectionDetail>.from(
                json["detail"].map(
                  (x) => SectionDetail.fromJson(x as Map<String, dynamic>),
                ) as Iterable,
              ),
      );

  Map<String, dynamic> toJson() => {
        "tamil": tamil,
        "detail": detail == null
            ? null
            : List<dynamic>.from(detail.map((x) => x.toJson())),
      };
}

class SectionDetail {
  SectionDetail({
    @required this.name,
    @required this.transliteration,
    @required this.translation,
    @required this.number,
    @required this.chapterGroup,
  });

  String name;
  String transliteration;
  String translation;
  int number;
  ChapterGroup chapterGroup;

  factory SectionDetail.fromJson(Map<String, dynamic> json) => SectionDetail(
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

  String tamil;
  List<ChapterGroupDetail> detail;

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
            : List<dynamic>.from(detail.map((x) => x.toJson())),
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

  String name;
  String transliteration;
  String translation;
  int number;
  Chapters chapters;

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

  String tamil;
  List<ChaptersDetail> detail;

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
            : List<dynamic>.from(detail.map((x) => x.toJson())),
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

  String name;
  String translation;
  String transliteration;
  int number;
  int start;
  int end;

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
