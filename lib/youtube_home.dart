import 'package:flutter/material.dart';
import 'package:flutter_studdy/widget/search_box.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

import 'widget/filter_chip.dart';
import 'widget/main_content.dart';
import 'widget/menu_item.dart';
import 'widget/navigation_menus.dart';
import 'widget/title_bar.dart';

const ytBgColor = Color.fromARGB(255, 15, 15, 15);
const ytTextColor = Colors.white;

class YoutubeHome extends StatelessWidget {
  const YoutubeHome({super.key});

  @override
  Widget build(BuildContext context) {
    final sz = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: ytBgColor,

      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
        child: Column(
          children: [
            const TitleBar(),
            const Gap(32),
            Expanded(
              child: Row(
                children: [
                  NavigationMenus(sz: sz),
                  const Gap(16),
                  const Expanded(
                    child: MainContent(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
