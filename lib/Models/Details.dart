class Collection {
  String tamil;
  Section section;
  String repo;

  Collection({this.tamil, this.section, this.repo});

  Collection.fromJson(Map<String, dynamic> json) {
    tamil = json['tamil'];
    section =
        json['section'] != null ? new Section.fromJson(json['section']) : null;
    repo = json['repo'];
  }
}

class Section {
  String tamil;
  List<Detail> detail;

  Section({this.tamil, this.detail});

  Section.fromJson(Map<String, dynamic> json) {
    tamil = json['tamil'];
    if (json['detail'] != null) {
      detail = new List<Detail>();
      json['detail'].forEach((v) {
        detail.add(new Detail.fromJson(v));
      });
    }
  }
}

class Detail {
  String name;
  String transliteration;
  String translation;
  int number;
  ChapterGroup chapterGroup;

  Detail(
      {this.name,
      this.transliteration,
      this.translation,
      this.number,
      this.chapterGroup});

  Detail.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    transliteration = json['transliteration'];
    translation = json['translation'];
    number = json['number'];
    chapterGroup = json['chapterGroup'] != null
        ? new ChapterGroup.fromJson(json['chapterGroup'])
        : null;
  }
}

class ChapterGroup {
  String tamil;
  List<ChapterGroupdetail> chapterGroupdetail;

  ChapterGroup({this.tamil, this.chapterGroupdetail});

  ChapterGroup.fromJson(Map<String, dynamic> json) {
    tamil = json['tamil'];
    if (json['chapterGroupdetail'] != null) {
      chapterGroupdetail = new List<ChapterGroupdetail>();
      json['chapterGroupdetail'].forEach((v) {
        chapterGroupdetail.add(new ChapterGroupdetail.fromJson(v));
      });
    }
  }
}

class ChapterGroupdetail {
  String name;
  String transliteration;
  String translation;
  int number;
  Chapters chapters;

  ChapterGroupdetail(
      {this.name,
      this.transliteration,
      this.translation,
      this.number,
      this.chapters});

  ChapterGroupdetail.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    transliteration = json['transliteration'];
    translation = json['translation'];
    number = json['number'];
    chapters = json['chapters'] != null
        ? new Chapters.fromJson(json['chapters'])
        : null;
  }
}

class Chapters {
  String tamil;
  List<ChapterDetail> chapterDetail;

  Chapters({this.tamil, this.chapterDetail});

  Chapters.fromJson(Map<String, dynamic> json) {
    tamil = json['tamil'];
    if (json['chapterDetail'] != null) {
      chapterDetail = new List<ChapterDetail>();
      json['chapterDetail'].forEach((v) {
        chapterDetail.add(new ChapterDetail.fromJson(v));
      });
    }
  }
}

class ChapterDetail {
  String name;
  String translation;
  String transliteration;
  int number;
  int start;
  int end;

  ChapterDetail(
      {this.name,
      this.translation,
      this.transliteration,
      this.number,
      this.start,
      this.end});

  ChapterDetail.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    translation = json['translation'];
    transliteration = json['transliteration'];
    number = json['number'];
    start = json['start'];
    end = json['end'];
  }
}
