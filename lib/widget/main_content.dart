import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:flutter_studdy/widget/filter_chip.dart';
import 'package:gap/gap.dart';

import 'filter_chip_list.dart';

class MainContent extends StatelessWidget {
  const MainContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 36,
          child: FilterChipList(),
        ),
        const Gap(8),
        Expanded(
            child: Container(
          color: Colors.red,
        ))
      ],
    );
  }
}
