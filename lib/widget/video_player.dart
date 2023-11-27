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
  var showProgress = true;
  Timer? buttonBgfadeTimer;
  Timer? progressHideTimer;

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
    buttonBgfadeTimer = buildBgFadeTimer();
    progressHideTimer = buildProgressHideTimer();
  }

  Timer buildBgFadeTimer() {
    return Timer(const Duration(milliseconds: 500), () {
      setState(() {
        bgColor = bg.withAlpha(50);
      });
    });
  }

  Timer buildProgressHideTimer() {
    return Timer(const Duration(milliseconds: 2000), () {
      setState(() {
        showProgress = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final isHoverButtons = useState(false);
    final justShown = useState(true);
    final mousePosition = useState(const Offset(0, 0));

    useEffect(() {
      setState(() {
        showProgress = true;
      });
      progressHideTimer?.cancel();
      progressHideTimer = buildProgressHideTimer();
      // print('build timer');
      return () {
        // print('canceled timer');
        // progressHideTimer?.cancel();
      };
    }, [mousePosition.value]);

    return MouseRegion(
      onHover: (event) {
        mousePosition.value = event.position;
      },
      child: Stack(
        children: [
          //Container(),
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
                buttonBgfadeTimer?.cancel();
                bgColor = bg;
              },
              onExit: (event) {
                isHoverButtons.value = false;
                buttonBgfadeTimer?.cancel();
                buttonBgfadeTimer = buildBgFadeTimer();
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
          if (showProgress)
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: const Text(
                  '00:00 / 20:00',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    buttonBgfadeTimer?.cancel();
    progressHideTimer?.cancel();
  }
}
