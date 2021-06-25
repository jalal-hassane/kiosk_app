import 'package:flutter/material.dart';

class Device {
  BuildContext context;
  var screenHeight = 0.0;
  var screenWidth = 0.0;
  double statusBarHeight = 0.0;

  Device(this.context);

  void getDimensions() {
    screenHeight = MediaQuery.of(context).size.height; // device screen height
    screenWidth = MediaQuery.of(context).size.width; // device screen width
    statusBarHeight = MediaQuery.of(context).padding.top;
  }
}
