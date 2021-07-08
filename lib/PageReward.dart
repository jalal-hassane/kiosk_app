import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'LayoutTop.dart';
import 'LayoutTriangles.dart';
import 'MyAssets.dart';
import 'MyColors.dart';
import 'MyCustomChild.dart';
import 'MyFonts.dart';
import 'MyTexts.dart';

class PageReward extends StatefulWidget {
  PageReward({Key? key, required this.title, required this.prizes})
      : super(key: key);
  final String title;
  final List<String> prizes;

  @override
  _PageReward createState() => _PageReward(prizes);
}

class _PageReward extends State<PageReward> with TickerProviderStateMixin {
  var prizesCount = 0;
  late List<String> mPrizes;
  var screenHeight = 0.0; // device screen height
  var screenWidth = 0.0; // device screen width
  var statusBarHeight = 0.0;
  var prizeBackground = MyAssets.backgroundPrize1;
  var mScale = 0.0;

  late AnimationController _controller;
  var _tween = Tween<double>(begin: 0, end: 1.0);

  _PageReward(List<String> prizes) {
    mPrizes = prizes;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    animatePrizeBackground(prizeBackground);
    showFinish();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 500),
        vsync: this,
        animationBehavior: AnimationBehavior.preserve);
    //final curve = CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);
    _tween..animate(_controller);
  }

  void animatePrizeBackground(String background) {
    Future.delayed(
        Duration(
          milliseconds: 125,
        ), () {
      setState(() {
        prizeBackground = background;
        if (prizeBackground == MyAssets.backgroundPrize1) {
          animatePrizeBackground(MyAssets.backgroundPrize2);
        } else {
          animatePrizeBackground(MyAssets.backgroundPrize1);
        }
      });
    });
  }

  void showFinish() {
    Future.delayed(
        Duration(
          seconds: 5,
        ), () {
      setState(() {
        // set state of scale
        _controller.forward();
      });
    });
  }

  void finishAndRestart() {
    Navigator.popUntil(context, ModalRoute.withName('/'));
  }



  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height; // device screen height
    screenWidth = MediaQuery.of(context).size.width; // device screen width
    statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
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
              Container(
                color: Colors.yellow[200],
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(
                            top: screenHeight * 0.03,
                          ),
                          color: Colors.red,
                          height: 35,
                          width: screenWidth * 0.92,
                          child: TopLayout(
                            helpIsVisible: false,
                            questionMarkIsVisible: false,
                          ),
                        ),
                      ),
                      Flexible(flex: 1, child: Container()),
                      Flexible(
                        flex: 4,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Center(
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 4),
                                      alignment: Alignment.center,
                                      width: screenWidth * 0.85,
                                      height: screenHeight * 0.2,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            prizeBackground,
                                          ),
                                          fit: BoxFit.fill,
                                        ),
                                        //color: Colors.red,
                                      ),
                                      child: Center(
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: screenHeight * 0.1,
                                          width: screenWidth * 0.74,
                                          child: GridView.count(
                                            crossAxisCount: mPrizes.length >= 4
                                                ? 4
                                                : mPrizes.length,
                                            primary: false,
                                            shrinkWrap: true,
                                            padding: const EdgeInsets.all(5),
                                            children: List.generate(
                                                mPrizes.length, (index) {
                                              return Container(
                                                margin: EdgeInsets.only(
                                                    right: 5,
                                                    top: 5,
                                                    bottom: 5),
                                                decoration: BoxDecoration(
                                                  color: AppColors.orange,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Center(
                                                  child: AutoSizeText(
                                                    mPrizes[index],
                                                    textAlign: TextAlign.center,
                                                    maxLines: 3,
                                                    maxFontSize: 18,
                                                    minFontSize: 7,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18,
                                                      fontFamily:
                                                          Fonts.exo2Black,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.bottomCenter,
                                    padding: EdgeInsets.only(),
                                    child: Image.asset(
                                      MyAssets.youWonBanner,
                                      width: screenWidth * 0.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 5,
                        child: Container(
                          color: Colors.lime,
                          child: Transform.scale(
                            scale: _controller.value,
                            child: Column(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    width: screenWidth * 0.75,
                                    alignment: Alignment.center,
                                    child: AutoSizeText(
                                      Strings.pleaseCollectItems,
                                      minFontSize: 10,
                                      textAlign: TextAlign.center,
                                      maxFontSize: 16,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          height: 1,
                                          fontFamily: Fonts.exo2Black),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 4,
                                  child: GestureDetector(
                                    onTap: finishAndRestart,
                                    child: Container(
                                      margin: EdgeInsets.only(top: 12),
                                      child: CustomChild.backButton(
                                        title: "Finish",
                                        mWidth: screenWidth * 0.4,
                                        mHeight: screenHeight * 0.08,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
