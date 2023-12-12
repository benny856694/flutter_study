// ignore_for_file: unused_import, unused_local_variable

import 'dart:math';
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
  const UiExperiment({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tapped = useState(false);
    final blur = useState(5.0);
    const w = 200.0;
    return const Scaffold(
      body: Center(child: Text('data'),),
    );
  }
}


