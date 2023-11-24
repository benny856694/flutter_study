import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostCard extends HookConsumerWidget {
  final double width;
  const PostCard({super.key, required this.width});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seed = useState(Random().nextInt(30)).value;
    return SizedBox(
      width: width,
      height: 196,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black12),
        ),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundImage:
                      NetworkImage('https://picsum.photos/seed/$seed/12'),
                ),
                const Gap(8),
                const Text('Somebody • 10 hours ago'),
              ],
            ),
            const Gap(10),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      lorem(paragraphs: 1, words: 30),
                      maxLines: 3,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        height: 1.2,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Gap(32),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                          'https://picsum.photos/seed/$seed/116')),
                ],
              ),
            ),
            const Gap(10),
            const Row(
              children: [
                Icon(
                  Icons.thumb_up_outlined,
                  color: Colors.black,
                  size: 20,
                ),
                Gap(4),
                Text(
                  '3.3K',
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
                Gap(16),
                Icon(
                  Icons.thumb_down_outlined,
                  size: 20,
                ),
                Spacer(),
                Icon(
                  Icons.comment_outlined,
                  size: 20,
                ),
                Gap(4),
                Text('326'),
                Gap(16),
                Icon(Icons.more_vert),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
