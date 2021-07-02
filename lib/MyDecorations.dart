import 'package:flutter/material.dart';
import 'package:kiosk_app/MyColors.dart';

class Decorations {
  static const rounded8WhiteBackground = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(
      Radius.circular(8),
    ),
  );

  static const rounded16Gray2Background = BoxDecoration(
    color: AppColors.gray2,
    borderRadius: BorderRadius.all(
      Radius.circular(16),
    ),
  );

  static const bottomRight2DarkGrayBackground = BoxDecoration(
    color: AppColors.darkGray,
    borderRadius: BorderRadius.only(
      bottomRight: Radius.circular(2),
    ),
  );

  static const topRight2Gray2Background = BoxDecoration(
    color: AppColors.gray2,
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(2),
    ),
  );
}
