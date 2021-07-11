import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/res/fire_assets.dart';
import 'package:flutterfire_samples/widgets/app_bar_title.dart';
import 'package:flutterfire_samples/widgets/footer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<String> _listFireItems = [
    'Authentication',
    'Database',
    'Backend Actions',
    'Machine Learning',
    'Other utilities',
  ];

  final List<String> _listFireIcons = [
    FireAssets.fireAuthentication,
    FireAssets.fireDatabase,
    FireAssets.fireBackend,
    FireAssets.fireMachineLearning,
    FireAssets.fireOtherUtilities,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.firebaseNavy,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Palette.firebaseNavy,
        title: AppBarTitle(
          sectionName: 'Samples',
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 100.0,
              ),
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                separatorBuilder: (context, index) => SizedBox(height: 8.0),
                itemCount: _listFireItems.length,
                itemBuilder: (context, index) => Card(
                  color: Colors.black12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          24.0,
                          16.0,
                          16.0,
                          16.0,
                        ),
                        child: Image.asset(
                          _listFireIcons[index],
                          color: Palette.firebaseYellow,
                          width: 40.0,
                        ),
                        // child: Icon(
                        //   _listFireIcons[index],
                        //   size: 32.0,
                        //   color: Palette.firebaseYellow,
                        // ),
                      ),
                      Text(
                        _listFireItems[index],
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Footer(),
            ),
          ],
        ),
      ),
    );
  }
}
