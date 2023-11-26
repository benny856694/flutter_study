import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:flutter_studdy/widget/video_player.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VideoCard extends HookConsumerWidget {
  final int seed;
  final bool isShort;
  final double width;
  const VideoCard(
      {super.key, required this.width, this.seed = 0, this.isShort = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showVideo = useState(false);
    final imgHeight = isShort ? 452 : 219;
    final seed = useState(this.seed);
    final imgUrl =
        'https://picsum.photos/seed/${seed.value}/${width.round()}/$imgHeight';
    final texts = useState(lorem(paragraphs: 1, words: 12));
    final avatarUrl = useState('https://picsum.photos/seed/${seed.value}/36');
    final authorName = useState(lorem(paragraphs: 1, words: 1));
    final isOverText = useState(false);
    final videoLength =
        useState('${Random().nextInt(20)}:${Random().nextInt(60)}');

    return SizedBox(
      width: width,
      child: MouseRegion(
        onEnter: (event) => showVideo.value = true,
        onExit: (event) => showVideo.value = false,
        child: Column(
          children: [
            Stack(
              //alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imgUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Visibility(
                  visible: showVideo.value,
                  child: SizedBox(
                    width: width,
                    height: imgHeight.toDouble(),
                    child: const MyVideoPlayer(),
                  ),
                ),
                Visibility(
                  visible: !showVideo.value,
                  child: SizedBox(
                    width: width,
                    height: imgHeight.toDouble(),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      //right: 0,
                      //bottom: 0,
                      child: Container(
                        margin: const EdgeInsets.only(right: 4, bottom: 4),
                        clipBehavior: Clip.antiAlias,
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.black,
                        ),
                        child: Text(
                          videoLength.value,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Gap(16),
            MouseRegion(
              onEnter: (_) => isOverText.value = true,
              onExit: (_) => isOverText.value = false,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!isShort) ...[
                    CircleAvatar(
                      backgroundImage: NetworkImage(avatarUrl.value),
                    ),
                    const Gap(16),
                  ],
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          texts.value,
                          maxLines: 2,
                          style: const TextStyle(
                            height: 1.2,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const Gap(4),
                        if (!isShort)
                          Text(
                            authorName.value,
                            style: const TextStyle(
                              color: Colors.black87,
                            ),
                          ),
                        Text(
                          isShort ? '30K views' : '12K views • 4 hours ago',
                          style: const TextStyle(
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(4),
                  Transform.translate(
                    offset: const Offset(10, -6),
                    child: Visibility(
                      visible: isOverText.value,
                      maintainSize: true,
                      maintainState: true,
                      maintainAnimation: true,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_vert),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
