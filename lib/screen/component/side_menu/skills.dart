import 'package:flutter/material.dart';
import '../../../constant/colors_constants.dart';
import '../../../constant/constant_string.dart';
import '../../../util/animated_circular_progress_indicator.dart';

class Skills extends StatelessWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: Text(
                skills,
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            Row(
              children: const [
                Expanded(
                  child: AnimatedCircularProgressIndicator(
                    percentage: 0.75,
                    label: android,
                  ),
                ),
                SizedBox(width: defaultPadding),
                Expanded(
                  child: AnimatedCircularProgressIndicator(
                    percentage: 0.90,
                    label: flutter,
                  ),
                ),
                // SizedBox(width: defaultPadding),
                // Expanded(
                //   child: AnimatedCircularProgressIndicator(
                //     percentage: 0.60,
                //     label: xamarin,
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
