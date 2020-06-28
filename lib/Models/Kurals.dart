class Kural {
  List<String> chapters;
  List<Kurals> kurals;
  List<String> sections;

  Kural({this.chapters, this.kurals, this.sections});

  Kural.fromJson(Map<String, dynamic> json) {
    chapters = json['chapters'].cast<String>();
    if (json['kurals'] != null) {
      kurals = new List<Kurals>();
      json['kurals'].forEach((v) {
        kurals.add(new Kurals.fromJson(v));
      });
    }
    sections = json['sections'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chapters'] = this.chapters;
    if (this.kurals != null) {
      data['kurals'] = this.kurals.map((v) => v.toJson()).toList();
    }
    data['sections'] = this.sections;
    return data;
  }
}

class Kurals {
  String chapter;
  List<String> kural;
  int number;
  String section;
  Meaning meaning;

  Kurals({this.chapter, this.kural, this.number, this.section, this.meaning});

  Kurals.fromJson(Map<String, dynamic> json) {
    chapter = json['chapter'];
    kural = json['kural'].cast<String>();
    number = json['number'];
    section = json['section'];
    meaning =
        json['meaning'] != null ? new Meaning.fromJson(json['meaning']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chapter'] = this.chapter;
    data['kural'] = this.kural;
    data['number'] = this.number;
    data['section'] = this.section;
    if (this.meaning != null) {
      data['meaning'] = this.meaning.toJson();
    }
    return data;
  }
}

class Meaning {
  String taMuVa;
  String taSalamon;
  String en;

  Meaning({this.taMuVa, this.taSalamon, this.en});

  Meaning.fromJson(Map<String, dynamic> json) {
    taMuVa = json['ta_mu_va'];
    taSalamon = json['ta_salamon'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ta_mu_va'] = this.taMuVa;
    data['ta_salamon'] = this.taSalamon;
    data['en'] = this.en;
    return data;
  }
}
