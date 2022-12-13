import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobileScreen;
  final Widget mediumScreen;
  final Widget desktopScreen;

  const Responsive({
    Key? key,
    required this.mobileScreen,
    required this.mediumScreen,
    required this.desktopScreen,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 800;

  static bool isMobileLarge(BuildContext context) {
    return MediaQuery.of(context).size.width >= 800 &&
        MediaQuery.of(context).size.width <= 1600;
  }

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1600;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width > 1600) {
      return desktopScreen;
    } else if (size.width >= 800 && size.width <= 1600) {
      return mediumScreen;
    } else {
      return mobileScreen;
    }
  }
}
