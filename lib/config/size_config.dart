import 'package:flutter/widgets.dart';


/*
 It divides the screen in a matrix of 100 rectangles each having a height of blockSizeVertical and width of blockSizeHorizontal

 Configures the blockSizeHorizontal and blockSizeVertical to the size of a rectangle's side
 so it can be used to make the widgets responsive on any screen size.

 For example: blockSizeVertical*20 is 20% of the screen height
              blockSizeHorizontal*10 is 10% of the screen width

*/
class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }
}