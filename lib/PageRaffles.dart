import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sprintf/sprintf.dart';

import 'LayoutTop.dart';
import 'LayoutTriangles.dart';
import 'MyAssets.dart';
import 'MyColors.dart';
import 'MyCustomChild.dart';
import 'MyFonts.dart';
import 'MyStrings.dart';
import 'PageHowToPlay.dart';

class PageRaffles extends StatefulWidget {
  PageRaffles({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _PageRaffles createState() => _PageRaffles();
}

class _PageRaffles extends State<PageRaffles> {
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
      //backgroundColor: Colors.transparent,
      body: SafeArea(
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
                      margin: EdgeInsets.only(top: screenHeight * 0.03),
                      color: Colors.transparent,
                      height: 35,
                      width: screenWidth * 0.92,
                      child: TopLayout(
                        helpIsVisible: false,
                        questionMarkIsVisible: false,
                      ),
                    ),
                    Column(
                      children: [

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
}
