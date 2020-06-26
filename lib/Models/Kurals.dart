class Kural {
  List<ThirukKural> kural;
  String repo;

  Kural({this.kural, this.repo});

  Kural.fromJson(Map<String, dynamic> json) {
    if (json['kural'] != null) {
      kural = List<ThirukKural>();
      json['kural'].forEach((v) {
        kural.add(ThirukKural.fromJson(v));
      });
    }
    repo = json['repo'];
  }
}

class ThirukKural {
  int number;
  String line1;
  String line2;
  String translation;
  String mv;
  String sp;
  String mk;
  String explanation;
  String couplet;
  String transliteration1;
  String transliteration2;

  ThirukKural(
      {this.number,
      this.line1,
      this.line2,
      this.translation,
      this.mv,
      this.sp,
      this.mk,
      this.explanation,
      this.couplet,
      this.transliteration1,
      this.transliteration2});

  ThirukKural.fromJson(Map<String, dynamic> json) {
    number = json['Number'];
    line1 = json['Line1'];
    line2 = json['Line2'];
    translation = json['Translation'];
    mv = json['mv'];
    sp = json['sp'];
    mk = json['mk'];
    explanation = json['explanation'];
    couplet = json['couplet'];
    transliteration1 = json['transliteration1'];
    transliteration2 = json['transliteration2'];
  }
}
