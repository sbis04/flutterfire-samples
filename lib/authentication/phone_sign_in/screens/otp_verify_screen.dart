import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/common/widgets/app_bar_title.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../utils/authentication.dart';
import 'profile_create_screen.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  final String phoneNumber;

  @override
  OtpVerifyScreenState createState() => OtpVerifyScreenState();
}

class OtpVerifyScreenState extends State<OtpVerifyScreen> {
  final _otpVerifyFormKey = GlobalKey<FormState>();

  final FocusNode _otpFocusNode = FocusNode();
  final TextEditingController _otpController = TextEditingController();

  bool _isVerifying = false;
  String? _verificationId;

  Route _routeToProfileCreateScreen(User user) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          ProfileCreateScreen(user: user),
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
  void initState() {
    Authentication.signInUsingPhoneNumber(
      context: context,
      phoneNumber: widget.phoneNumber,
      onVerificationComplete: (credential) async {
        final userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        final authenticatedUser = userCredential.user;
        print('Auth User: $authenticatedUser');
        if (authenticatedUser != null) {
          Navigator.of(context)
              .pushReplacement(_routeToProfileCreateScreen(authenticatedUser));
        }
      },
      onCodeSent: (verificationId) async {
        setState(() {
          _verificationId = verificationId;
        });
        // user = userCredential.user;
      },
      otpCode: _otpController.text,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _otpFocusNode.unfocus(),
      child: Scaffold(
        backgroundColor: Palette.firebaseNavy,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Palette.firebaseNavy,
          title: const AppBarTitle(
            sectionName: 'Authentication',
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: Form(
              key: _otpVerifyFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                    ),
                    child: PinCodeTextField(
                      appContext: context,
                      length: 6,
                      // textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                      //       fontFamily: 'Comfortaa',
                      //       color: FlutterFlowTheme.of(context).secondaryColor,
                      //     ),
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      enableActiveFill: true,
                      autoFocus: true,
                      showCursor: true,
                      // cursorColor: FlutterFlowTheme.of(context).primaryColor,
                      obscureText: false,
                      hintCharacter: '-',
                      pinTheme: PinTheme(
                        fieldHeight: 50,
                        fieldWidth: 40,
                        borderWidth: 2,
                        borderRadius: BorderRadius.circular(12),
                        shape: PinCodeFieldShape.box,
                        activeColor: Color(0xCBFFFFFF),
                        inactiveColor: Color(0x65F1F4F8),
                        selectedColor: Color(0x98FFFFFF),
                        activeFillColor: Color(0xCBFFFFFF),
                        inactiveFillColor: Color(0x65F1F4F8),
                        selectedFillColor: Color(0x98FFFFFF),
                      ),
                      controller: _otpController,
                      onChanged: (_) => {},
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  _isVerifying
                      ? const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Palette.firebaseOrange,
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                          child: SizedBox(
                            width: double.maxFinite,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Palette.firebaseOrange,
                                ),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              onPressed: () async {
                                _otpFocusNode.unfocus();

                                setState(() {
                                  _isVerifying = true;
                                });

                                if (_otpVerifyFormKey.currentState!
                                        .validate() &&
                                    _verificationId != null) {
                                  PhoneAuthCredential credential =
                                      PhoneAuthProvider.credential(
                                    verificationId: _verificationId!,
                                    smsCode: _otpController.text,
                                  );
                                  final userCredential = await FirebaseAuth
                                      .instance
                                      .signInWithCredential(credential);

                                  final authenticatedUser = userCredential.user;
                                  print('Auth User: $authenticatedUser');
                                  if (authenticatedUser != null) {
                                    Navigator.of(context).pushReplacement(
                                        _routeToProfileCreateScreen(
                                            authenticatedUser));
                                  }
                                }

                                setState(() {
                                  _isVerifying = false;
                                });
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(
                                  top: 16.0,
                                  bottom: 16.0,
                                ),
                                child: Text(
                                  'Verify',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Palette.firebaseGrey,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
