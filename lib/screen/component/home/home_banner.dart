import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constant/colors_constants.dart';
import '../../../theme/dark_theme_provider.dart';
import '../../../util/responsive.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return AspectRatio(
      aspectRatio:3,
      child: Container(
        margin: EdgeInsets.all(!Responsive.isMobile(context) ? 10 : 12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "assets/images/bgg.jpg",
              fit: BoxFit.cover,
            ),
            Container(color: Colors.black.withOpacity(0.36)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome to my ${!Responsive.isMobile(context) ? "\n" : ""}Art Space! \n",
                    style: Theme.of(context).textTheme.headline3?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: !Responsive.isMobile(context) ? 40 : 14),
                  ),
                  const MyBuildAnimatedText(),
                  const SizedBox(height: defaultPadding),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(!Responsive.isMobile(context) ? 12 : 4),
              child: Align(
                alignment: Alignment.topRight,
                child: Transform.scale(
                  scale: !Responsive.isMobile(context) ? 0.8 : 0.5,
                  child: CupertinoSwitch(
                    trackColor: Colors.black12,
                    value: themeChange.darkTheme,
                    onChanged: (value) {
                      themeChange.darkTheme = value;
                    },
                    thumbColor: CupertinoColors.white,
                    activeColor: CupertinoColors.darkBackgroundGray,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyBuildAnimatedText extends StatelessWidget {
  const MyBuildAnimatedText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      // it applies same style to all the widgets under it
      style: Theme.of(context).textTheme.subtitle1!,
      child: Row(
        children: [
          const SizedBox(width: defaultPadding / 2),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const FlutterCodedText(),
                const Text(
                  " I build ",
                  style: TextStyle(color: Colors.white),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      "App with dark and light theme ",
                      speed: const Duration(milliseconds: 60),
                      textStyle: const TextStyle(color: Colors.white),
                    ),
                    TyperAnimatedText(
                      "App that work with${Responsive.isMobile(context) ? "\n" : ""} Maps and Payments ",
                      speed: const Duration(milliseconds: 60),
                      textStyle: const TextStyle(color: Colors.white),
                    ),
                    TyperAnimatedText(
                      "Native and ${Responsive.isMobile(context) ? "\n" : ""}Cross-Platform Mobile app ",
                      speed: const Duration(milliseconds: 60),
                      textStyle: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                // const FlutterCodedText(),
              ],
            ),
          ),
          const SizedBox(width: defaultPadding / 2),
        ],
      ),
    );
  }
}

class FlutterCodedText extends StatelessWidget {
  const FlutterCodedText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
      TextSpan(
        text: "<",
        style: TextStyle(color: Colors.black),
        children: [
          TextSpan(text: "flutter", style: TextStyle(color: Colors.black)),
          TextSpan(
            text: ">",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
