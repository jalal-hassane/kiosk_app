import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kiosk_app/LayoutTop.dart';
import 'package:kiosk_app/LayoutTriangles.dart';
import 'package:kiosk_app/MyAssets.dart';
import 'package:kiosk_app/MyColors.dart';
import 'package:kiosk_app/MyCustomChild.dart';
import 'package:kiosk_app/MyDecorations.dart';
import 'package:kiosk_app/MyFonts.dart';

import 'MyStrings.dart';
import 'PageHowToPlay.dart';

class PageInfo extends StatefulWidget {
  PageInfo({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _InfoPage createState() => _InfoPage();
}

class _InfoPage extends State<PageInfo> {
  void navigate() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => PageHowToPlay(title: 'How to play')),
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
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              //margin: EdgeInsets.only(top: statusBarHeight),
              width: screenWidth,
              height: screenHeight,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    MyAssets.finalBackground,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Stack(
                        children: [
                          Container(
                            color: Colors.transparent,
                            child: Triangles(),
                            height: screenHeight - statusBarHeight,
                            width: screenWidth,
                          ),
                          Center(
                            child: Column(
                              children: [
                                Container(
                                  margin:
                                      EdgeInsets.only(top: screenHeight * 0.03),
                                  color: Colors.transparent,
                                  height: 35,
                                  width: screenWidth * 0.92,
                                  child: TopLayout(
                                    helpIsVisible: false,
                                    questionMarkIsVisible: false,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 4),
                                  child: Text(
                                    Strings.enterInformation,
                                    style: TextStyle(
                                      fontFamily: Fonts.exo2Regular,
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 20,
                                  ),
                                  width: screenWidth * 0.9,
                                  alignment: Alignment.center,
                                  child: Wrap(
                                    spacing: 10,
                                    children: [
                                      Container(
                                        child: Wrap(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                child: Wrap(
                                                  children: [
                                                    CustomChild
                                                        .topLeftAlignedText(
                                                            Strings.fullName),
                                                    Container(
                                                      height: 45,
                                                      decoration: Decorations
                                                          .rounded8WhiteBackground,
                                                      child: CustomChild
                                                          .infoPageInputText,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                child: Wrap(
                                                  children: [
                                                    CustomChild
                                                        .topLeftAlignedText(
                                                            Strings.mobileNumber),
                                                    Container(
                                                      height: 45,
                                                      decoration: Decorations
                                                          .rounded8WhiteBackground,
                                                      child: CustomChild
                                                          .infoPageInputText,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                child: Wrap(
                                                  children: [
                                                    CustomChild
                                                        .topLeftAlignedText(
                                                            Strings.emailAddress),
                                                    Container(
                                                      height: 45,
                                                      decoration: Decorations
                                                          .rounded8WhiteBackground,
                                                      child: CustomChild
                                                          .infoPageInputText,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 8, left: 4),
                                        child: Text(
                                          Strings.mandatoryHint,
                                          style: TextStyle(
                                            color: AppColors.mandatoryHintColor,
                                            fontFamily: Fonts.exo2Regular,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: navigate,
                                        child: CustomChild.goButton(
                                            mWidth: screenWidth * 0.5,
                                            mHeight: 55,
                                            marginTop: 30),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
