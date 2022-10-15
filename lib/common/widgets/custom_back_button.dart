import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 8.0),
        child: ClipOval(
          child: Material(
            color: Colors.black26,
            child: InkWell(
              splashColor: Colors.black,
              onTap: () => Navigator.of(context).pop(),
              child: const SizedBox(
                width: 52,
                height: 52,
                child: Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(Icons.arrow_back_ios),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
