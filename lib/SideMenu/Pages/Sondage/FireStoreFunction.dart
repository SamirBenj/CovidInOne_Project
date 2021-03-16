import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> uploadData(String title, bool valeurBool) async {
  await FirebaseFirestore.instance.collection("Questions").add({
    'title': title,
    'valeuBool': valeurBool,
  });
}

Future<void> editQuestions(bool valeurBool, String id) async {
  await FirebaseFirestore.instance
      .collection("Questions")
      .doc(id)
      .update({"valeurBool": valeurBool});
}
