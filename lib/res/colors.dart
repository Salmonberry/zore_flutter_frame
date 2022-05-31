import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  AppColors();

  static const themeColor = Color(0xff46c8ff);
  static const primaryColor = Color(0xff46c8ff);
  static const orange = Color(0xffFF6F00);
  static const lightBlue = Color(0xffd2f4ff);

  ///设置颜色
  ///
  /// [colorString]是一个十六进制颜色[String]值，例如：0xffFF6F00
  ///
  /// [alpha]控制颜色的透明度，取值范围0到1
  ///
  /// 值返回是一个[Color]
  /// Flutter 中已有[color]方法可以实现改功能
  @Deprecated('migration')
  static Color setColorByHEX(String colorString, {double alpha = 1.0}) {
    String colorStr = colorString;
    // colorString未带0xff前缀并且长度为6
    if (!colorStr.startsWith('0xff') && colorStr.length == 6) {
      colorStr = '0xff' + colorStr;
    }
    // colorString为8位，如0x000000
    if (colorStr.startsWith('0x') && colorStr.length == 8) {
      colorStr = colorStr.replaceRange(0, 2, '0xff');
    }
    // colorString为7位，如#000000
    if (colorStr.startsWith('#') && colorStr.length == 7) {
      colorStr = colorStr.replaceRange(0, 1, '0xff');
    }
    // 先分别获取色值的RGB通道
    final Color color = Color(int.parse(colorStr));
    final int red = color.red;
    final int green = color.green;
    final int blue = color.blue;
    // 通过fromRGBO返回带透明度和RGB值的颜色
    return Color.fromRGBO(red, green, blue, alpha);
  }
}
