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
          const Center(
            child: Divider(
              height: 0,
              thickness: 1,
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (event) => isHover.value = true,
            onExit: (event) => isHover.value = false,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 64),
                shape: const StadiumBorder(),
                side: const BorderSide(color: Colors.black26),
                backgroundColor:
                    isHover.value ? Colors.grey[300] : Colors.white,
              ),
              child: RichText(
                text: const TextSpan(text: 'Show more', children: [
                  WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Icon(
                          Icons.chevron_right,
                          color: Colors.black,
                        ),
                      ))
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
