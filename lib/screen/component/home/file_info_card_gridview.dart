import 'dart:js' as js;
import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../../../constant/colors_constants.dart';
import '../../../model/projects.dart';
import '../../../util/responsive.dart';

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    Key? key,
    this.crossAxisCount = 3,
  }) : super(key: key);

  final int crossAxisCount;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "My Projects",
                  style: Theme.of(context).textTheme.headline3?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: !Responsive.isMobile(context) ? 30 : 14),
                ),
              ),
              const SizedBox(height: 16),
              // GridView.builder(
              //   physics: const NeverScrollableScrollPhysics(),
              //   shrinkWrap: true,
              //   itemCount: demoProjects.length,
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: crossAxisCount,
              //     crossAxisSpacing: defaultPadding,
              //     mainAxisSpacing: defaultPadding,
              //     childAspectRatio: 3,
              //   ),
              //   itemBuilder: (context, index) =>
              //       FileInfoCard(info: demoProjects[index]),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class FileInfoCard extends StatelessWidget {
  const FileInfoCard({
    Key? key,
    required this.info,
  }) : super(key: key);

  final Project info;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: InkWell(
        onTap: () {
          js.context.callMethod('open', [info.link]);
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.bookmark_border,
                    size: 16,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    info.title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 16,
                        fontWeight: FontWeight.w800),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.wifi_tethering_outlined,
                    size: 16,
                  )
                ],
              ),
              Text(
                info.description,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              Row(
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
                        ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    info.lang,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
