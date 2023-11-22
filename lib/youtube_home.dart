import 'package:flutter/material.dart';
import 'package:flutter_studdy/widget/search_box.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

import 'widget/menu_item.dart';

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
            Row(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {},
                    ),
                    const Gap(16),
                    FaIcon(
                      FontAwesomeIcons.youtube,
                      color: Colors.red.shade700,
                    ),
                    const Gap(4),
                    const Text(
                      'YouTute',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Row(
                    //mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 400,
                        child: SearchBox(),
                      ),
                      const Gap(16),
                      IconButton(
                        //color: Color.fromARGB(0, 242, 242, 242),
                        style: IconButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 242, 242, 242)),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.mic,
                          //color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  //mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.video_call_outlined),
                    ),
                    const Gap(4),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications_none),
                    ),
                    const Gap(4),
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      style:
                          IconButton.styleFrom(backgroundColor: Colors.black54),
                      onPressed: () {},
                      icon: const Text(
                        'B',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Gap(16),
            Row(
              children: [
                SizedBox(
                  width: 230,
                  height: sz.height - 40,
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
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
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
                        ...List.generate(18, (i) => i)
                            .map((e) => ListTile(
                                  onTap: () {},
                                  leading: CircleAvatar(
                                    radius: 12,
                                    backgroundImage: NetworkImage(
                                        'https://picsum.photos/seed/$e/32'),
                                  ),
                                  title: const Text('Lorem'),
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
                                                  color: Color.fromARGB(
                                                      255, 54, 54, 249),
                                                  borderRadius:
                                                      BorderRadius.circular(2)),
                                            ),
                                          ),
                                        ),
                                ))
                            .toList(),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
