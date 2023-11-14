import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:o3d/o3d.dart';

class O3d extends HookConsumerWidget {
  const O3d({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = useState(0);
    final pageController = usePageController();
    final o3dcontroller = useState(O3DController());
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text('O3d example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Stack(
        children: [
          O3D(
            autoPlay: true,
            cameraControls: false,
            controller: o3dcontroller.value,
            src: 'assets/disney_style_character.glb',
          ),
          Container(
            margin: const EdgeInsets.all(12),
            width: 100,
            height: double.infinity,
            child: PageView(
              //physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              children: const [
                Column(
                  children: <Widget>[
                    SizedBox(
                      width: double.infinity,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          'Daily Goals',
                        ),
                      ),
                    ),
                  ],
                ),
                Center(child: Text('page2')),
                Center(child: Text('page3'))
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index.value,
          onTap: (value) {
            index.value = value;
            pageController.animateToPage(value,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.hearing), label: "Stats"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My'),
          ]),
    );
  }
}
