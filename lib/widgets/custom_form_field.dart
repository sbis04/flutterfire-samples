import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/utils/validator.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    required TextEditingController emailController,
    required FocusNode emailFocusNode,
    required String label,
    required String hint,
  })   : _emailController = emailController,
        _emailFocusNode = emailFocusNode,
        _label = label,
        _hint = hint,
        super(key: key);

  final TextEditingController _emailController;
  final FocusNode _emailFocusNode;
  final String _label;
  final String _hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _emailController,
      focusNode: _emailFocusNode,
      validator: (value) => Validator.validateEmail(email: value!),
      decoration: InputDecoration(
        labelText: _label,
        labelStyle: TextStyle(color: CustomColors.firebaseYellow),
        hintText: _hint,
        hintStyle: TextStyle(
          color: CustomColors.firebaseGrey.withOpacity(0.5),
        ),
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: CustomColors.firebaseAmber,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: CustomColors.firebaseGrey.withOpacity(0.5),
            // width: 1.0,
          ),
        ),
      ),
    );
  }
}
