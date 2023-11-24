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
        useState(List.generate(15, (i) => lorem(paragraphs: 1, words: 1)))
            .value;
    final selectedChipIndex = useState(0);
    final controller = useScrollController();
    final leftVisible = useState(false);
    final rightVisible = useState(true);
    controller.addListener(
      () {
        final maxPos = controller.position.maxScrollExtent;
        final pos = controller.position.pixels;
        //print('maxPos: $maxPos, pos:$pos');
        leftVisible.value = pos > 0;
        rightVisible.value = pos < maxPos;
      },
    );

    return SizedBox(
      height: 36,
      child: Stack(
        clipBehavior: Clip.none,
        //alignment: Alignment.centerRight,
        children: [
          ListView.separated(
            controller: controller,
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
          if (rightVisible.value) ...[
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                alignment: Alignment.centerRight,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withAlpha(0),
                      Colors.white,
                      Colors.white
                    ],
                    stops: const [0, 0.5, 1],
                  ),
                ),
              ),
            ),
            Positioned(
              right: -15,
              top: 0,
              child: IconButton(
                onPressed: () {
                  controller.animateTo(
                    controller.position.pixels + 100,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                  );
                },
                icon: const Icon(Icons.chevron_right),
              ),
            )
          ],
          if (leftVisible.value) ...[
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                alignment: Alignment.centerLeft,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      Colors.white.withAlpha(0),
                      Colors.white,
                      Colors.white
                    ],
                    stops: const [0, 0.5, 1],
                  ),
                ),
              ),
            ),
            Positioned(
              left: -15,
              top: 0,
              child: IconButton(
                onPressed: () {
                  controller.animateTo(
                    controller.position.pixels - 100,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                  );
                },
                icon: const Icon(Icons.chevron_left),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
