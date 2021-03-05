import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';

import 'custom_form_field.dart';

class SignInForm extends StatefulWidget {
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;

  const SignInForm({
    Key? key,
    required this.emailFocusNode,
    required this.passwordFocusNode,
  }) : super(key: key);
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _signInFormKey = GlobalKey<FormState>();

  bool _isLoggingIn = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signInFormKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              bottom: 24.0,
            ),
            child: Column(
              children: [
                CustomFormField(
                  emailController: _emailController,
                  emailFocusNode: widget.emailFocusNode,
                  label: 'Email',
                  hint: 'Enter your email',
                ),
                SizedBox(height: 16.0),
                CustomFormField(
                  emailController: _passwordController,
                  emailFocusNode: widget.passwordFocusNode,
                  label: 'Password',
                  hint: 'Enter your password',
                ),
              ],
            ),
          ),
          _isLoggingIn
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      CustomColors.firebaseOrange,
                    ),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(left: 0.0, right: 0.0),
                  child: Container(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          CustomColors.firebaseOrange,
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        setState(() {
                          _isLoggingIn = true;
                        });

                        if (_signInFormKey.currentState!.validate()) {
                          print('checked for validation');
                        }
                        // await signInWithGoogle().then((result) {
                        //   if (result != null) {
                        //     Navigator.of(context).pushReplacement(
                        //       MaterialPageRoute(
                        //         builder: (context) => NamePage(),
                        //       ),
                        //     );
                        //   }
                        // }).catchError(
                        //     (e) => print('Google sign in error: $e'));
                        setState(() {
                          _isLoggingIn = false;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.firebaseGrey,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
