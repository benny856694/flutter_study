import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:flutter_studdy/widget/filter_chip.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FilterChipList extends HookConsumerWidget {
  const FilterChipList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chipList =
        useState(List.generate(22, (i) => lorem(paragraphs: 1, words: 1)))
            .value;
    final selectedChipIndex = useState(0);
    return SizedBox(
      height: 36,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => MyFilterChip(
              onTap: () {
                selectedChipIndex.value = index;
              },
              title: chipList[index],
              isSelected: selectedChipIndex.value == index,
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
