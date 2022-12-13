import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constant/colors_constants.dart';
import '../../../constant/constant_string.dart';
import '../../../util/area_info_text.dart';
import 'coding.dart';
import 'info.dart';
import 'knowledge.dart';
import 'skills.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Drawer(
        child: Column(
          children: [
            const Info(),
            const Divider(thickness: 2.0),
            Expanded(
                child: SingleChildScrollView(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const AreaInfoText(
                    title: country,
                    text: cam,
                  ),
                  const AreaInfoText(
                    title: city,
                    text: pp,
                  ),
                  Card(
                    elevation: 10,
                    margin: const EdgeInsets.only(top: defaultPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            js.context.callMethod('open', [linkLinkedIN]);
                          },
                          icon: SvgPicture.asset("assets/icons/linkedin.svg"),
                        ),
                        IconButton(
                          onPressed: () {
                            js.context.callMethod('open', [linkGithub]);
                          },
                          icon: SvgPicture.asset("assets/icons/github.svg"),
                        ),
                        IconButton(
                          onPressed: () {
                            js.context.callMethod('open', [linkTwitter]);
                          },
                          icon: SvgPicture.asset("assets/icons/twitter.svg"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: defaultPadding),
                  // TextButton(
                  //   onPressed: () {
                  //     js.context.callMethod('open', [linkCV]);
                  //   },
                  //   child: FittedBox(
                  //     child: Row(
                  //       children: [
                  //         Text(
                  //           downloadCV,
                  //           style: TextStyle(
                  //             color:
                  //                 Theme.of(context).textTheme.bodyText1!.color,
                  //           ),
                  //         ),
                  //         const SizedBox(width: defaultPadding / 2),
                  //         SvgPicture.asset("assets/icons/download.svg")
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  const Skills(),
                  const SizedBox(height: defaultPadding),
                  const Coding(),
                  const Knowledge(),
                  const Divider(),
                  const SizedBox(height: defaultPadding / 2),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
