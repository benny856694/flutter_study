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
    return Row(
      children: [
        MyFilterChip(
          title: 'All',
          isSelected: true,
        ),
        const Gap(8),
        ...List.filled(20, 0).map(
          (e) {
            return Padding(
              padding: EdgeInsets.only(right: 8),
              child: MyFilterChip(title: lorem(paragraphs: 1, words: 1)),
            );
          },
        ).toList(),
      ],
    );
  }
}
