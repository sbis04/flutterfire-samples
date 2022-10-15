import 'package:flutter/material.dart';

import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/common/widgets/app_bar_title.dart';

import '../utils/database.dart';
import '../widgets/db_edit_item_form.dart';

class DbEditScreen extends StatefulWidget {
  final String currentTitle;
  final String currentDescription;
  final String documentId;

  const DbEditScreen({
    Key? key,
    required this.currentTitle,
    required this.currentDescription,
    required this.documentId,
  }) : super(key: key);

  @override
  _DbEditScreenState createState() => _DbEditScreenState();
}

class _DbEditScreenState extends State<DbEditScreen> {
  final FocusNode _titleFocusNode = FocusNode();

  final FocusNode _descriptionFocusNode = FocusNode();

  bool _isDeleting = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _titleFocusNode.unfocus();
        _descriptionFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: Palette.firebaseNavy,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Palette.firebaseNavy,
          title: const AppBarTitle(sectionName: 'CRUD'),
          actions: [
            _isDeleting
                ? const Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                      right: 16.0,
                    ),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.redAccent,
                      ),
                      strokeWidth: 3,
                    ),
                  )
                : IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                      size: 32,
                    ),
                    onPressed: () async {
                      setState(() {
                        _isDeleting = true;
                      });

                      await Database.deleteItem(
                        docId: widget.documentId,
                      );

                      setState(() {
                        _isDeleting = false;
                      });

                      Navigator.of(context).pop();
                    },
                  ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 20.0,
              ),
              child: DbEditItemForm(
                documentId: widget.documentId,
                titleFocusNode: _titleFocusNode,
                descriptionFocusNode: _descriptionFocusNode,
                currentTitle: widget.currentTitle,
                currentDescription: widget.currentDescription,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
