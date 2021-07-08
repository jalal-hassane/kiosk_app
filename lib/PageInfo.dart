import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kiosk_app/LayoutTop.dart';
import 'package:kiosk_app/LayoutTriangles.dart';
import 'package:kiosk_app/MyAssets.dart';
import 'package:kiosk_app/MyColors.dart';
import 'package:kiosk_app/MyCustomChild.dart';
import 'package:kiosk_app/MyDecorations.dart';
import 'package:kiosk_app/MyFonts.dart';
import 'package:sprintf/sprintf.dart';

import 'MyTexts.dart';
import 'PageHowToPlay.dart';

class PageInfo extends StatefulWidget {
  PageInfo({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _InfoPage createState() => _InfoPage();
}

class _InfoPage extends State<PageInfo> {
  final fullNameFieldController = TextEditingController();
  final mobilePhoneFieldController = TextEditingController();
  final emailAddressFieldController = TextEditingController();
  String nameError = "", mobileError = "", emailError = "";

  var screenHeight = 0.0; // device screen height
  var screenWidth = 0.0; // device screen width
  var statusBarHeight = 0.0;
  late FocusScopeNode node;

  void navigate() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => PageHowToPlay(title: 'How to play')),
    );
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height; // device screen height
    screenWidth = MediaQuery.of(context).size.width; // device screen width
    statusBarHeight = MediaQuery.of(context).padding.top;
    node = FocusScope.of(context);

    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SingleChildScrollView(
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
                                  margin:
                                      EdgeInsets.only(top: screenHeight * 0.03),
                                  color: Colors.transparent,
                                  height: 35,
                                  width: screenWidth * 0.92,
                                  child: TopLayout(
                                    helpIsVisible: false,
                                    questionMarkIsVisible: false,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 4),
                                  child: Text(
                                    Strings.enterInformation,
                                    style: TextStyle(
                                      fontFamily: Fonts.exo2Regular,
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 20,
                                  ),
                                  width: screenWidth * 0.9,
                                  alignment: Alignment.center,
                                  child: Wrap(
                                    children: [
                                      Container(
                                        child: Wrap(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                bottom: 10,
                                              ),
                                              child: Expanded(
                                                flex: 1,
                                                child: infoTextFieldContainer(
                                                    text: Strings.fullName,
                                                    mController:
                                                        fullNameFieldController,
                                                    error: nameError,
                                                    function: () {
                                                      node.nextFocus();
                                                    }),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                bottom: 10,
                                              ),
                                              child: Expanded(
                                                flex: 1,
                                                child: infoTextFieldContainer(
                                                    text: Strings.mobileNumber,
                                                    mController:
                                                        mobilePhoneFieldController,
                                                    type: TextInputType.number,
                                                    error: mobileError,
                                                    function: () {
                                                      node.nextFocus();
                                                    }),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: infoTextFieldContainer(
                                                  text: Strings.emailAddress,
                                                  mController:
                                                      emailAddressFieldController,
                                                  type: TextInputType
                                                      .emailAddress,
                                                  error: emailError,
                                                  action: TextInputAction.done,
                                                  function: () {
                                                    node.unfocus();
                                                  }),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 8, left: 4),
                                        child: Text(
                                          Strings.mandatoryHint,
                                          style: TextStyle(
                                            color: AppColors.mandatoryHintColor,
                                            fontFamily: Fonts.exo2Regular,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: checkForEmptyFields,
                                        child: Center(
                                          child: CustomChild.goButton(
                                              mWidth: screenWidth * 0.5,
                                              mHeight: 55,
                                              marginTop: 30),
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container infoTextFieldContainer({
    String text = '',
    TextEditingController? mController,
    TextInputType? type,
    String? error,
    TextInputAction action = TextInputAction.next,
    required Function function,
  }) {
    return Container(
      child: Wrap(
        children: [
          CustomChild.topLeftAlignedText(text),
          Container(
            height: 45,
            decoration: Decorations.rounded8WhiteBackground,
            child: CustomChild.infoPageInputText(
              controller: mController,
              type: type,
              error: error,
              action: action,
              node: node,
            ),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(ErrorType type, String e) {
    String message = type == ErrorType.EMPTY
        ? Strings.emptyErrorMessage
        : Strings.malformedErrorMessage;
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          //title: const Text(title),
          title: Text(Strings.emptyErrorTitle),
          content: Text(sprintf(message, [e])),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void checkForEmptyFields() {
    String name = fullNameFieldController.value.text;
    String mobile = mobilePhoneFieldController.value.text;
    String email = emailAddressFieldController.value.text;

    setState(() {
      if (name.isEmpty) {
        _showErrorDialog(ErrorType.EMPTY, "Full name");
        nameError = Strings.emptyErrorMessage;
        return;
      }
      if (mobile.isEmpty) {
        _showErrorDialog(ErrorType.EMPTY, "Mobile number");
        mobileError = Strings.emptyErrorMessage;
        return;
      }
      if (email.isNotEmpty && !email.isValidEmail()) {
        _showErrorDialog(ErrorType.MALFORMED, "email");
        emailError = Strings.malformedErrorMessage;
        return;
      }
      navigate();
    });
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

enum ErrorType { EMPTY, MALFORMED }
