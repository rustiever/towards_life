import 'package:TowardsLife/app/constants/constants.dart';
import 'package:TowardsLife/app/data/model/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:get/get.dart';

class FireApiClient {
  final FirebaseFirestore firestore;
  FireApiClient({@required this.firestore});

  Future<void> setAll() async {
    final Map<String, dynamic> map = Kural(
      number: 1,
      couplet:
          "A, as its first of letters, every speech maintains;The \"Primal Deity\" is first through all the world's domains",
      line1: "அகர முதல எழுத்தெல்லாம் ஆதி",
      line2: 'பகவன் முதற்றே உலகு.',
      transliteration: [
        Transliteration(
          language: 'English',
          content: Content(
              line1: 'Akara Mudhala Ezhuththellaam Aadhi',
              line2: 'Pakavan Mudhatre Ulaku'),
        )
      ],
      translation: <Translation>[
        Translation(
            language: 'English',
            content:
                "'A' leads letters; the Ancient Lord Leads and lords the entire world")
      ],
      explanation: [
        Explanation(
          languageName: 'Tamil',
          details: [
            Detail(
                author: 'mv',
                content:
                    'எழுத்துக்கள் எல்லாம் அகரத்தை அடிப்படையாக கொண்டிருக்கின்றன. அதுபோல உலகம் கடவுளை அடிப்படையாக கொண்டிருக்கிறது.'),
            Detail(
                author: 'sp',
                content:
                    'எழுத்துக்கள் எல்லாம் அகரத்தில் தொடங்குகின்றன; (அது போல) உலகம் கடவுளில் தொடங்குகிறது.'),
            Detail(
                author: 'mk',
                content:
                    'அகரம் எழுத்துக்களுக்கு முதன்மை; ஆதிபகவன், உலகில் வாழும் உயிர்களுக்கு முதன்மை'),
          ],
        ),
        Explanation(
          languageName: 'English',
          details: [
            Detail(
                author: 'unknown',
                content:
                    'As the letter A is the first of all letters, so the eternal God is first in the world'),
          ],
        ),
      ],
    ).toJson();

    print(map);

    await firestore.collection(kuralCollection).doc('1').set(map);
    final Kural v = Kural.fromJson(
        (await firestore.collection(kuralCollection).doc('1').get()).data());
    printInfo(info: kuralToJson(v));
  }
}
