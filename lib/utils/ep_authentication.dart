import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EPAuthentication {
  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: const TextStyle(
          color: Colors.redAccent,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  static Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
        ScaffoldMessenger.of(context).showSnackBar(
          EPAuthentication.customSnackBar(
            content: 'No user found for that email. Please create an account.',
          ),
        );
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided.');
        ScaffoldMessenger.of(context).showSnackBar(
          EPAuthentication.customSnackBar(
            content: 'Wrong password provided.',
          ),
        );
      }
    }

    return user;
  }

  static Future<User?> registerUsingEmailPassword({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = userCredential.user;
      await user!.updateDisplayName(name);
      await user.reload();
      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
        ScaffoldMessenger.of(context).showSnackBar(
          EPAuthentication.customSnackBar(
            content: 'The password provided is too weak.',
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
        ScaffoldMessenger.of(context).showSnackBar(
          EPAuthentication.customSnackBar(
            content: 'The account already exists for that email.',
          ),
        );
      }
    } catch (e) {
      log(e.toString());
    }

    return user;
  }

  static Future<User?> refreshUser(User user) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await user.reload();
    User? refreshedUser = auth.currentUser;

    return refreshedUser;
  }
}
