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
    final imgUrl = useState(isShort
        ? 'https://picsum.photos/seed/$seed/${width.round()}/452'
        : 'https://picsum.photos/seed/$seed/${width.round()}/219');
    final texts = useState(lorem(paragraphs: 1, words: 12));
    final avatarUrl = useState('https://picsum.photos/seed/$seed/36');
    final authorName = useState(lorem(paragraphs: 1, words: 1));

    return SizedBox(
      width: width,
      child: MouseRegion(
        onEnter: (event) => showVideo.value = true,
        onExit: (event) => showVideo.value = false,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imgUrl.value,
                    fit: BoxFit.cover,
                  ),
                ),
                Visibility(
                  visible: showVideo.value,
                  child: SizedBox(
                    width: width,
                    height: isShort ? 452 : 219,
                    child: const MyVideoPlayer(),
                  ),
                ),
              ],
            ),
            const Gap(16),
            Row(
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
                const Gap(16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
