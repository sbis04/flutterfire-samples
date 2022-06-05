import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.maxFinite,
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  text: const TextSpan(
                    text: 'Creator: ',
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 14.0,
                      color: Colors.white54,
                    ),
                    children: [
                      TextSpan(
                        text: 'Souvik Biswas',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        text: 'Powered by: ',
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 14.0,
                          color: Colors.white54,
                        ),
                        children: [
                          TextSpan(
                            text: 'Flutter',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    const FlutterLogo(size: 20.0)
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
