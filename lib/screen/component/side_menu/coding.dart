import 'package:flutter/material.dart';

import '../../../constant/colors_constants.dart';
import '../../../constant/constant_string.dart';
import '../../../util/animated_circular_progress_indicator.dart';

class Coding extends StatelessWidget {
  const Coding({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Text(
            "Languages Skills",
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        const AnimatedLinearProgressIndicator(
          percentage: 0.50,
          label: java,
        ),
        const AnimatedLinearProgressIndicator(
          percentage: 0.90,
          label: dart,
        ),
        const AnimatedLinearProgressIndicator(
          percentage: 0.50,
          label: kotlin,
        ),
        const AnimatedLinearProgressIndicator(
          percentage: 0.50,
          label: javaScript,
        ),
      ],
    );
  }
}
