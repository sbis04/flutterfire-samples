import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authentication {
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

  static Future<User?> signInUsingPhoneNumber({
    required String phoneNumber,
    required String otpCode,
    required Function(PhoneAuthCredential) onVerificationComplete,
    required Function(String) onCodeSent,
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (credential) =>
            onVerificationComplete(credential),
        verificationFailed: (error) {
          if (error.code == 'invalid-phone-number') {
            ScaffoldMessenger.of(context).showSnackBar(
              Authentication.customSnackBar(
                content: 'The provided phone number is not valid.',
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              Authentication.customSnackBar(
                content: 'Phone Auth verification failed.',
              ),
            );
          }
        },
        codeSent: (verificationId, forceResendingToken) =>
            onCodeSent(verificationId),
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
        ScaffoldMessenger.of(context).showSnackBar(
          Authentication.customSnackBar(
            content: 'No user found for that email. Please create an account.',
          ),
        );
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided.');
        ScaffoldMessenger.of(context).showSnackBar(
          Authentication.customSnackBar(
            content: 'Wrong password provided.',
          ),
        );
      }
    }
  }
}
