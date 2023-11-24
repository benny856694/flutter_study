import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ShowMoreButton extends HookConsumerWidget {
  const ShowMoreButton({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHover = useState(false);
    return SizedBox(
      height: 34,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: const Divider(
              height: 0,
              thickness: 1,
            ),
          ),
          Container(
            clipBehavior: Clip.antiAlias,
            alignment: Alignment.center,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              border: Border.all(color: Colors.black12),
              color: isHover.value ? Colors.grey[300] : Colors.white,
            ),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (event) => isHover.value = true,
              onExit: (event) => isHover.value = false,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Show more',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RotatedBox(quarterTurns: 1, child: Icon(Icons.chevron_right)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
