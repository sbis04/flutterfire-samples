import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';

class AppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/firebase_logo.png',
          height: 20,
        ),
        SizedBox(width: 8),
        Text(
          'FlutterFire',
          style: TextStyle(
            color: Palette.firebaseYellow,
            fontSize: 18,
          ),
        ),
        Text(
          ' Authentication',
          style: TextStyle(
            color: Palette.firebaseOrange,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
