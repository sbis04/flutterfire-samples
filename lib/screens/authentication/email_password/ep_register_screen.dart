import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/widgets/app_bar_title.dart';
import 'package:flutterfire_samples/widgets/authentication/email_password/ep_register_form.dart';

class EPRegisterScreen extends StatefulWidget {
  @override
  _EPRegisterScreenState createState() => _EPRegisterScreenState();
}

class _EPRegisterScreenState extends State<EPRegisterScreen> {
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _nameFocusNode.unfocus();
        _emailFocusNode.unfocus();
        _passwordFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: Palette.firebaseNavy,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Palette.firebaseNavy,
          title: AppBarTitle(
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
            child: EPRegisterForm(
              nameFocusNode: _nameFocusNode,
              emailFocusNode: _emailFocusNode,
              passwordFocusNode: _passwordFocusNode,
            ),
          ),
        ),
      ),
    );
  }
}
