import 'dart:async';
import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutter_svg/svg.dart';

import 'MyAssets.dart';
import 'MyStyles.dart';

class PageSpinnerPackageTest extends StatefulWidget {
  PageSpinnerPackageTest({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _PageSpinnerPackageTest createState() => _PageSpinnerPackageTest();
}

class _PageSpinnerPackageTest extends State<PageSpinnerPackageTest> {
  int remainingSpins = 2;
  bool spinAgainVisibility = true;
  int itemCount = 4;
  StreamController<int> controller = StreamController<int>();

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight =
        MediaQuery.of(context).size.height; // device screen height
    final screenWidth =
        MediaQuery.of(context).size.width; // device screen width
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Center(
        child: Container(
          child: FortuneWheel(
            indicators: [
              FortuneIndicator(
                alignment: Alignment.center,
                child: FractionallySizedBox(
                  heightFactor: 0.1,
                  child: SvgPicture.asset(
                    MyAssets.spinnerMSvg,
                    fit: BoxFit.contain,
                  ),
                ),
              )
            ],
            animateFirst: false,
            physics: CircularPanPhysics(
              duration: Duration(seconds: 1),
              curve: Curves.decelerate,
            ),
            onFling: () {
              controller.add(Fortune.randomInt(0, 7));
            },
            onAnimationStart: () {
              //start the sound
            },
            onAnimationEnd: () {
              // stop sound and animate prize
            },
            //selected: Stream.value(0),
            items: [
              FortuneItem(
                child: AutoSizeText(
                  'iPhone 12',
                  maxLines: 1,
                  maxFontSize: 17,
                  minFontSize: 10,
                  style: Styles.infoPageTitleTextStyle,
                ),
                style: FortuneItemStyle(
                  color: Colors.red,
                  // <-- custom circle slice fill color
                  borderColor: Colors.transparent,
                  // <-- custom circle slice stroke color
                  borderWidth: 1, // <-- custom circle slice stroke width
                ),
              ),
              FortuneItem(
                child: AutoSizeText(
                  'iPad 2020',
                  maxLines: 1,
                  maxFontSize: 17,
                  minFontSize: 10,
                  style: Styles.infoPageTitleTextStyle,
                ),
                style: FortuneItemStyle(
                  color: Colors.yellow,
                  // <-- custom circle slice fill color
                  borderColor: Colors.transparent,
                  // <-- custom circle slice stroke color
                  borderWidth: 1, // <-- custom circle slice stroke width
                ),
              ),
              FortuneItem(
                child: AutoSizeText(
                  'Animal Book',
                  maxLines: 1,
                  maxFontSize: 17,
                  minFontSize: 10,
                  style: Styles.infoPageTitleTextStyle,
                ),
                style: FortuneItemStyle(
                  color: Colors.blue,
                  // <-- custom circle slice fill color
                  borderColor: Colors.transparent,
                  // <-- custom circle slice stroke color
                  borderWidth: 1, // <-- custom circle slice stroke width
                ),
              ),
              FortuneItem(
                child: AutoSizeText(
                  'Music Book',
                  maxLines: 1,
                  maxFontSize: 17,
                  minFontSize: 10,
                  style: Styles.infoPageTitleTextStyle,
                ),
                style: FortuneItemStyle(
                  color: Colors.orange,
                  // <-- custom circle slice fill color
                  borderColor: Colors.transparent,
                  // <-- custom circle slice stroke color
                  borderWidth: 3, // <-- custom circle slice stroke width
                ),
              ),
              FortuneItem(
                child: AutoSizeText(
                  'Puppy Toy',
                  maxLines: 1,
                  maxFontSize: 17,
                  minFontSize: 10,
                  style: Styles.infoPageTitleTextStyle,
                ),
                style: FortuneItemStyle(
                  color: Colors.purple,
                  // <-- custom circle slice fill color
                  borderColor: Colors.transparent,
                  // <-- custom circle slice stroke color
                  borderWidth: 1, // <-- custom circle slice stroke width
                ),
              ),
              FortuneItem(
                child: AutoSizeText(
                  'Tickets',
                  maxLines: 1,
                  maxFontSize: 17,
                  minFontSize: 10,
                  style: Styles.infoPageTitleTextStyle,
                ),
                style: FortuneItemStyle(
                  color: Colors.pink,
                  // <-- custom circle slice fill color
                  borderColor: Colors.transparent,
                  // <-- custom circle slice stroke color
                  borderWidth: 1, // <-- custom circle slice stroke width
                ),
              ),
              FortuneItem(
                child: Container(
                  alignment: Alignment.center,
                  child: AutoSizeText(
                    'Lenovo Legion 2020',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    maxFontSize: 17,
                    minFontSize: 10,
                    style: Styles.infoPageTitleTextStyle,
                  ),
                ),
                style: FortuneItemStyle(
                  color: Colors.black,
                  // <-- custom circle slice fill color
                  borderColor: Colors.transparent,
                  // <-- custom circle slice stroke color
                  borderWidth: 1, // <-- custom circle slice stroke width
                ),
              ),
              FortuneItem(
                child: Container(
                  child: AutoSizeText(
                    'Kia Sportage 2021',
                    maxLines: 2,
                    maxFontSize: 17,
                    minFontSize: 10,
                    style: Styles.infoPageTitleTextStyle,
                  ),
                ),
                style: FortuneItemStyle(
                  color: Colors.lime,
                  //textStyle: Styles.infoPageTitleTextStyle,
                  // <-- custom circle slice fill color
                  borderColor: Colors.transparent,
                  // <-- custom circle slice stroke color
                  borderWidth: 1, // <-- custom circle slice stroke width
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
