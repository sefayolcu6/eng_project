import 'package:flutter/material.dart';

extension AppContext on BuildContext {
  double screenWidth() => MediaQuery.of(this).size.width;
  double screenWidth15() => MediaQuery.of(this).size.width/1.5;
  double screenWidth2() => MediaQuery.of(this).size.width / 2;
  double screenWidth25() => MediaQuery.of(this).size.width / 2.5;
  double screenWidth4() => MediaQuery.of(this).size.width / 4;
  double screenHeight() => MediaQuery.of(this).size.height;
  double screenHeight4() => MediaQuery.of(this).size.height / 4;
  double screenHeight6() => MediaQuery.of(this).size.height / 6;
}
