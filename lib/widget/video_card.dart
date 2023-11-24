import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:gap/gap.dart';

class VideoCard extends StatelessWidget {
  final int seed;
  final bool isShort;
  final double width;
  const VideoCard(
      {super.key, required this.width, this.seed = 0, this.isShort = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              isShort
                  ? 'https://picsum.photos/seed/$seed/255/452'
                  : 'https://picsum.photos/seed/$seed/390/219',
              fit: BoxFit.cover,
            ),
          ),
          const Gap(16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isShort) ...[
                CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://picsum.photos/seed/$seed/36'),
                ),
                const Gap(16),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lorem(paragraphs: 1, words: 12),
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
                        lorem(paragraphs: 1, words: 1),
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
    );
  }
}
