import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiosk_app/custom/MyAssets.dart';
import 'package:kiosk_app/custom/MyCustomChild.dart';
import 'package:kiosk_app/ui/PageSpinCount.dart';

import '../custom/MyFonts.dart';
import '../custom/MyTexts.dart';
import '../ui/LayoutTriangles.dart';
import 'LayoutTop.dart';

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
                  MyAssets.backgroundFinal,
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
                                margin: EdgeInsets.only(
                                  top: screenHeight * 0.03,
                                ),
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
                                          height: 1,
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
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                alignment: Alignment.center,
                                                child: Stack(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                        bottom:
                                                            screenHeight * 0.06,
                                                      ),
                                                      width: screenWidth * 0.42,
                                                      height:
                                                          screenHeight * 0.2,
                                                      child: Image.asset(
                                                        MyAssets.screenshotOne,
                                                      ),
                                                    ),
                                                    Container(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      width: screenWidth * 0.4,
                                                      height:
                                                          screenHeight * 0.12,
                                                      child: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Container(
                                                            child: Image.asset(
                                                              MyAssets.imageOne,
                                                            ),
                                                          ),
                                                          Wrap(
                                                            children: [
                                                              Container(
                                                                margin:
                                                                    EdgeInsets
                                                                        .only(
                                                                  bottom:
                                                                      screenHeight *
                                                                          0.035,
                                                                ),
                                                                child: Center(
                                                                  child: CustomChild
                                                                      .howToPlayText(
                                                                    Strings
                                                                        .enterInfoText,
                                                                    width:
                                                                        screenWidth *
                                                                            0.25,
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
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                alignment: Alignment.topCenter,
                                                child: Stack(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                        bottom:
                                                            screenHeight * 0.06,
                                                      ),
                                                      width: screenWidth * 0.42,
                                                      height:
                                                          screenHeight * 0.2,
                                                      child: Image.asset(
                                                        MyAssets
                                                            .screenshotThree,
                                                      ),
                                                    ),
                                                    Container(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      width: screenWidth * 0.4,
                                                      height:
                                                          screenHeight * 0.12,
                                                      child: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Container(
                                                            child: Image.asset(
                                                              MyAssets
                                                                  .imageThree,
                                                            ),
                                                          ),
                                                          Wrap(
                                                            children: [
                                                              Container(
                                                                margin:
                                                                    EdgeInsets
                                                                        .only(
                                                                  bottom:
                                                                      screenHeight *
                                                                          0.035,
                                                                ),
                                                                child: Center(
                                                                  child: CustomChild
                                                                      .howToPlayText(
                                                                    Strings
                                                                        .spinWheelText,
                                                                    width:
                                                                        screenWidth *
                                                                            0.25,
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
                                      Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              flex: 6,
                                              child: Container(
                                                child: Stack(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                        bottom:
                                                            screenHeight * 0.06,
                                                      ),
                                                      width: screenWidth * 0.42,
                                                      height:
                                                          screenHeight * 0.2,
                                                      child: Image.asset(
                                                        MyAssets.screenshotTwo,
                                                      ),
                                                    ),
                                                    Container(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      width: screenWidth * 0.4,
                                                      height:
                                                          screenHeight * 0.12,
                                                      child: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Container(
                                                            child: Image.asset(
                                                              MyAssets.imageTwo,
                                                            ),
                                                          ),
                                                          Wrap(
                                                            children: [
                                                              Container(
                                                                margin:
                                                                    EdgeInsets
                                                                        .only(
                                                                  bottom:
                                                                      screenHeight *
                                                                          0.035,
                                                                  left: 16,
                                                                ),
                                                                child: Center(
                                                                  child: CustomChild
                                                                      .howToPlayText(
                                                                    Strings
                                                                        .selectRaffleText,
                                                                    width:
                                                                        screenWidth *
                                                                            0.25,
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
                                            Expanded(
                                              flex: 4,
                                              child: Container(
                                                child: Stack(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: screenHeight *
                                                              0.06),
                                                      width: screenWidth * 0.42,
                                                      height:
                                                          screenHeight * 0.2,
                                                      child: Image.asset(
                                                        MyAssets.screenshotFour,
                                                      ),
                                                    ),
                                                    Container(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      width: screenWidth * 0.4,
                                                      height:
                                                          screenHeight * 0.12,
                                                      child: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Container(
                                                            child: Image.asset(
                                                              MyAssets
                                                                  .imageFour,
                                                            ),
                                                          ),
                                                          Wrap(
                                                            children: [
                                                              Container(
                                                                margin:
                                                                    EdgeInsets
                                                                        .only(
                                                                  bottom:
                                                                      screenHeight *
                                                                          0.035,
                                                                ),
                                                                child: Center(
                                                                  child: CustomChild
                                                                      .howToPlayText(
                                                                    Strings
                                                                        .claimPrizeText,
                                                                    width:
                                                                        screenWidth *
                                                                            0.25,
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
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: screenHeight * 0.1,
                                alignment: Alignment.bottomCenter,
                                child: GestureDetector(
                                  //onTap: () => {navigate()},
                                  onTap: navigate,
                                  child: ConstrainedBox(
                                    constraints: const BoxConstraints(
                                      maxHeight: 57,
                                    ),
                                    child: CustomChild.goButton(
                                      mWidth: screenWidth * 0.6,
                                      mHeight: screenHeight *
                                          0.115, //not needed since maxHeight is set
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
