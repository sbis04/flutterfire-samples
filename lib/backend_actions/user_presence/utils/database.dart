import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'user.dart';

class Database {
  /// The main Firestore user collection
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');
  final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

  storeUserData({required String userName}) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    DocumentReference documentReferencer = userCollection.doc(uid);

    UserModel user = UserModel(
      uid: uid,
      name: userName,
      presence: true,
      lastSeenInEpoch: DateTime.now().millisecondsSinceEpoch,
    );

    var data = user.toJson();

    await documentReferencer.set(data).whenComplete(() {
      print("User data added");
    }).catchError((e) => print(e));

    updateUserPresence();
  }

  Stream<QuerySnapshot<Object?>> retrieveUsers() {
    Stream<QuerySnapshot<Object?>> queryUsers = userCollection
    // .where('uid', isNotEqualTo: uid)
        .orderBy('last_seen', descending: true)
        .snapshots();

    return queryUsers;
  }

  updateUserPresence() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    Map<String, dynamic> presenceStatusTrue = {
      'presence': true,
      'last_seen': DateTime.now().millisecondsSinceEpoch,
    };

    await databaseReference
        .child(uid)
        .update(presenceStatusTrue)
        .whenComplete(() => print('Updated your presence.'))
        .catchError((e) => print(e));

    Map<String, dynamic> presenceStatusFalse = {
      'presence': false,
      'last_seen': DateTime.now().millisecondsSinceEpoch,
    };

    databaseReference.child(uid).onDisconnect().update(presenceStatusFalse);
  }
}
