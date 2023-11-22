import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:gap/gap.dart';

class VideoCard extends StatelessWidget {
  final int seed;
  const VideoCard({super.key, this.seed = 0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 390,
      height: 219 + 100,
      child: Card(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://picsum.photos/seed/$seed/390/219',
                fit: BoxFit.cover,
              ),
            ),
            const Gap(16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://picsum.photos/seed/$seed/36'),
                ),
                const Gap(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lorem(paragraphs: 1, words: 50),
                        maxLines: 2,
                        style: const TextStyle(
                          height: 1.2,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const Gap(4),
                      Text(
                        lorem(paragraphs: 1, words: 1),
                        style: const TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                      const Text(
                        '12K views • 4 hours ago',
                        style: TextStyle(
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
