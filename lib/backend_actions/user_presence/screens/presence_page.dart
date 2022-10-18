import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_samples/backend_actions/user_presence/utils/database.dart';
import 'package:flutterfire_samples/backend_actions/user_presence/utils/user.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';

import '../utils/authentication.dart';
import './sign_in_screen.dart';

class PresencePage extends StatefulWidget {
  final String userName;

  const PresencePage({Key? key, required this.userName}) : super(key: key);

  @override
  PresencePageState createState() => PresencePageState();
}

class PresencePageState extends State<PresencePage> {
  Database database = Database();
  late Timer timer;
  bool _isSigningOut = false;

  @override
  void initState() {
    database.updateUserPresence();
    timer = Timer.periodic(const Duration(minutes: 1), (_) => setState(() {}));

    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const SignInScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.firebaseNavy,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Palette.firebaseNavy,
        title: Text(
          widget.userName,
          style: const TextStyle(
            color: Palette.firebaseYellow,
            fontSize: 26,
          ),
        ),
        actions: [
          _isSigningOut
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
              : IconButton(
                  onPressed: () async {
                    setState(() {
                      _isSigningOut = true;
                    });
                    await Authentication.signOut(context: context);
                    setState(() {
                      _isSigningOut = false;
                    });
                    if (!mounted) return;
                    Navigator.of(context)
                        .pushReplacement(_routeToSignInScreen());
                  },
                  icon: const Icon(Icons.logout_rounded),
                ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size(100, 40.0),
          child: Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'USERS',
                style: TextStyle(
                  color: Palette.firebaseAmber,
                  fontSize: 16,
                  letterSpacing: 3,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: StreamBuilder<QuerySnapshot>(
            stream: database.retrieveUsers(),
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (_, index) {
                    UserModel userData = UserModel.fromJson(
                        snapshot.data!.docs[index].data()
                            as Map<String, dynamic>);
                    DateTime lastSeen = DateTime.fromMillisecondsSinceEpoch(
                        userData.lastSeenInEpoch!);
                    DateTime currentDateTime = DateTime.now();

                    Duration differenceDuration =
                        currentDateTime.difference(lastSeen);
                    String durationString = differenceDuration.inSeconds > 59
                        ? differenceDuration.inMinutes > 59
                            ? differenceDuration.inHours > 23
                                ? '${differenceDuration.inDays} ${differenceDuration.inDays == 1 ? 'day' : 'days'}'
                                : '${differenceDuration.inHours} ${differenceDuration.inHours == 1 ? 'hour' : 'hours'}'
                            : '${differenceDuration.inMinutes} ${differenceDuration.inMinutes == 1 ? 'minute' : 'minutes'}'
                        : 'few moments';

                    String presenceString =
                        userData.presence! ? 'Online' : '$durationString ago';

                    return userData.uid == Authentication().uid
                        ? Container()
                        : ListTile(
                            dense: true,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 0),
                            horizontalTitleGap: 0,
                            leading: Icon(
                              Icons.circle,
                              size: 12.0,
                              color: userData.presence!
                                  ? Colors.greenAccent[400]
                                  : Palette.firebaseGrey.withOpacity(0.4),
                            ),
                            title: Text(
                              userData.name!,
                              style: const TextStyle(
                                color: Palette.firebaseGrey,
                                fontSize: 26.0,
                              ),
                            ),
                            trailing: Text(
                              presenceString,
                              style: TextStyle(
                                color: userData.presence!
                                    ? Colors.greenAccent[400]
                                    : Palette.firebaseGrey.withOpacity(0.4),
                                fontSize: 14.0,
                              ),
                            ),
                          );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                );
              }
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Palette.firebaseOrange,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
