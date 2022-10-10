import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/utils/authentication/email_password_auth/authentication.dart';
import 'package:flutterfire_samples/utils/authentication/email_password_auth/validator.dart';

import '../../../screens/authentication/email_password/email_password.dart';
import '../../custom_form_field.dart';

class SignInForm extends StatefulWidget {
  final FocusNode phoneNumberFocusNode;

  const SignInForm({
    Key? key,
    required this.phoneNumberFocusNode,
  }) : super(key: key);
  @override
  SignInFormState createState() => SignInFormState();
}

class SignInFormState extends State<SignInForm> {
  late final TextEditingController _phoneNumberController;

  final _signInFormKey = GlobalKey<FormState>();

  bool _isSigningIn = false;

  @override
  void initState() {
    _phoneNumberController = TextEditingController();
    super.initState();
  }

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
                  controller: _phoneNumberController,
                  focusNode: widget.phoneNumberFocusNode,
                  keyboardType: TextInputType.phone,
                  inputAction: TextInputAction.done,
                  validator: (value) => Validator.validateEmail(
                    email: value,
                  ),
                  label: 'Phone number',
                  hint: 'Enter your phone number',
                ),
              ],
            ),
          ),
          _isSigningIn
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
                        widget.phoneNumberFocusNode.unfocus();

                        // setState(() {
                        //   _isSigningIn = true;
                        // });

                        // if (_signInFormKey.currentState!.validate()) {
                        //   User? user =
                        //       await Authentication.signInUsingEmailPassword(
                        //     context: context,
                        //     email: _emailController.text,
                        //     password: _passwordController.text,
                        //   );

                        //   if (user != null) {
                        //     Navigator.of(context).pop();
                        //     Navigator.of(context).pop();
                        //     Navigator.of(context).push(
                        //       MaterialPageRoute(
                        //         builder: (context) => UserInfoScreen(
                        //           user: user,
                        //         ),
                        //       ),
                        //     );
                        //   }
                        // }

                        // setState(() {
                        //   _isSigningIn = false;
                        // });
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                        child: Text(
                          'LOGIN',
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
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const RegisterScreen(),
                ),
              );
            },
            child: const Text(
              'Don\'t have an account? Sign up',
              style: TextStyle(
                color: Palette.firebaseGrey,
                letterSpacing: 0.5,
              ),
            ),
          )
        ],
      ),
    );
  }
}
