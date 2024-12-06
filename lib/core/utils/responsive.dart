import 'package:flutter/cupertino.dart';

class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
          MediaQuery.of(context).size.width < 1200;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  // Adaptive padding
  static double getPadding(BuildContext context) {
    if (isMobile(context)) return 8.0;
    if (isTablet(context)) return 16.0;
    return 24.0;
  }

  // Adaptive width
  static double getWidth(BuildContext context, {double maxWidth = 1200}) {
    return MediaQuery.of(context).size.width > maxWidth
        ? maxWidth
        : MediaQuery.of(context).size.width;
  }
}