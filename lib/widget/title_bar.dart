import 'package:flutter/material.dart';
import 'package:flutter_studdy/widget/search_box.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
                    backgroundColor: const Color.fromARGB(255, 242, 242, 242)),
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
              style: IconButton.styleFrom(backgroundColor: Colors.black54),
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
    );
  }
}
