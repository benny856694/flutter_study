import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:flutter_studdy/widget/filter_chip.dart';
import 'package:gap/gap.dart';

class FilterChipList extends StatelessWidget {
  const FilterChipList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final chipList = List.filled(22, 0);
    return SizedBox(
      height: 36,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => MyFilterChip(
              title: lorem(paragraphs: 1, words: 1),
              isSelected: index == 0,
            ),
            separatorBuilder: (ctx, idx) => const Gap(8),
            itemCount: chipList.length,
          ),
          Container(
            alignment: Alignment.centerRight,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(
                colors: [Colors.white.withAlpha(0), Colors.white, Colors.white],
                stops: const [0, 0.6, 1],
              ),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.chevron_right),
            ),
          )
        ],
      ),
    );
  }
}
