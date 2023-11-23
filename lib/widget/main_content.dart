import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:flutter_studdy/widget/filter_chip.dart';
import 'package:flutter_studdy/widget/video_card.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        const FilterChipList(),
        const Gap(16),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  //height: 219,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(4, (i) => i + 1)
                        .map(
                          (e) => VideoCard(
                            seed: Random().nextInt(100),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const Gap(40),
                SizedBox(
                  //height: 219,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(4, (i) => i + 1)
                        .map(
                          (e) => VideoCard(
                            seed: Random().nextInt(100),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const Gap(40),
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: SvgPicture.asset('assets/shorts_red.svg'),
                  title: const Text(
                    'Shorts',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.close),
                  ),
                ),
                const Gap(10),
                SizedBox(
                  //height: 219,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(6, (i) => i + 1)
                        .map(
                          (e) => VideoCard(
                            seed: Random().nextInt(100),
                            isShort: true,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
