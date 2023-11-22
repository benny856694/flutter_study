import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:flutter_studdy/widget/filter_chip.dart';
import 'package:flutter_studdy/widget/video_card.dart';
import 'package:gap/gap.dart';

import 'filter_chip_list.dart';

class MainContent extends StatelessWidget {
  const MainContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 36,
          child: FilterChipList(),
        ),
        const Gap(16),
        Expanded(
            child: Column(
          children: [
            SizedBox(
                height: 219,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (i) => i + 1)
                      .map(
                        (e) => VideoCard(
                          seed: e,
                        ),
                      )
                      .toList(),
                ))
          ],
        ))
      ],
    );
  }
}
