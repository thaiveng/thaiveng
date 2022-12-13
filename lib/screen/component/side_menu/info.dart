import 'dart:js' as js;
import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../constant/colors_constants.dart';
import '../../../constant/constant_string.dart';
import '../../../widgets/avatar_glow.dart';

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.9,
      child: Column(
        children: [
          AvatarGlow(
            glowColor: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
            endRadius: 90.0,
            duration: const Duration(milliseconds: 2000),
            repeat: true,
            showTwoGlows: true,
            child: Material(     // Replace this child with your own
              elevation: 8.0,
              shape: const CircleBorder(),
              child: CircleAvatar(
                backgroundColor: Colors.grey[100],
                radius: 40.0,
                backgroundImage: const NetworkImage(linkImage),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 4, left: 16, right: 16),
            child: SelectableText(
              myName,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin:
                const EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
            child: const SelectableText(
              desc,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w200, height: 1.5),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: defaultPadding),
              alignment: Alignment.center,
              child: SizedBox(
                width: 120,
                child: ElevatedButton(
                  onPressed: () {
                    js.context.callMethod('open', [linkGithub]);
                  },
                  child: const Text(followMe),
                ),
              )),
        ],
      ),
    );
  }
}
