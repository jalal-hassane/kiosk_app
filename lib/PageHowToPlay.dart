import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiosk_app/MyAssets.dart';
import 'package:kiosk_app/MyCustomChild.dart';
import 'package:kiosk_app/PageSpinCount.dart';

import 'LayoutTop.dart';
import 'LayoutTriangles.dart';
import 'MyFonts.dart';
import 'MyStrings.dart';

class PageHowToPlay extends StatefulWidget {
  PageHowToPlay({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HowToPlayPage createState() => _HowToPlayPage();
}

class _HowToPlayPage extends State<PageHowToPlay> {
  void navigate() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => PageSpinCount(title: 'Spin Count')),
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
                                child: Stack(
                                  children: [
                                    TopLayout(
                                      helpIsVisible: false,
                                      questionMarkIsVisible: false,
                                    ),
                                    Center(
                                      child: Text(
                                        Strings.followBelowSteps,
                                        style: TextStyle(
                                          fontFamily: Fonts.exo2Black,
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Center(
                                child: Container(
                                  width: screenWidth * 0.92,
                                  height: screenHeight * 0.75,
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  bottom: screenHeight * 0.05),
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    width: screenWidth * 0.42,
                                                    height: screenHeight * 0.2,
                                                    child: Image.asset(
                                                      MyAssets.screenshotOne,
                                                    ),
                                                  ),
                                                  Positioned.fill(
                                                    child: Container(
                                                      width: screenWidth * 0.4,
                                                      height:
                                                          screenHeight * 0.12,
                                                      child: Align(
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                        child: Stack(
                                                          children: [
                                                            Image.asset(
                                                              MyAssets.imageOne,
                                                              fit: BoxFit.fill,
                                                            ),
                                                            Center(
                                                              child: CustomChild
                                                                  .howToPlayText(
                                                                      Strings
                                                                          .enterInfoText,
                                                                      width: screenWidth *
                                                                          0.25),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  bottom: screenHeight * 0.1),
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    width: screenWidth * 0.42,
                                                    height: screenHeight * 0.2,
                                                    child: Image.asset(
                                                        MyAssets.screenshotTwo),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Container(
                                                      width: screenWidth * 0.4,
                                                      height:
                                                          screenHeight * 0.12,
                                                      child: Stack(
                                                        children: [
                                                          Image.asset(
                                                            MyAssets.imageTwo,
                                                            fit: BoxFit.fill,
                                                          ),
                                                          Center(
                                                            child: CustomChild
                                                                .howToPlayText(
                                                                    Strings
                                                                        .selectRaffleText,
                                                                    width:
                                                                        screenWidth *
                                                                            0.25),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: screenHeight * 0.1),
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    width: screenWidth * 0.42,
                                                    height: screenHeight * 0.2,
                                                    child: Image.asset(MyAssets
                                                        .screenshotThree),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Container(
                                                      width: screenWidth * 0.4,
                                                      height:
                                                          screenHeight * 0.12,
                                                      child: Stack(
                                                        children: [
                                                          Image.asset(
                                                            MyAssets.imageThree,
                                                            fit: BoxFit.fill,
                                                          ),
                                                          Center(
                                                            child: CustomChild
                                                                .howToPlayText(
                                                                    Strings
                                                                        .spinWheelText,
                                                                    width:
                                                                        screenWidth *
                                                                            0.25),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: screenHeight * 0.05),
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    width: screenWidth * 0.42,
                                                    height: screenHeight * 0.2,
                                                    child: Image.asset(MyAssets
                                                        .screenshotFour),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Container(
                                                      width: screenWidth * 0.4,
                                                      height:
                                                          screenHeight * 0.12,
                                                      child: Stack(
                                                        children: [
                                                          Image.asset(
                                                            MyAssets.imageFour,
                                                            fit: BoxFit.fill,
                                                          ),
                                                          Center(
                                                            child: CustomChild
                                                                .howToPlayText(
                                                                    Strings
                                                                        .claimPrizeText,
                                                                    width:
                                                                        screenWidth *
                                                                            0.25),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  /*child: Column(
                                    children: [
                                      Container(
                                        height: screenHeight * 0.28,
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Stack(
                                                children: [
                                                  Container(
                                                    width: screenWidth * 0.42,
                                                    height: screenHeight * 0.2,
                                                    child: Image.asset(
                                                        MyAssets.screenshotOne),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Container(
                                                      width: screenWidth * 0.4,
                                                      height:
                                                          screenHeight * 0.12,
                                                      child: Stack(
                                                        children: [
                                                          Image.asset(
                                                            MyAssets.imageOne,
                                                            fit: BoxFit.fill,
                                                          ),
                                                          Center(
                                                            child: CustomChild
                                                                .howToPlayText(
                                                                    Strings
                                                                        .enterInfoText,
                                                                    width:
                                                                        screenWidth *
                                                                            0.25),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Stack(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top:
                                                            screenHeight * 0.1),
                                                    width: screenWidth * 0.42,
                                                    height: screenHeight * 0.2,
                                                    child: Image.asset(
                                                        MyAssets.screenshotTwo),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Container(
                                                      width: screenWidth * 0.4,
                                                      height:
                                                          screenHeight * 0.12,
                                                      child: Stack(
                                                        children: [
                                                          Image.asset(
                                                            MyAssets.imageTwo,
                                                            fit: BoxFit.fill,
                                                          ),
                                                          Center(
                                                            child: CustomChild
                                                                .howToPlayText(
                                                                    Strings
                                                                        .selectRaffleText,
                                                                    width:
                                                                        screenWidth *
                                                                            0.25),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: screenHeight * 0.28,
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Stack(
                                                children: [
                                                  Container(
                                                    width: screenWidth * 0.42,
                                                    height: screenHeight * 0.2,
                                                    child: Image.asset(MyAssets
                                                        .screenshotThree),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Container(
                                                      width: screenWidth * 0.4,
                                                      height:
                                                          screenHeight * 0.12,
                                                      child: Stack(
                                                        children: [
                                                          Image.asset(
                                                            MyAssets.imageThree,
                                                            fit: BoxFit.fill,
                                                          ),
                                                          Center(
                                                            child: CustomChild
                                                                .howToPlayText(
                                                                    Strings
                                                                        .spinWheelText,
                                                                    width:
                                                                        screenWidth *
                                                                            0.25),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Stack(
                                                children: [
                                                  Container(
                                                    width: screenWidth * 0.42,
                                                    height: screenHeight * 0.2,
                                                    child: Image.asset(MyAssets
                                                        .screenshotFour),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Container(
                                                      width: screenWidth * 0.4,
                                                      height:
                                                          screenHeight * 0.12,
                                                      child: Stack(
                                                        children: [
                                                          Image.asset(
                                                            MyAssets.imageFour,
                                                            fit: BoxFit.fill,
                                                          ),
                                                          Center(
                                                            child: CustomChild
                                                                .howToPlayText(
                                                                    Strings
                                                                        .claimPrizeText,
                                                                    width:
                                                                        screenWidth *
                                                                            0.25),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),*/
                                ),
                              ),
                              Center(
                                child: GestureDetector(
                                  //onTap: () => {navigate()},
                                  onTap: navigate,
                                  child: ConstrainedBox(
                                    constraints: const BoxConstraints(
                                      maxHeight: 57,
                                    ),
                                    child: Container(
                                      child: CustomChild.goButton(
                                        mWidth: screenWidth * 0.6,
                                        mHeight: screenHeight * 0.115,
                                      ),
                                    ),
                                  ),
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
    );
  }
}
