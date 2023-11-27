import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:flutter_studdy/widget/filter_chip.dart';
import 'package:flutter_studdy/widget/post_card.dart';
import 'package:flutter_studdy/widget/show_more.dart';
import 'package:flutter_studdy/widget/video_card.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import 'filter_chip_list.dart';

const gap = 8;

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
            child: LayoutBuilder(
              builder: (context, constraints) {
                var videoCnt = 3;
                final responsive = ResponsiveBreakpoints.of(context);
                if (responsive.largerOrEqualTo('4K')) {
                  videoCnt = 5;
                } else if (responsive.largerOrEqualTo(DESKTOP)) {
                  videoCnt = 4;
                } else if (responsive.largerOrEqualTo(TABLET)) {
                  videoCnt = 2;
                } else if (responsive.largerOrEqualTo(MOBILE)) {
                  videoCnt = 1;
                }
                const shortsCnt = 5;
                const postCnt = 3;
                final vw =
                    (constraints.maxWidth - (videoCnt - 1) * gap) / videoCnt;
                final sw =
                    (constraints.maxWidth - (shortsCnt) * gap) / shortsCnt;

                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(videoCnt, (i) => i + 1)
                          .map(
                            (e) => VideoCard(
                              width: vw,
                              seed: Random().nextInt(100),
                            ),
                          )
                          .toList(),
                    ),
                    const Gap(40),
                    SizedBox(
                      //height: 219,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(videoCnt, (i) => i + 1)
                            .map(
                              (e) => VideoCard(
                                width: vw,
                                seed: Random().nextInt(100),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const Gap(40),
                    ListTile(
                      contentPadding: const EdgeInsets.all(0),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(shortsCnt, (i) => i + 1)
                          .map(
                            (e) => VideoCard(
                              width: sw,
                              seed: Random().nextInt(100),
                              isShort: true,
                            ),
                          )
                          .toList(),
                    ),
                    const Gap(10),
                    const ShowMoreButton(),
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(videoCnt, (i) => i + 1)
                          .map(
                            (e) => VideoCard(
                              width: vw,
                              seed: Random().nextInt(100),
                            ),
                          )
                          .toList(),
                    ),
                    const Gap(26),
                    const ListTile(
                      contentPadding: EdgeInsets.all(0),
                      leading: Text(
                        'Latest YouTube posts',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.filled(postCnt, 0)
                          .map((e) => PostCard(
                                width: vw,
                              ))
                          .toList(),
                    ),
                    const Gap(20),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
