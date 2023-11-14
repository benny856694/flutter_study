import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class O3d extends HookConsumerWidget {
  const O3d({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('O3d example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(),
    );
  }
}
