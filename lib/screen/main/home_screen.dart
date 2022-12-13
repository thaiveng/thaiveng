import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../util/menu_controller.dart';
import '../../util/responsive.dart';
import '../component/home/file_info_card_gridview.dart';
import '../component/home/header.dart';
import '../component/side_menu/sideMenu.dart';

class HomeScreen extends StatelessWidget {
  final List<Widget>? children;

  const HomeScreen({Key? key, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: const SideMenu(),
      body: Row(
        children: [
          if (Responsive.isDesktop(context)) const SideMenu(),
          Expanded(
              child: Column(
            children: [
              const Header(),
              ...?children,
              const Responsive(
                mobileScreen: FileInfoCardGridView(crossAxisCount: 1),
                mediumScreen: FileInfoCardGridView(crossAxisCount: 2),
                desktopScreen: FileInfoCardGridView(crossAxisCount: 3),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
