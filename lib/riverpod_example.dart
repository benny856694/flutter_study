import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'device_discovery.dart';

final devicesProvider = FutureProvider<List<Device>>((ref) async {
  final devices = await discoverDevices();
  return devices;
});

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
    final devices = ref.watch(devicesProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Riverpod Example'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            loader.when(
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
            TextField(
              decoration: InputDecoration(
                suffixIcon: InkWell(
                  onTap: () {
                    EasyLoading.showInfo('clicked');
                  },
                  child: Icon(Icons.qr_code),
                ),
              ),
            ),
            devices.when(
                skipLoadingOnRefresh: false,
                data: (data) {
                  return data.isEmpty
                      ? const Text('0 devices found')
                      : Expanded(
                          child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              final dev = data[index];
                              return ListTile(
                                title: Text(dev.ip),
                                subtitle: Text(dev.platform),
                              );
                            },
                          ),
                        );
                },
                error: (error, st) => const Text('error'),
                loading: () => const CircularProgressIndicator()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.invalidate(devicesProvider);
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
