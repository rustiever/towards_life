import 'package:meta/meta.dart';

class Topic {
  String asset, name;
  int length;
  Topic({
    @required this.asset,
    @required this.length,
    @required this.name,
  });
}

List<Topic> topicList = [
  Topic(
      asset: 'assets/images/thiruvalluvar.png',
      length: 1330,
      name: 'Thirukkural'),
  Topic(asset: 'assets/images/avvaiyar.png', length: 130, name: 'Aathichudi'),
  Topic(
      asset: 'assets/images/thiruvalluvar.png',
      length: 1330,
      name: 'Thirukkural'),
];