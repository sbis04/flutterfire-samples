import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/res/structure.dart';
import 'package:flutterfire_samples/common/widgets/app_bar_title.dart';
import 'package:flutterfire_samples/common/widgets/footer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<bool> _isExpanded = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Palette.firebaseNavy,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Palette.firebaseNavy,
        ),
        title: const AppBarTitle(
          sectionName: 'Samples',
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(
                // left: 16.0,
                // right: 16.0,
                bottom: 80.0,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: Palette.firebaseNavy,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 12.0,
                    ),
                    itemCount: menu.length,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(
                        bottom: index == menu.length - 1 ? 30.0 : 0.0,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: ExpansionPanelList(
                          expansionCallback: (panelIndex, isExpanded) {
                            setState(() {
                              _isExpanded[index] = !_isExpanded[index];
                            });
                          },
                          children: [
                            ExpansionPanel(
                              backgroundColor: Colors.black54,
                              canTapOnHeader: true,
                              headerBuilder:
                                  (BuildContext context, bool isExpanded) {
                                return Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                        24.0,
                                        16.0,
                                        16.0,
                                        16.0,
                                      ),
                                      child: Image.asset(
                                        menu[index]['icon'],
                                        color: Palette.firebaseYellow,
                                        //   Palette.firebaseYellow.withOpacity(
                                        // screensMap[menu[index].name] != null
                                        //     ? 1.0
                                        //     : 0.5,
                                        // ),
                                        width: 40.0,
                                      ),
                                    ),
                                    Text(
                                      menu[index]['name'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        // color: Colors.white.withOpacity(
                                        //   _listFeatureScreens[index] != null
                                        //       ? 1.0
                                        //       : 0.5,
                                        // ),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                );
                              },
                              body: ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(height: 8),
                                itemCount: menu[index]['screens'].length,
                                itemBuilder: (context, index2) {
                                  return InkWell(
                                    borderRadius: BorderRadius.circular(16.0),
                                    onTap: menu[index]['screens'][index2]
                                                ['widget'] !=
                                            null
                                        ? () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    menu[index]['screens']
                                                        [index2]['widget'],
                                              ),
                                            );
                                          }
                                        : null,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                        24.0,
                                        16.0,
                                        16.0,
                                        16.0,
                                      ),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: menu[index]
                                                            ['screens'][index2]
                                                        ['widget'] !=
                                                    null
                                                ? Palette.firebaseAmber
                                                : Palette.firebaseGrey
                                                    .withOpacity(0.5),
                                            child: menu[index]['screens']
                                                [index2]['icon'],
                                          ),
                                          const SizedBox(width: 16),
                                          Text(
                                            menu[index]['screens'][index2]
                                                ['name'],
                                            style: TextStyle(
                                              color: menu[index]['screens']
                                                          [index2]['widget'] !=
                                                      null
                                                  ? Palette.firebaseYellow
                                                  : Palette.firebaseGrey
                                                      .withOpacity(0.5),
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                              isExpanded: _isExpanded[index],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Footer(),
            ),
          ],
        ),
      ),
    );
  }
}
