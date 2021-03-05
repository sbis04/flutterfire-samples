import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/screens/sign_in_screen.dart';
import 'package:flutterfire_samples/utils/validator.dart';

import 'custom_form_field.dart';

class RegisterForm extends StatefulWidget {
  final FocusNode nameFocusNode;
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;

  const RegisterForm({
    Key? key,
    required this.nameFocusNode,
    required this.emailFocusNode,
    required this.passwordFocusNode,
  }) : super(key: key);
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _registerFormKey = GlobalKey<FormState>();

  bool _isLoggingIn = false;

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SignInScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
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
    return Form(
      key: _registerFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
            ),
            child: Column(
              children: [
                CustomFormField(
                  controller: _nameController,
                  focusNode: widget.nameFocusNode,
                  keyboardType: TextInputType.name,
                  inputAction: TextInputAction.next,
                  isCapitalized: true,
                  validator: (value) => Validator.validateEmail(
                    email: value,
                  ),
                  label: 'Name',
                  hint: 'Enter your name',
                ),
                SizedBox(height: 16.0),
                CustomFormField(
                  controller: _emailController,
                  focusNode: widget.emailFocusNode,
                  keyboardType: TextInputType.emailAddress,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateEmail(
                    email: value,
                  ),
                  label: 'Email',
                  hint: 'Enter your email',
                ),
                SizedBox(height: 16.0),
                CustomFormField(
                  controller: _passwordController,
                  focusNode: widget.passwordFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  validator: (value) => Validator.validatePassword(
                    password: value,
                  ),
                  isObscure: true,
                  label: 'Password',
                  hint: 'Enter your password',
                ),
              ],
            ),
          ),
          SizedBox(height: 24.0),
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
                        widget.emailFocusNode.unfocus();
                        widget.passwordFocusNode.unfocus();

                        setState(() {
                          _isLoggingIn = true;
                        });

                        if (_registerFormKey.currentState!.validate()) {
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
                          'REGISTER',
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
          SizedBox(height: 16.0),
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacement(
                _routeToSignInScreen(),
              );
            },
            child: Text(
              'Already have an account? Sign in',
              style: TextStyle(
                color: CustomColors.firebaseGrey,
                letterSpacing: 0.5,
              ),
            ),
          )
        ],
      ),
    );
  }
}
