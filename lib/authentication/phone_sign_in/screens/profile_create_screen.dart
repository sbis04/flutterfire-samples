import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/common/widgets/app_bar_title.dart';
import 'package:flutterfire_samples/common/widgets/custom_form_field.dart';

import '../utils/validator.dart';
import 'user_info_screen.dart';

class ProfileCreateScreen extends StatefulWidget {
  const ProfileCreateScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  ProfileCreateScreenState createState() => ProfileCreateScreenState();
}

class ProfileCreateScreenState extends State<ProfileCreateScreen> {
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _nameFocusNode.unfocus();
        _emailFocusNode.unfocus();
      },
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
            child: ProfileInfoForm(
              user: widget.user,
              nameFocusNode: _nameFocusNode,
              emailFocusNode: _emailFocusNode,
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileInfoForm extends StatefulWidget {
  final User user;
  final FocusNode nameFocusNode;
  final FocusNode emailFocusNode;

  const ProfileInfoForm({
    super.key,
    required this.user,
    required this.nameFocusNode,
    required this.emailFocusNode,
  });
  @override
  ProfileInfoFormState createState() => ProfileInfoFormState();
}

class ProfileInfoFormState extends State<ProfileInfoForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final _profileInfoFormKey = GlobalKey<FormState>();

  bool _isSaving = false;

  Route _routeToUserInfoScreen(User user) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          UserInfoScreen(user: widget.user),
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
    return Form(
      key: _profileInfoFormKey,
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
                  validator: (value) => Validator.validateName(
                    name: value,
                  ),
                  label: 'Name',
                  hint: 'Enter your name',
                ),
                const SizedBox(height: 16.0),
                CustomFormField(
                  controller: _emailController,
                  focusNode: widget.emailFocusNode,
                  keyboardType: TextInputType.emailAddress,
                  inputAction: TextInputAction.done,
                  validator: (value) => Validator.validateEmail(
                    email: value,
                  ),
                  label: 'Email',
                  hint: 'Enter your email',
                ),
              ],
            ),
          ),
          const SizedBox(height: 24.0),
          _isSaving
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
                        widget.nameFocusNode.unfocus();
                        widget.emailFocusNode.unfocus();

                        setState(() {
                          _isSaving = true;
                        });

                        await widget.user
                            .updateDisplayName(_nameController.text);
                        await widget.user.updateEmail(_emailController.text);
                        widget.user.reload();

                        if (_profileInfoFormKey.currentState!.validate()) {
                          Navigator.of(context).pushReplacement(
                              _routeToUserInfoScreen(widget.user));
                        }

                        setState(() {
                          _isSaving = false;
                        });
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                        child: Text(
                          'CONTINUE',
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
        ],
      ),
    );
  }
}
