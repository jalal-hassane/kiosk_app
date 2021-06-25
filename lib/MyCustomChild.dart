import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiosk_app/MyAssets.dart';
import 'package:kiosk_app/MyStrings.dart';

import 'MyColors.dart';
import 'MyFonts.dart';
import 'MyStyles.dart';

class CustomChild {
  static final infoPageInputText = TextField(
    controller: null,
    autofocus: false,
    style: TextStyle(
      fontFamily: Fonts.exo2Regular,
      fontSize: 18,
      color: AppColors.shinyYellow,
      height: 1,
    ),
    decoration: InputDecoration(
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      contentPadding: EdgeInsets.all(16),
    ),
  );

  static Align topLeftAlignedText(String text) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: Styles.infoPageTitleTextStyle,
      ),
    );
  }

  static Center goButton({
    double mWidth = 0,
    double mHeight = 0,
    double marginTop = 0,
    double marginBottom = 0,
    double marginLeft = 0,
    double marginRight = 0,
  }) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(
          top: marginTop,
          left: marginLeft,
          right: marginRight,
          bottom: marginBottom,
        ),
        height: mHeight,
        width: mWidth,
        child: Stack(
          children: [
            Container(
              child: SvgPicture.asset(
                MyAssets.buttonGo,
                fit: BoxFit.fill,
              ),
            ),
            Center(
              child: Text(
                Strings.go,
                style: TextStyle(
                  fontFamily: Fonts.exo2Black,
                  fontSize: 20,
                  color: Colors.black,
                  height: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Center backButton({
    double mWidth = 0,
    double mHeight = 0,
    double marginTop = 0,
    double marginBottom = 0,
    double marginLeft = 0,
    double marginRight = 0,
  }) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(
          top: marginTop,
          left: marginLeft,
          right: marginRight,
          bottom: marginBottom,
        ),
        height: mHeight,
        width: mWidth,
        child: Stack(
          children: [
            Container(
              child: SvgPicture.asset(
                MyAssets.buttonBack,
                fit: BoxFit.fill,
              ),
            ),
            Center(
              child: Text(
                Strings.back,
                style: TextStyle(
                  fontFamily: Fonts.exo2Black,
                  fontSize: 20,
                  color: AppColors.yellow,
                  height: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Container howToPlayText(String text, {double width = 0}) {
    return Container(
      width: width,
      alignment: Alignment.center,
      child: Align(
        alignment: Alignment.center,
        child: Center(
          child: AutoSizeText(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: Fonts.exo2Black,
              fontSize: 14,
              color: Colors.black,
              height: 1,
            ),
            maxLines: 2,
            minFontSize: 7,
            maxFontSize: 14,
          ),
        ),
      ),
    );
  }
}
