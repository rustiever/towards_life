import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

_createNewFavsFile(String filename, String encodedString) async {
  try {
    var file = await new File(filename).create();
    file = await file.writeAsString(encodedString);
  } catch (e) {
    print('error while creating file: $e');
  }
}

Future<Set<int>> readFavorites() async {
  String dir = (await getApplicationDocumentsDirectory()).path;
  final String filename = '$dir/favs.json';
  try {
    File file = new File(filename);
    // read the variable as a string from the file.
    String contents = await file.readAsString();
    final List<dynamic> listJson = json.decode(contents);
    // need to convert from dynamic to int
    final list = <int>[];
    listJson.forEach((element) => list.add(element));
    return list.toSet();
  } catch (e) {
    _createNewFavsFile(filename, json.encode([]));
    return new Set();
  }
}

writeFavoriteList(Set<int> sett) async {
  String dir = (await getApplicationDocumentsDirectory()).path;
  var encodedString = json.encode(sett.toList());
  final String filename = '$dir/favs.json';
  try {
    File file = new File(filename);
    file = await file.writeAsString(encodedString);
  } catch (e) {
    _createNewFavsFile(filename, encodedString);
  }
}