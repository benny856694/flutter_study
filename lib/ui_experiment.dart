import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_studdy/widget/search_box.dart';
import 'package:flutter_studdy/widget/video_player.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class UiExperiment extends HookConsumerWidget {
  const UiExperiment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tapped = useState(false);
    final blur = useState(5.0);
    const w = 200.0;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.black38,
        appBar: AppBar(
          titleSpacing: 0,
          centerTitle: true,
          //foregroundColor: Colors.white,
          leading: const Icon(Icons.menu),
          title: const Text('Title'),
          // backgroundColor: Colors.black,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.notifications_none))
          ],
        ),
        body: Center(
          child: SizedBox(
            width: 300,
            height: 400,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 0, left: 0),
                  width: w,
                  height: w,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(w / 2),
                  ),
                )
                    .animate(
                      onPlay: (controller) => controller.repeat(reverse: true),
                    )
                    .move(
                      begin: Offset(0, 0),
                      end: Offset(30, 30),
                      duration: 3.seconds,
                    )
                    .scale(end: Offset(0.5, 0.5)),
                Container(
                  margin: EdgeInsets.only(top: 0, left: w / 2),
                  width: w,
                  height: w,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(w / 2),
                  ),
                )
                    .animate(
                      delay: 2.seconds,
                      onPlay: (controller) => controller.repeat(reverse: true),
                    )
                    .move(
                      begin: Offset(0, 0),
                      end: Offset(-30, 30),
                      duration: 3.seconds,
                    )
                    .scale(end: Offset(0.5, 0.5)),
                Container(
                  margin: EdgeInsets.only(top: w / 2, left: w / 4),
                  width: w,
                  height: w,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(w / 2),
                  ),
                )
                    .animate(
                      delay: 4.seconds,
                      onPlay: (controller) => controller.repeat(reverse: true),
                    )
                    .move(
                      begin: Offset(0, 0),
                      end: Offset(0, 30),
                      duration: 3.seconds,
                    )
                    .scale(end: Offset(0.5, 0.5)),
                Positioned.fill(
                  child: ClipRRect(
                    //,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                          sigmaX: blur.value, sigmaY: blur.value),
                      child: Container(
                        color: Colors.white.withOpacity(0.2),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.white),
                  ),
                  child: const Center(
                    child: Text(
                      "See the world",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 4,
                    left: 5,
                    right: 5,
                    child: Slider(
                      divisions: 50,
                      min: 0,
                      max: 50,
                      onChanged: (value) => blur.value = value,
                      value: blur.value,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
