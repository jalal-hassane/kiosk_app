import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiosk_app/MyColors.dart';
import 'package:kiosk_app/MyDecorations.dart';
import 'package:kiosk_app/MyFonts.dart';
import 'package:kiosk_app/MyStrings.dart';
import 'package:kiosk_app/PageSpinner.dart';
import 'package:kiosk_app/PageSpinnerPackageTest.dart';

import 'LayoutTop.dart';
import 'LayoutTriangles.dart';
import 'MyAssets.dart';
import 'MyCustomChild.dart';

class PageRaffle extends StatefulWidget {
  PageRaffle({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _PageRaffle createState() => _PageRaffle();
}

class _PageRaffle extends State<PageRaffle> {
  int counter250 = 0, counter500 = 0, counter1000 = 0, balance = 1000;
  double proceedAlpha = 0.5,
      minus1000Alpha = 1,
      plus1000Alpha = 1,
      minus500Alpha = 1,
      plus500Alpha = 1,
      minus250Alpha = 1,
      plus250Alpha = 1;

  bool absorbingPlus250 = false,
      absorbingMinus250 = true,
      absorbingPlus500 = false,
      absorbingMinus500 = true,
      absorbingPlus1000 = false,
      absorbingMinus1000 = true,
      absorbingProceed = true;

  void navigate() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PageSpinner(title: 'Spinner')),
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
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: screenHeight * 0.03,
                      ),
                      color: Colors.transparent,
                      height: 35,
                      width: screenWidth * 0.92,
                      child: TopLayout(
                        helpIsVisible: false,
                        questionMarkIsVisible: false,
                      ),
                    ),
                    Text(
                      Strings.raffleTitle,
                      style: TextStyle(
                        fontFamily: Fonts.exo2Black,
                        fontSize: 16,
                        color: Colors.white,
                        height: 1,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 16,
                      ),
                      padding: EdgeInsets.all(
                        2,
                      ),
                      height: 65,
                      width: screenWidth * 0.6,
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
                                    '$balance',
                                    maxFontSize: 28,
                                    minFontSize: 16,
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 28,
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
                                    Strings.availableCredits,
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
                      height: screenHeight * 0.55,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: screenWidth * 0.92,
                            height: screenHeight * 0.155,
                            padding: EdgeInsets.all(
                              3,
                            ),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  MyAssets.backgroundRaffleListItem,
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  child: SvgPicture.asset(
                                    MyAssets.backgroundRaffleListItem,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                      flex: 3,
                                      child: Center(
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Center(
                                                child: Text(
                                                  Strings.prizeTitle,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontFamily: Fonts.exo2Black,
                                                    height: 1,
                                                  ),
                                                ),
                                              ),
                                              Center(
                                                child: Text(
                                                  Strings.drawDateAndTime,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontFamily:
                                                        Fonts.exo2Medium,
                                                    height: 1,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                decoration: Decorations
                                                    .rounded16Gray2Background,
                                                width: screenWidth * 0.27,
                                                child: Text(
                                                  '250',
                                                  style: TextStyle(
                                                    color: AppColors.yellow,
                                                    fontFamily: Fonts.exo2Black,
                                                    fontSize: 20,
                                                    height: 1,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: Center(
                                        child: Container(
                                          margin: EdgeInsets.only(
                                            top: 3,
                                            bottom: 3,
                                            right: 3,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: AbsorbPointer(
                                                  absorbing: absorbingPlus250,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      addPrize('250');
                                                    },
                                                    child: Opacity(
                                                      opacity: plus250Alpha,
                                                      child: Container(
                                                        decoration: Decorations
                                                            .topRight2Gray2Background,
                                                        child: AspectRatio(
                                                          aspectRatio: 1 / 1,
                                                          child: Center(
                                                            child: SvgPicture
                                                                .asset(
                                                              MyAssets.plusSvg,
                                                              width:
                                                                  screenWidth *
                                                                      0.08,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: AbsorbPointer(
                                                  absorbing: absorbingMinus250,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      removePrize('250');
                                                    },
                                                    child: Opacity(
                                                      opacity: minus250Alpha,
                                                      child: Container(
                                                        decoration: Decorations
                                                            .bottomRight2DarkGrayBackground,
                                                        child: AspectRatio(
                                                          aspectRatio: 1 / 1,
                                                          child: Center(
                                                            child: SvgPicture
                                                                .asset(
                                                              MyAssets.minusSvg,
                                                              width:
                                                                  screenWidth *
                                                                      0.08,
                                                            ),
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
                                  ],
                                ),
                                Positioned(
                                  left: screenWidth * 0.69 -
                                      (screenHeight * 0.02875),
                                  top: screenHeight * 0.02875 +
                                      (screenHeight * 0.014375),
                                  child: Container(
                                    height: screenHeight * 0.0575,
                                    child: AspectRatio(
                                      aspectRatio: 1 / 1,
                                      child: Stack(
                                        children: [
                                          SvgPicture.asset(
                                            MyAssets.backgroundPrizeItemCount,
                                            fit: BoxFit.fill,
                                          ),
                                          Center(
                                            child: AutoSizeText(
                                              '$counter250',
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              maxFontSize: 24,
                                              minFontSize: 16,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: Fonts.exo2Black,
                                                height: 1,
                                                fontSize: 24,
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
                          Container(
                            width: screenWidth * 0.92,
                            height: screenHeight * 0.155,
                            padding: EdgeInsets.all(
                              3,
                            ),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  MyAssets.backgroundRaffleListItem,
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  child: SvgPicture.asset(
                                    MyAssets.backgroundRaffleListItem,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                      flex: 3,
                                      child: Center(
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Center(
                                                child: Text(
                                                  Strings.prizeTitle,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontFamily: Fonts.exo2Black,
                                                    height: 1,
                                                  ),
                                                ),
                                              ),
                                              Center(
                                                child: Text(
                                                  Strings.drawDateAndTime,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontFamily:
                                                        Fonts.exo2Medium,
                                                    height: 1,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                decoration: Decorations
                                                    .rounded16Gray2Background,
                                                width: screenWidth * 0.27,
                                                child: Text(
                                                  '500',
                                                  style: TextStyle(
                                                    color: AppColors.yellow,
                                                    fontFamily: Fonts.exo2Black,
                                                    fontSize: 20,
                                                    height: 1,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: Center(
                                        child: Container(
                                          margin: EdgeInsets.only(
                                            top: 3,
                                            bottom: 3,
                                            right: 3,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: AbsorbPointer(
                                                  absorbing: absorbingPlus500,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      addPrize('500');
                                                    },
                                                    child: Opacity(
                                                      opacity: plus500Alpha,
                                                      child: Container(
                                                        decoration: Decorations
                                                            .topRight2Gray2Background,
                                                        child: AspectRatio(
                                                          aspectRatio: 1 / 1,
                                                          child: Center(
                                                            child: SvgPicture
                                                                .asset(
                                                              MyAssets.plusSvg,
                                                              width:
                                                                  screenWidth *
                                                                      0.08,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: AbsorbPointer(
                                                  absorbing: absorbingMinus500,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      removePrize('500');
                                                    },
                                                    child: Opacity(
                                                      opacity: minus500Alpha,
                                                      child: Container(
                                                        decoration: Decorations
                                                            .bottomRight2DarkGrayBackground,
                                                        child: AspectRatio(
                                                          aspectRatio: 1 / 1,
                                                          child: Center(
                                                            child: SvgPicture
                                                                .asset(
                                                              MyAssets.minusSvg,
                                                              width:
                                                                  screenWidth *
                                                                      0.08,
                                                            ),
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
                                  ],
                                ),
                                Positioned(
                                  left: screenWidth * 0.69 -
                                      (screenHeight * 0.02875),
                                  top: screenHeight * 0.02875 +
                                      (screenHeight * 0.014375),
                                  child: Container(
                                    height: screenHeight * 0.0575,
                                    child: AspectRatio(
                                      aspectRatio: 1 / 1,
                                      child: Stack(
                                        children: [
                                          SvgPicture.asset(
                                            MyAssets.backgroundPrizeItemCount,
                                            fit: BoxFit.fill,
                                          ),
                                          Center(
                                            child: AutoSizeText(
                                              '$counter500',
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              maxFontSize: 24,
                                              minFontSize: 16,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: Fonts.exo2Black,
                                                height: 1,
                                                fontSize: 24,
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
                          Container(
                            width: screenWidth * 0.92,
                            height: screenHeight * 0.155,
                            padding: EdgeInsets.all(
                              3,
                            ),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  MyAssets.backgroundRaffleListItem,
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  child: SvgPicture.asset(
                                    MyAssets.backgroundRaffleListItem,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                      flex: 3,
                                      child: Center(
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Center(
                                                child: Text(
                                                  Strings.prizeTitle,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontFamily: Fonts.exo2Black,
                                                    height: 1,
                                                  ),
                                                ),
                                              ),
                                              Center(
                                                child: Text(
                                                  Strings.drawDateAndTime,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontFamily:
                                                        Fonts.exo2Medium,
                                                    height: 1,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                decoration: Decorations
                                                    .rounded16Gray2Background,
                                                width: screenWidth * 0.27,
                                                child: Text(
                                                  '1000',
                                                  style: TextStyle(
                                                    color: AppColors.yellow,
                                                    fontFamily: Fonts.exo2Black,
                                                    fontSize: 20,
                                                    height: 1,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: Center(
                                        child: Container(
                                          margin: EdgeInsets.only(
                                            top: 3,
                                            bottom: 3,
                                            right: 3,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: AbsorbPointer(
                                                  absorbing: absorbingPlus1000,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      addPrize('1000');
                                                    },
                                                    child: Opacity(
                                                      opacity: plus1000Alpha,
                                                      child: Container(
                                                        decoration: Decorations
                                                            .topRight2Gray2Background,
                                                        child: AspectRatio(
                                                          aspectRatio: 1 / 1,
                                                          child: Center(
                                                            child: SvgPicture
                                                                .asset(
                                                              MyAssets.plusSvg,
                                                              width:
                                                                  screenWidth *
                                                                      0.08,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: AbsorbPointer(
                                                  absorbing: absorbingMinus1000,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      removePrize('1000');
                                                    },
                                                    child: Opacity(
                                                      opacity: minus1000Alpha,
                                                      child: Container(
                                                        decoration: Decorations
                                                            .bottomRight2DarkGrayBackground,
                                                        child: AspectRatio(
                                                          aspectRatio: 1 / 1,
                                                          child: Center(
                                                            child: SvgPicture
                                                                .asset(
                                                              MyAssets.minusSvg,
                                                              width:
                                                                  screenWidth *
                                                                      0.08,
                                                            ),
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
                                  ],
                                ),
                                Positioned(
                                  left: screenWidth * 0.69 -
                                      (screenHeight * 0.02875),
                                  top: screenHeight * 0.02875 +
                                      (screenHeight * 0.014375),
                                  child: Container(
                                    height: screenHeight * 0.0575,
                                    child: AspectRatio(
                                      aspectRatio: 1 / 1,
                                      child: Stack(
                                        children: [
                                          SvgPicture.asset(
                                            MyAssets.backgroundPrizeItemCount,
                                            fit: BoxFit.fill,
                                          ),
                                          Center(
                                            child: AutoSizeText(
                                              '$counter1000',
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              maxFontSize: 24,
                                              minFontSize: 16,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: Fonts.exo2Black,
                                                height: 1,
                                                fontSize: 24,
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
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Wrap(
                        children: [
                          Opacity(
                            opacity: proceedAlpha,
                            child: Center(
                              child: AbsorbPointer(
                                absorbing: absorbingProceed,
                                child: GestureDetector(
                                  //onTap: () => {navigate()},
                                  onTap: navigate,
                                  child: Container(
                                    child: CustomChild.goButton(
                                      text: Strings.proceed,
                                      mWidth: screenWidth * 0.6,
                                      mHeight: screenHeight * 0.08,
                                    ),
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
                              child: Container(
                                margin: EdgeInsets.only(top: 12),
                                child: CustomChild.backButton(
                                  mWidth: screenWidth * 0.4,
                                  mHeight: screenHeight * 0.08,
                                ),
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
        ),
      ),
    );
  }

  void addPrize(String type) {
    setState(() {
      switch (type) {
        case '1000':
          counter1000++;
          balance -= 1000;
          break;
        case '500':
          counter500++;
          balance -= 500;
          break;
        default:
          counter250++;
          balance -= 250;
      }
      checkForAvailableBalance();
      if (counter250 > 0 || counter500 > 0 || counter1000 > 0)
        proceedAlpha = 1;
      else
        proceedAlpha = 0.5;

      absorbingProceed = proceedAlpha != 1;
    });
  }

  void removePrize(String type) {
    setState(() {
      switch (type) {
        case '1000':
          counter1000--;
          balance += 1000;
          break;
        case '500':
          counter500--;
          balance += 500;
          break;
        default:
          counter250--;
          balance += 250;
      }
      checkForAvailableBalance();
      if (counter250 > 0 || counter500 > 0 || counter1000 > 0)
        proceedAlpha = 1;
      else
        proceedAlpha = 0.5;
      absorbingProceed = proceedAlpha != 1;
    });
  }

  void checkForAvailableBalance() {
    if (balance <= 0) {
      absorbingPlus1000 = true;
      absorbingPlus500 = true;
      absorbingPlus250 = true;
    } else {
      if (balance <= 250)
        absorbingPlus250 = false;
      else if (balance <= 500) {
        absorbingPlus250 = false;
        absorbingPlus500 = false;
      } else {
        absorbingPlus1000 = false;
        absorbingPlus500 = false;
        absorbingPlus250 = false;
      }
    }
    absorbingMinus250 = counter250 <= 0;
    absorbingMinus500 = counter500 <= 0;
    absorbingMinus1000 = counter1000 <= 0;
  }
}
