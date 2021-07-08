import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiosk_app/MyAssets.dart';
import 'package:kiosk_app/PageRaffle.dart';
import 'package:sprintf/sprintf.dart';

import 'LayoutTop.dart';
import 'LayoutTriangles.dart';
import 'MyColors.dart';
import 'MyCustomChild.dart';
import 'MyFonts.dart';
import 'MyTexts.dart';

class PageSpinCount extends StatefulWidget {
  PageSpinCount({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _SpinCountPage createState() => _SpinCountPage();
}

class _SpinCountPage extends State<PageSpinCount> {
  void navigate() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PageRaffle(title: 'Raffle')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight =
        MediaQuery.of(context).size.height; // device screen height
    final screenWidth =
        MediaQuery.of(context).size.width; // device screen width
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      //resizeToAvoidBottomInset: false,
      //backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          //margin: EdgeInsets.only(top: statusBarHeight),
          width: screenWidth,
          height: screenHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                MyAssets.backgroundFinal,
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Stack(
            children: [
              Container(
                color: Colors.transparent,
                child: Triangles(),
                height: screenHeight - statusBarHeight,
                width: screenWidth,
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: screenHeight * 0.03),
                  width: screenWidth * 0.92,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: 35,
                        child: TopLayout(
                          helpIsVisible: false,
                          questionMarkIsVisible: false,
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: screenWidth * 0.5,
                                  child: AspectRatio(
                                    aspectRatio: 1 / 1,
                                    child: Stack(
                                      children: [
                                        Container(
                                          child: SvgPicture.asset(
                                            MyAssets.spinCountBackground,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Center(
                                          child: Stack(
                                            alignment: Alignment.bottomCenter,
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 8),
                                                child: AutoSizeText(
                                                  "2",
                                                  minFontSize: 30,
                                                  maxFontSize: 105,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    fontSize: 105,
                                                    color: Colors.white,
                                                    fontFamily: Fonts.exo2Black,
                                                    height: 1,
                                                  ),
                                                ),
                                              ),
                                              AutoSizeText(
                                                "spins",
                                                maxLines: 1,
                                                maxFontSize: 19,
                                                minFontSize: 12,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily:
                                                      Fonts.exo2ExtraBold,
                                                  fontSize: 19,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 16),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      sprintf(Strings.spinCountHint, ["2"]),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: Fonts.exo2Black,
                                        fontSize: 16,
                                        color: AppColors.orange,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Center(
                                  child: GestureDetector(
                                    //onTap: () => {navigate()},
                                    onTap: navigate,
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxHeight: 57,
                                      ),
                                      child: Container(
                                        child: CustomChild.goButton(
                                          mWidth: screenWidth * 0.5,
                                          mHeight: screenHeight * 0.115,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: GestureDetector(
                                    //onTap: () => {navigate()},
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxHeight: 52,
                                      ),
                                      child: Container(
                                        margin: EdgeInsets.only(top: 12),
                                        child: CustomChild.backButton(
                                          mWidth: screenWidth * 0.4,
                                          mHeight: screenHeight * 0.08,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
