import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final timerProvider = StateProvider<int>((ref) {
  return 2;
});

final loaderProvider = FutureProvider<int>((ref) async {
  final sleep = ref.watch(timerProvider);
  await Future.delayed(Duration(seconds: sleep));
  return Random().nextInt(100);
});

class RiverPodExample extends HookConsumerWidget {
  const RiverPodExample({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = useState(0);
    final loader = ref.watch(loaderProvider);
    final timer = ref.watch(timerProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Riverpod Example'),
      ),
      body: Center(
        child: loader.when(
          data: (data) {
            EasyLoading.dismiss();
            return Text('$data');
          },
          error: (error, stack) => const Text('error'),
          loading: () {
            EasyLoading.show(status: 'wait for $timer sec(s)');
            return const SizedBox.shrink();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(timerProvider.notifier).state = Random().nextInt(10);
        },
        child: const Icon(Icons.timer),
      ),
    );
  }
}
