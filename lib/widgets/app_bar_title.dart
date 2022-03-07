import 'package:flutter/material.dart';

import 'package:flutterfire_samples/res/custom_colors.dart';

class AppBarTitle extends StatelessWidget {
  final String sectionName;

  const AppBarTitle({
    Key? key,
    required this.sectionName,
  }) : super(key: key);

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
        const SizedBox(width: 8),
        Text(
          'FlutterFire',
          style: TextStyle(
            color: Palette.firebaseYellow,
            fontSize: 18,
          ),
        ),
        Text(
          ' $sectionName',
          style: TextStyle(
            color: Palette.firebaseOrange,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
