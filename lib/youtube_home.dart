import 'package:flutter/material.dart';
import 'package:flutter_studdy/widget/search_box.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

const ytBgColor = Color.fromARGB(255, 15, 15, 15);
const ytTextColor = Colors.white;

class YoutubeHome extends StatelessWidget {
  const YoutubeHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: ytBgColor,

      body: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Column(
          children: [
            Row(
              children: [
                const Row(
                  children: [
                    Gap(16),
                    Icon(Icons.menu),
                    Gap(16),
                    FaIcon(FontAwesomeIcons.youtube),
                    Gap(4),
                    Text(
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
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 300,
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.video_call),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications_none),
                    ),
                    IconButton(
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
            )
          ],
        ),
      ),
    );
  }
}
