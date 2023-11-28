import 'package:flutter/material.dart';
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
                  width: 100,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                  ),
                  child: Container(
                    //alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: const Text('abc'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
