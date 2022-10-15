import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import '../../../common/widgets/custom_form_field.dart';
import '../screens/otp_verify_screen.dart';
import '../utils/validator.dart';

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
  final _signInFormKey = GlobalKey<FormState>();
  late final TextEditingController _phoneNumberController;

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
                  validator: (value) => Validator.validatePhone(
                    phoneNumber: value,
                  ),
                  label: 'Phone number',
                  hint: 'Enter your phone number',
                ),
              ],
            ),
          ),
          Padding(
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
                  if (_signInFormKey.currentState!.validate()) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => OtpVerifyScreen(
                          phoneNumber: _phoneNumberController.text,
                        ),
                      ),
                    );
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
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
    );
  }
}
