import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constant/colors_constants.dart';

class Knowledge extends StatelessWidget {
  const Knowledge({
    Key? key,
  }) : super(key: key);

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
                "Skills/Exposure",
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            const KnowledgeText(text: "Data structures and Algorithm"),
            // const KnowledgeText(text: "Kotlin Coroutines"),
            const KnowledgeText(text: "Firebase, SQLite"),
            // const KnowledgeText(
            //     text: "Dependency Injection \nDagger 2 and Hilt"),
            // const KnowledgeText(text: "RxJava, Room Database"),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: Text(
                "Methodology/Approach",
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            const KnowledgeText(text: "MVVM, MVC"),
            const KnowledgeText(text: "Agile Methodology"),
            const KnowledgeText(text: "Test driven development"),
          ],
        ),
      ],
    );
  }
}

class KnowledgeText extends StatelessWidget {
  const KnowledgeText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 2),
      child: Row(
        children: [
          SvgPicture.asset("assets/icons/check.svg"),
          const SizedBox(width: defaultPadding / 2),
          Text(text),
        ],
      ),
    );
  }
}
