import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('notes');

class Database {
  static String? userUid;

  static Future<void> addItem(
      {required String title, required String description}) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('items').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "description": description,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Notes item added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateItem(
      {required String title, required String description}) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('items').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "description": description,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Notes item updated in the database"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItems() {
    CollectionReference notesItemCollection =
        _mainCollection.doc(userUid).collection('items');

    return notesItemCollection.snapshots();
  }

  static Future<void> deleteItem() async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('items').doc();

    await documentReferencer
        .delete()
        .whenComplete(() => print('Notes item deleted from the database'))
        .catchError((e) => print(e));
  }

  //   static SnackBar customSnackBar({required String content}) {
  //   return SnackBar(
  //     backgroundColor: Colors.black,
  //     content: Text(
  //       content,
  //       style: TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
  //     ),
  //   );
  // }

  // ScaffoldMessenger.of(context).showSnackBar(
  //         Authentication.customSnackBar(
  //           content: 'Wrong password provided.',
  //         ),
  //       );

}
