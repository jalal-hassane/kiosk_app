import 'dart:ui';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiosk_app/MyAssets.dart';
import 'package:kiosk_app/MyColors.dart';
import 'package:kiosk_app/MyFonts.dart';
import 'package:kiosk_app/MyTexts.dart';
import 'package:kiosk_app/PageHowToPlay.dart';
import 'package:kiosk_app/PageInfo.dart';
import 'package:kiosk_app/PageRaffle.dart';
import 'package:kiosk_app/PageSpinCount.dart';
import 'package:kiosk_app/PageSpinner.dart';
import 'package:shimmer/shimmer.dart';

import 'PageReward.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      // Add the locale here
      builder: DevicePreview.appBuilder,
      // Add the builder here
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routes: {
       /* '/landing': (BuildContext context) => PageHome(
              title: 'Home',
            ),*/
        '/info': (BuildContext context) => PageInfo(
              title: 'Info',
            ),
        '/howTo': (BuildContext context) => PageHowToPlay(
              title: 'How to play',
            ),
        '/raffle': (BuildContext context) => PageRaffle(
              title: 'Raffle',
            ),
        '/spinCount': (BuildContext context) => PageSpinCount(
              title: 'Spin Count',
            ),
        '/spinner': (BuildContext context) => PageSpinner(
              title: 'Spinner',
              count: 0,
            ),
        '/reward': (BuildContext context) => PageReward(
              title: 'Reward',
              prizes: [],
            ),
      },
      home: PageHome(title: 'KioskApp'),
    );
  }
}

class PageHome extends StatefulWidget {
  PageHome({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PageHome> {
  void navigateTo() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PageInfo(title: 'Info')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight =
        MediaQuery.of(context).size.height; // device screen height
    final screenWidth =
        MediaQuery.of(context).size.width; // device screen width
    final statusBarHeight = MediaQuery.of(context).padding.top;

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(MyAssets.backgroundHome),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 5,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: SvgPicture.asset(
                          MyAssets.megaSvg,
                          width: screenWidth * 0.8,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Container(
                        width: screenWidth * 0.8,
                        height: screenHeight * 0.08,
                        alignment: Alignment.center,
                        child: Text(
                          Strings.homeStartSpin,
                          maxLines: 1,
                          style: TextStyle(
                            fontFamily: Fonts.exo2Black,
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: GestureDetector(
                  onTap: navigateTo,
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        Stack(
                          //clipBehavior: Clip.hardEdge,
                          children: [
                            Image.asset(
                              MyAssets.imagePlayWithShadow,
                              width: screenWidth / 2.8,
                              fit: BoxFit.contain,
                            ),
                            Shimmer.fromColors(
                                child: Image.asset(
                                  MyAssets.imagePlayWithShadow,
                                  width: screenWidth / 2.8,
                                  fit: BoxFit.contain,
                                ),
                                period: Duration(milliseconds: 1000),
                                baseColor: AppColors.transparentWhite10,
                                highlightColor: Colors.white),
                          ],
                        ),
                        Container(
                          width: screenWidth * 0.8,
                          child: Text(
                            Strings.touchToStart,
                            maxLines: 3,
                            style: TextStyle(
                              fontFamily: Fonts.exo2Black,
                              color: AppColors.shinyYellow,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
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
    );
  }
}
