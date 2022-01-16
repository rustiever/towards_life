import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:towards_life/app/api/client/firebase_client.dart';
import 'package:towards_life/app/api/repository/firestore_repository.dart';
import 'package:towards_life/firebase_options.dart';

void main() {
  test('check collection length', () async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    final api =
        FireRepository(apiClient: FirebaseClient(FirebaseFirestore.instance));

    final res = await api.fetchContents("ThirukKural");
    expect(res.size, 10);
    expect(1, 1);
  });
}
