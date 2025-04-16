import 'package:flutter/widgets.dart';

class ResponsiveConfig {
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double blockWidth = 0;
  static double blockHeight = 0;
  static double textMultiplier = 0;
  static double imageSizeMultiplier = 0;
  static double heightMultiplier = 0;
  static double widthMultiplier = 0;

  static bool isPortrait = true;

  // Minimum width for defining device types
  static const double minSmallDeviceSize = 320;
  static const double minMediumDeviceSize = 480;
  static const double minLargeDeviceSize = 768;
  static const double minExtraLargeDeviceSize = 1024;

  // Initialize screen sizes and other device-specific configurations
  void init(BoxConstraints constraints, Orientation orientation) {
    screenWidth =
        orientation == Orientation.portrait
            ? constraints.maxWidth
            : constraints.maxHeight;
    screenHeight =
        orientation == Orientation.portrait
            ? constraints.maxHeight
            : constraints.maxWidth;
    isPortrait = orientation == Orientation.portrait;

    // Calculate block sizes for responsive scaling
    blockWidth = screenWidth / 100;
    blockHeight = screenHeight / 100;

    textMultiplier = blockHeight;
    imageSizeMultiplier = blockWidth;
    heightMultiplier = blockHeight;
    widthMultiplier = blockWidth;
  }

  // Utility method for getting dynamic font size
  static double getFontSize(double baseFontSize) {
    return baseFontSize * textMultiplier;
  }

  // Utility method for dynamic image size
  static double getImageSize(double baseSize) {
    return baseSize * imageSizeMultiplier;
  }

  // Utility method for dynamic width
  static double getResponsiveWidth(double baseWidth) {
    return baseWidth * widthMultiplier;
  }

  // Utility method for dynamic height
  static double getResponsiveHeight(double baseHeight) {
    return baseHeight * heightMultiplier;
  }

  // Determine device type based on screen width
  static String getDeviceType() {
    if (screenWidth < minSmallDeviceSize) {
      return "Extra Small";
    } else if (screenWidth < minMediumDeviceSize) {
      return "Small";
    } else if (screenWidth < minLargeDeviceSize) {
      return "Medium";
    } else if (screenWidth < minExtraLargeDeviceSize) {
      return "Large";
    } else {
      return "Extra Large";
    }
  }
}
