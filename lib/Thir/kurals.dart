import 'dart:convert';
import './constants.dart';
import 'package:html_unescape/html_unescape.dart';

class Kurals {
  List<String> paals;
  List<Athigaram> athigaarams;
  List<Kural> kurals;

  Kurals() {
    paals = [];
    athigaarams = [];
    kurals = [];
  }

  // see
  // https://www.dartlang.org/resources/dart-tips/dart-tips-ep-11
  // http://blog.sethladd.com/2012/02/classes-in-dart-part-one.html
  Kurals.fromJson(String jsonStr) {
    Map data = json.decode(jsonStr);
    List<String> pals = [];
    var unescape = new HtmlUnescape();
    (data['pal'] as Map).forEach((k,v) {
      pals.add( v[0] );
    });
    List<Athigaram> athigarams = [];
    (data['athigaram'] as Map).forEach((k,v) {
      athigarams.add(new Athigaram( int.parse(v[0])-1, v[1]));
    });
    List<Kural> kurals = [];
    (data['kural'] as Map).forEach( (k,v) {
      Map map = json.decode(v[3]);
      kurals.add(
        new Kural(
            int.parse(v[1])-1,
            v[2],
            unescape.convert(map['e']),
            unescape.convert(map['v']),
            unescape.convert(map['s']),
            unescape.convert(map['c']),
            unescape.convert(map['t'])
        )
      );
    });

    this.paals = pals;
    this.athigaarams = athigarams;
    this.kurals =  kurals;
  }
}

class Athigaram {
  final int paalIndex;
  final String name;

  Athigaram(this.paalIndex, this.name);

  @override
  String toString() {
    return '{palIndex: $paalIndex, name: $name}';
  }
}

class Kural {
  final int athigaramIndex;
  final String tamil;
  final String english;
  final String tamilExplanation1;
  final String tamilExplanation2;
  final String englishExplanation;
  final String transliteration;

  Kural(this.athigaramIndex, this.tamil, this.english,
      this.tamilExplanation1, this.tamilExplanation2, this.englishExplanation,
      this.transliteration);

  @override
  String toString() {
    return 'Kural{athigaramIndex: $athigaramIndex, tamil: $tamil, english: $english, tamilExplanation1: $tamilExplanation1, tamilExplanation2: $tamilExplanation2, englishExplanation: $englishExplanation, transliteration: $transliteration}';
  }

  // TODO - add app/play store link
  String getShareText() {
    return '$tamil\n\n$kVilakam $tamilExplanation1\n\n$kVilakam2 $tamilExplanation2\n\nExplanation: $englishExplanation\n\nSent from Thirukural App';
  }
}