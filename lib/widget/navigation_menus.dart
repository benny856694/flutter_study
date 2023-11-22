import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:flutter_studdy/widget/menu_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationMenus extends StatelessWidget {
  const NavigationMenus({
    super.key,
    required this.sz,
  });

  final Size sz;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230,
      //height: sz.height - 40,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MenuItem(
              icon: Icon(Icons.home),
              title: 'Home',
              isSelected: true,
            ),
            const MenuItem(
              icon: Icon(Icons.short_text),
              title: 'Shorts',
            ),
            const MenuItem(
              icon: Icon(Icons.subscript),
              title: 'Subscriptions',
            ),
            const Divider(
              height: 1,
            ),
            ListTile(
              horizontalTitleGap: 0,
              onTap: () {},
              visualDensity: VisualDensity.compact,
              leading: const Text(
                'You',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              title: const Icon(Icons.chevron_right),
            ),
            const MenuItem(
              icon: Icon(Icons.person),
              title: 'Your channel',
            ),
            const MenuItem(
              icon: Icon(Icons.history),
              title: 'History',
            ),
            const MenuItem(
              icon: Icon(Icons.play_arrow),
              title: 'Your videos',
            ),
            const MenuItem(
              icon: Icon(Icons.movie),
              title: 'Your movie & TV',
            ),
            const MenuItem(
              icon: Icon(Icons.schedule),
              title: 'Watch later',
            ),
            const MenuItem(
              icon: RotatedBox(
                quarterTurns: 1,
                child: Icon(Icons.chevron_right),
              ),
              title: 'Show more',
            ),
            const Divider(
              height: 1,
              //thickness: 1,
            ),
            //const Gap(16),
            const ListTile(
              leading: Text(
                'Subscriptions',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ...List.generate(10, (i) => i)
                .map((e) => ListTile(
                      onTap: () {},
                      leading: CircleAvatar(
                        radius: 12,
                        backgroundImage:
                            NetworkImage('https://picsum.photos/seed/$e/32'),
                      ),
                      title: Text(lorem(paragraphs: 1, words: 1)),
                      trailing: e == 0
                          ? const FaIcon(
                              FontAwesomeIcons.towerBroadcast,
                              size: 14,
                              color: Colors.red,
                            )
                          : SizedBox(
                              width: 8,
                              child: Center(
                                child: Container(
                                  width: 4,
                                  height: 4,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 54, 54, 249),
                                      borderRadius: BorderRadius.circular(2)),
                                ),
                              ),
                            ),
                    ))
                .toList(),
          ],
        ),
      ),
    );
  }
}
