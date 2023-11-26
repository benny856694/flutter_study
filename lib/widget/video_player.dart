import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

class MyVideoPlayer extends StatefulHookConsumerWidget {
  const MyVideoPlayer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VideoPlayerState();
}

const bg = Colors.black45;

class _VideoPlayerState extends ConsumerState<MyVideoPlayer> {
  late VideoPlayerController _controller;
  late UniqueKey _id;
  var bgColor = bg;
  Timer? fadeTimer;

  @override
  void initState() {
    super.initState();
    _id = UniqueKey();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      ),
    )..initialize().then((_) {
        setState(() {});
        // try {
        //   await Future.delayed(const Duration(milliseconds: 500), () {
        //     return _controller.play();
        //   });
        // } catch (e) {
        //   print(e.toString());
        // }
      });
    fadeTimer = buildTimer();
    print('create $_id');
  }

  Timer buildTimer() {
    return Timer(const Duration(milliseconds: 500), () {
      setState(() {
        bgColor = bg.withAlpha(50);
        print('change bg in timer');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final isHoverButtons = useState(false);
    final justShown = useState(true);

    return Stack(
      children: [
        Container(),
        Align(
          alignment: Alignment.center,
          child: IconButton(
            onPressed: () {
              _controller.play();
            },
            icon: const Icon(
              Icons.play_arrow,
              color: Colors.red,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: MouseRegion(
            onEnter: (event) {
              isHoverButtons.value = true;
              fadeTimer?.cancel();
              bgColor = bg;
              print('cancel timer, set color');
            },
            onExit: (event) {
              isHoverButtons.value = false;
              fadeTimer?.cancel();
              fadeTimer = buildTimer();
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeInOut,
              margin: const EdgeInsets.only(top: 8, right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: bgColor,
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.volume_off,
                    color: Colors.white,
                  ),
                  SizedBox(height: 16, child: VerticalDivider()),
                  Icon(
                    Icons.closed_caption,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black38],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: const Text(
              '00:00 / 20:00',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    fadeTimer?.cancel();
    print('disposed  $_id');
  }
}
