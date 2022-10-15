import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_samples/firebase_options.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/common/widgets/custom_back_button.dart';

import '../widgets/db_login_form.dart';

class DbLoginScreen extends StatefulWidget {
  const DbLoginScreen({super.key});

  @override
  _DbLoginScreenState createState() => _DbLoginScreenState();
}

class _DbLoginScreenState extends State<DbLoginScreen> {
  final FocusNode _uidFocusNode = FocusNode();

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _uidFocusNode.unfocus(),
      child: Scaffold(
        backgroundColor: Palette.firebaseNavy,
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  bottom: 20.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Image.asset(
                              'assets/firebase_logo.png',
                              height: 160,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'FlutterFire',
                            style: TextStyle(
                              color: Palette.firebaseYellow,
                              fontSize: 40,
                            ),
                          ),
                          const Text(
                            'CRUD',
                            style: TextStyle(
                              color: Palette.firebaseOrange,
                              fontSize: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                    FutureBuilder(
                      future: _initializeFirebase(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Text('Error initializing Firebase');
                        } else if (snapshot.connectionState ==
                            ConnectionState.done) {
                          return DbLoginForm(focusNode: _uidFocusNode);
                        }
                        return const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Palette.firebaseOrange,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              CustomBackButton(),
            ],
          ),
        ),
      ),
    );
  }
}
