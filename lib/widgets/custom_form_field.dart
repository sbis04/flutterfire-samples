import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    required TextEditingController emailController,
    required FocusNode emailFocusNode,
    required TextInputType keyboardType,
    required String label,
    required String hint,
    required Function(String value) validator,
    this.isObscure = false,
  })  : _emailController = emailController,
        _emailFocusNode = emailFocusNode,
        _keyboardtype = keyboardType,
        _label = label,
        _hint = hint,
        _validator = validator,
        super(key: key);

  final TextEditingController _emailController;
  final FocusNode _emailFocusNode;
  final TextInputType _keyboardtype;
  final String _label;
  final String _hint;
  final bool isObscure;
  final Function(String) _validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _emailController,
      focusNode: _emailFocusNode,
      keyboardType: _keyboardtype,
      obscureText: isObscure,
      cursorColor: CustomColors.firebaseYellow,
      validator: (value) => _validator(value!),
      decoration: InputDecoration(
        labelText: _label,
        labelStyle: TextStyle(color: CustomColors.firebaseYellow),
        hintText: _hint,
        hintStyle: TextStyle(
          color: CustomColors.firebaseGrey.withOpacity(0.5),
        ),
        errorStyle: TextStyle(
          color: Colors.redAccent,
          fontWeight: FontWeight.bold,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: CustomColors.firebaseAmber,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: CustomColors.firebaseGrey.withOpacity(0.5),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.redAccent,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.redAccent,
            width: 2,
          ),
        ),
      ),
    );
  }
}
