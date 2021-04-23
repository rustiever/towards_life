// To parse this JSON data, do
//
//     final kuralDetail = kuralDetailFromJson(jsonString);

import 'dart:convert';

List<KuralDetail> kuralDetailFromJson(String str) => List<KuralDetail>.from(
      json.decode(str).map(
            (x) => KuralDetail.fromJson(x as Map<String, dynamic>),
          ) as Iterable,
    );

String kuralDetailToJson(List<KuralDetail> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KuralDetail {
  KuralDetail({
    required this.name,
    required this.transliteration,
    required this.translation,
    required this.number,
    required this.chapterGroup,
  });

  final String name;
  final String transliteration;
  final String translation;
  final int number;
  final ChapterGroup chapterGroup;

  factory KuralDetail.fromJson(Map<String, dynamic> json) => KuralDetail(
        name: json["name"] as String,
        transliteration: json["transliteration"] as String,
        translation: json["translation"] as String,
        number: json["number"] as int,
        chapterGroup:
            ChapterGroup.fromJson(json["chapterGroup"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "transliteration": transliteration,
        "translation": translation,
        "number": number,
        "chapterGroup": chapterGroup,
      };
}

class ChapterGroup {
  ChapterGroup({
    required this.tamil,
    required this.detail,
  });

  final String tamil;
  final List<ChapterGroupDetail> detail;

  factory ChapterGroup.fromJson(Map<String, dynamic> json) => ChapterGroup(
        tamil: json["tamil"] as String,
        detail: List<ChapterGroupDetail>.from(
          json["detail"].map(
            (x) => ChapterGroupDetail.fromJson(x as Map<String, dynamic>),
          ) as Iterable,
        ),
      );

  Map<String, dynamic> toJson() => {
        "tamil": tamil,
        "detail": List<dynamic>.from(
          detail.map(
            (x) => x.toJson(),
          ),
        ),
      };
}

class ChapterGroupDetail {
  ChapterGroupDetail({
    required this.name,
    required this.transliteration,
    required this.translation,
    required this.number,
    required this.chapters,
  });

  final String name;
  final String transliteration;
  final String translation;
  final int number;
  final Chapters chapters;

  factory ChapterGroupDetail.fromJson(Map<String, dynamic> json) =>
      ChapterGroupDetail(
        name: json["name"] as String,
        transliteration: json["transliteration"] as String,
        translation: json["translation"] as String,
        number: json["number"] as int,
        chapters: Chapters.fromJson(json["chapters"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "transliteration": transliteration,
        "translation": translation,
        "number": number,
        "chapters": chapters,
      };
}

class Chapters {
  Chapters({
    required this.tamil,
    required this.detail,
  });

  final String tamil;
  final List<ChaptersDetail> detail;

  factory Chapters.fromJson(Map<String, dynamic> json) => Chapters(
        tamil: json["tamil"] as String,
        detail: List<ChaptersDetail>.from(
          json["detail"].map(
            (x) => ChaptersDetail.fromJson(x as Map<String, dynamic>),
          ) as Iterable,
        ),
      );

  Map<String, dynamic> toJson() => {
        "tamil": tamil,
        "detail": List<dynamic>.from(
          detail.map(
            (x) => x.toJson(),
          ),
        ),
      };
}

class ChaptersDetail {
  ChaptersDetail({
    required this.name,
    required this.translation,
    required this.transliteration,
    required this.number,
    required this.start,
    required this.end,
  });

  final String name;
  final String translation;
  final String transliteration;
  final int number;
  final int start;
  final int end;

  factory ChaptersDetail.fromJson(Map<String, dynamic> json) => ChaptersDetail(
        name: json["name"] as String,
        translation: json["translation"] as String,
        transliteration: json["transliteration"] as String,
        number: json["number"] as int,
        start: json["start"] as int,
        end: json["end"] as int,
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
