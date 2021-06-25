import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiosk_app/MyAssets.dart';

class Triangles extends StatefulWidget {
  @override
  _Triangles createState() => _Triangles();
}

class _Triangles extends State<Triangles> {
  @override
  Widget build(BuildContext context) {
    final screenHeight =
        MediaQuery.of(context).size.height; // device screen height
    final screenWidth =
        MediaQuery.of(context).size.width; // device screen width
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: screenWidth,
        height: screenHeight,
        child: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topRight,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      MyAssets.imageTopTriangle,
                      fit: BoxFit.contain,
                      width: screenWidth * 0.8,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      MyAssets.imageBottomTriangle,
                      fit: BoxFit.contain,
                      width: screenWidth * 0.5,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
