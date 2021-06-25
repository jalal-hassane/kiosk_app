import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiosk_app/MyAssets.dart';
import 'package:kiosk_app/MyColors.dart';
import 'package:kiosk_app/MyFonts.dart';

import 'MyStrings.dart';

class TopLayout extends StatefulWidget {
  bool helpIsVisible = false;
  bool questionMarkIsVisible = false;

  TopLayout(
      {Key? key,
      required this.helpIsVisible,
      required this.questionMarkIsVisible})
      : super(key: key);

  @override
  _TopLayout createState() => _TopLayout(helpIsVisible, questionMarkIsVisible);
}

class _TopLayout extends State<TopLayout> {
  bool helpIsVisible;
  bool questionMarkIsVisible;

  _TopLayout(this.helpIsVisible, this.questionMarkIsVisible);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: 45,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: SvgPicture.asset(
                MyAssets.megaLogoSvg,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(),
            ),
            Expanded(
              flex: 1,
              child: Visibility(
                visible: helpIsVisible,
                child: Text(
                  Strings.help,
                  style: TextStyle(
                    fontFamily: Fonts.exo2SemiBold,
                    color: AppColors.shinyYellow,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Visibility(
                visible: questionMarkIsVisible,
                child: SvgPicture.asset(
                  MyAssets.helpSvg,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
