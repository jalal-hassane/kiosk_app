import 'dart:async';

import 'package:animator/animator.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiosk_app/PageReward.dart';

import 'LayoutTop.dart';
import 'LayoutTriangles.dart';
import 'MyAssets.dart';
import 'MyColors.dart';
import 'MyFonts.dart';
import 'MyStyles.dart';
import 'MyTexts.dart';

class PageSpinner extends StatefulWidget {
  PageSpinner({Key? key, required this.title, required this.count})
      : super(key: key);
  final String title;
  final int count;

  @override
  _PageSpinner createState() => _PageSpinner(count);
}

class _PageSpinner extends State<PageSpinner> with TickerProviderStateMixin {
  int remainingSpins = 0;
  int itemCount = 0;

  bool spinAgainVisibility = false;
  var spinAgainWidth = 0.0;
  var scaleDownFlag = false;
  var isAnimating = false;
  var onEndSpinAgainWidth = 0.0;
  StreamController<int> controller = StreamController<int>();
  AudioPlayer player = AudioPlayer();
  AudioCache cache = AudioCache();
  final assetsAudioPlayer = AssetsAudioPlayer();

  final listKey = GlobalKey<AnimatedListState>();
  final animatorKey = AnimatorKey<double>();

  bool showPrize = false;
  String spinnerBackground = MyAssets.spinnerBackground;
  final colorList = [
    Colors.red,
    Colors.yellow,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.black,
    Colors.lime
  ];
  final prizeList = <String>[
    "iPhone 12",
    "iPad 2020",
    "Animal Book",
    "Music Book",
    "Puppy Toy",
    "Tickets",
    "Lenovo Legion",
    "Kia Sportage"
  ];

  var rootDisabled = false;

  var hasWon = <String>[];

  var hasWonIndex = 0;
  var prizeIndex = Fortune.randomInt(0, 7);

  late Timer timer;
  var _tween = Tween<double>(begin: 0.0, end: 1.2);
  late AnimationController _scaleAnimationController;

  var animateCounter = 0;
  final _controllers = <AnimationController>[];

  _PageSpinner(int count) {
    remainingSpins = count;
    itemCount = count;
    hasWon = List.filled(itemCount, '');
  }

  @override
  void dispose() {
    controller.close();
    for (AnimationController c in _controllers) {
      c.dispose();
    }
    _scaleAnimationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controllers.add(_controller());
    _controllers.add(_controller());
    _controllers.add(_controller());
    _controllers.add(_controller());

    _scaleAnimationController = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 1000,
        ),
        animationBehavior: AnimationBehavior.preserve,
        lowerBound: 0.0,
        upperBound: 1.2);

    _tween.animate(_scaleAnimationController);
  }

  void navigate() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => PageReward(
            title: 'Page Reward',
            prizes: hasWon,
          )),
    );
  }

  var screenHeight = 0.0; // device screen height
  var screenWidth = 0.0; // device screen width
  var statusBarHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height; // device screen height
    screenWidth = MediaQuery.of(context).size.width; // device screen width
    statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: SafeArea(
        child: Container(
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
                              Strings.spinWheelText,
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 16,
                          ),
                          height: 65,
                          width: screenWidth * 0.5,
                          child: Stack(
                            children: [
                              SvgPicture.asset(
                                MyAssets.backgroundBack,
                                fit: BoxFit.fill,
                              ),
                              Column(
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: AutoSizeText(
                                        '$remainingSpins',
                                        maxFontSize: 30,
                                        minFontSize: 16,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 30,
                                          color: AppColors.yellow,
                                          fontFamily: Fonts.exo2Black,
                                          height: 1,
                                        ),
                                      ),
                                    ),
                                    flex: 2,
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        Strings.remainingSpins,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: Fonts.exo2ExtraBold,
                                          color: Colors.white,
                                          height: 1,
                                        ),
                                      ),
                                    ),
                                    flex: 1,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.green,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(
                                child: Container(
                                  color: Colors.red,
                                  alignment: Alignment.center,
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Container(
                                          height: screenHeight * 0.1,
                                          decoration: BoxDecoration(
                                            color:
                                            AppColors.spinnerTipBackground,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Container(
                                          margin: EdgeInsets.only(
                                            top: screenHeight * 0.05,
                                          ),
                                          width: screenWidth * 0.9,
                                          child: AspectRatio(
                                            aspectRatio: 1 / 1,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    spinnerBackground,
                                                  ),
                                                ),
                                              ),
                                              width: screenWidth * 0.792,
                                              //height: 200,
                                              child: Stack(
                                                children: [
                                                  AbsorbPointer(
                                                    absorbing: rootDisabled,
                                                    child: Container(
                                                      margin:
                                                      EdgeInsets.all(22),
                                                      child: FortuneWheel(
                                                        duration: Duration(
                                                          seconds: 5,
                                                        ),
                                                        onFling: () {
                                                          controller.add(
                                                            prizeIndex,
                                                          );
                                                        },
                                                        indicators: [
                                                          FortuneIndicator(
                                                            alignment: Alignment
                                                                .center,
                                                            child:
                                                            FractionallySizedBox(
                                                              heightFactor: 0.1,
                                                              child: SvgPicture
                                                                  .asset(
                                                                MyAssets
                                                                    .spinnerMSvg,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                        animateFirst: true,
                                                        physics:
                                                        CircularPanPhysics(
                                                          duration: Duration(
                                                            seconds: 1,
                                                          ),
                                                          curve:
                                                          Curves.decelerate,
                                                        ),
                                                        onAnimationStart: () {
                                                          //start the sound
                                                          animationStart();
                                                        },
                                                        onAnimationEnd: () {
                                                          // stop sound and animate prize
                                                          animationEnd();
                                                        },
                                                        //selected: Stream.value(0),
                                                        items: [
                                                          for (int i = 0;
                                                          i <
                                                              prizeList
                                                                  .length;
                                                          i++)
                                                            fortuneItemBuilder(
                                                              prize:
                                                              prizeList[i],
                                                              color:
                                                              colorList[i],
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      spinAgain();
                                                    },
                                                    child: Center(
                                                      child:
                                                      Animator<double>(
                                                        duration: Duration(
                                                          milliseconds: 500,
                                                        ),
                                                        statusListener:
                                                            (status,
                                                            state) {},
                                                        animatorKey:
                                                        animatorKey,
                                                        tween: _tween,
                                                        curve: Curves
                                                            .fastOutSlowIn,
                                                        triggerOnInit:
                                                        false,
                                                        builder: (_,
                                                            animationState,
                                                            __) =>
                                                            Transform.scale(
                                                              scale:
                                                              animationState
                                                                  .value,
                                                              child: Center(
                                                                child: Container(
                                                                  width:
                                                                  screenWidth * 0.3,
                                                                  decoration:
                                                                  BoxDecoration(
                                                                    color: AppColors
                                                                        .orange,
                                                                    shape:
                                                                    BoxShape.circle,
                                                                  ),
                                                                  child: Stack(
                                                                    children: [
                                                                      Container(
                                                                        decoration:
                                                                        BoxDecoration(
                                                                          color: AppColors
                                                                              .buttonSeparator,
                                                                          shape: BoxShape
                                                                              .circle,
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        margin: EdgeInsets
                                                                            .only(
                                                                            bottom:
                                                                            4),
                                                                        decoration:
                                                                        BoxDecoration(
                                                                          color: AppColors
                                                                              .orange,
                                                                          shape: BoxShape
                                                                              .circle,
                                                                          gradient:
                                                                          LinearGradient(
                                                                            colors: [
                                                                              AppColors.gradientStartColor,
                                                                              AppColors.gradientMidColor,
                                                                              AppColors.gradientEndColor,
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Center(
                                                                        child: Column(
                                                                          mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                          mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                          children: [
                                                                            SvgPicture
                                                                                .asset(
                                                                              MyAssets
                                                                                  .refreshSvg,
                                                                              height:
                                                                              screenWidth *
                                                                                  0.15,
                                                                            ),
                                                                            AutoSizeText(
                                                                              Strings
                                                                                  .spinAgain,
                                                                              maxLines:
                                                                              1,
                                                                              maxFontSize:
                                                                              14,
                                                                              minFontSize:
                                                                              7,
                                                                              style:
                                                                              TextStyle(
                                                                                color: Colors
                                                                                    .black,
                                                                                fontFamily:
                                                                                Fonts.exo2Black,
                                                                                fontSize:
                                                                                14,
                                                                                height:
                                                                                1,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: screenWidth * 0.5 -
                                            screenHeight * 0.05,
                                        height: screenHeight * 0.1,
                                        child: Container(
                                          margin: EdgeInsets.only(
                                            top: screenHeight * 0.01,
                                          ),
                                          child: SvgPicture.asset(
                                            MyAssets.tipSvg,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Center(
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxHeight: 90,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors
                                          .prizesRecyclerViewBackground,
                                    ),
                                    margin: EdgeInsets.only(
                                      top: 10,
                                      bottom: 10,
                                    ),
                                    padding: EdgeInsets.only(
                                      left: 5,
                                      right: 5,
                                    ),
                                    width: screenWidth * 0.9,
                                    child: builder(),
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  void spinAgain() {
    setState(() {
      // todo add rootDisabled = false; when fortune wheel works fine

      animatorKey.controller
          .forward(from: 0.6)
          .whenComplete(() => {animatorKey.controller.reverse()});

      // todo remove the line below
      animateSpinnerBackground(MyAssets.spinnerBackgroundOn);
    });
  }

  AnimatedList builder() {
    return AnimatedList(
        key: listKey,
        initialItemCount: itemCount,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index, animation) {
          return listItem(
              text: hasWon[index], index: index, showPrize: showPrize);
        });
  }

  // listView item
  Container listItem(
      {String text = "", int index = 0, bool showPrize = false}) {
    final screenWidth =
        MediaQuery.of(context).size.width; // device screen width
    return Container(
      margin: EdgeInsets.only(right: 5, top: 5, bottom: 5),
      width: itemCount >= 3 ? screenWidth * 0.3 : screenWidth * 0.9 / itemCount,
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.orange,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Stack(
          children: [
            Center(
              child: AutoSizeText(
                text,
                textAlign: TextAlign.center,
                maxLines: 3,
                maxFontSize: 18,
                minFontSize: 7,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: Fonts.exo2Black,
                ),
              ),
            ),
            SlideTransition(
              position: getOffset(text, index),
              child: Container(
                width: itemCount >= 3
                    ? screenWidth * 0.3
                    : screenWidth * 0.9 / itemCount,
                decoration: BoxDecoration(
                  color: AppColors.grayUnknown,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 15,
                    bottom: 15,
                  ),
                  child: Image.asset(MyAssets.ivQuestion),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimationController _controller() {
    return AnimationController(
        duration: const Duration(seconds: 1),
        vsync: this,
        animationBehavior: AnimationBehavior.preserve);
  }

  Animation<Offset> getOffset(String text, int index) {
    return Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0.0, text.isEmpty ? 0 : -1.1),
    ).animate(_controllers[index]);
  }

  void animationStart() {
    setState(() {
      rootDisabled = true;
    });
  }

  void animationEnd() {
    setState(() {
      animateSpinnerBackground(MyAssets.spinnerBackgroundOn);
    });
  }

  var counter = 0;

  void animateSpinnerBackground(String background) {
    Future.delayed(
        Duration(
          milliseconds: 125,
        ), () {
      setState(() {
        if (counter == 18) {
          spinnerBackground = MyAssets.spinnerBackground;
          counter = 0;
          animatePrize();
          return;
        }
        spinnerBackground = background;
        if (spinnerBackground == MyAssets.spinnerBackgroundOn) {
          animateSpinnerBackground(MyAssets.spinnerBackgroundOff);
        } else {
          animateSpinnerBackground(MyAssets.spinnerBackgroundOn);
        }
        counter++;
      });
    });
  }

  void animatePrize() {
    setState(() {
      remainingSpins--;
      print("Remaining $remainingSpins");
      print("Index $prizeIndex");
      print("hasWonIndex $hasWonIndex");
      hasWon[hasWonIndex] = prizeList[prizeIndex];
      _controllers[hasWonIndex]
          .forward()
          .whenComplete(() => {updateUiAfterAnimatingPrize()});

      hasWonIndex++;
      prizeIndex = Fortune.randomInt(0, prizeList.length);
    });
  }

  void updateUiAfterAnimatingPrize() {
    if (remainingSpins == 0) {
      navigate();
      return;
    } else {
      setState(() {
        animatorKey.controller.forward().whenComplete(() => {
          animatorKey.controller.animateBack(
            0.6,
            duration: Duration(milliseconds: 300),
          )
        });
        //todo remove this absorber later
        rootDisabled = false;
      });
    }
  }

  FortuneItem fortuneItemBuilder(
      {String prize = "", Color color = Colors.white}) {
    return FortuneItem(
      child: AutoSizeText(
        prize,
        maxLines: 1,
        maxFontSize: 17,
        minFontSize: 10,
        style: Styles.infoPageTitleTextStyle,
      ),
      style: FortuneItemStyle(
        color: color,
        borderColor: Colors.transparent,
        borderWidth: 1,
      ),
    );
  }
}