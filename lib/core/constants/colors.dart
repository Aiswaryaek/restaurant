import 'package:flutter/material.dart';

class ColorConst {
  static Color black = fromHex('#000000');
  static Color darkBlack = const Color(0xFF333333);

  static Color white = fromHex('#FFFFFF');
  static Color red = Colors.red;

  static Color appColor = const Color(0xffE34950);
  static Color black26 = const Color(0xff262626);
  static Color black1F = const Color(0xff1F2B2E);
  static Color greyDD = const Color(0xffDDDDDD);
  static Color greyCC = const Color(0xffCCCCCC);
  static Color greyBB = const Color(0xffBBBBBB);
  static Color grey83 = const Color(0xff838383);
  static Color grey8E = const Color(0xff8E8E93);
  static Color greyF2 = const Color(0xffF2F2F7);
  static Color green3D = const Color(0xff3DBA42);
  static Color redC9 = const Color(0xffC91507);





  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
