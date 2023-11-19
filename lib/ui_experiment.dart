import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UiExperiment extends HookConsumerWidget {
  const UiExperiment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        //extendBodyBehindAppBar: true,
        appBar: AppBar(
          // shape: const RoundedRectangleBorder(
          //     borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
          titleSpacing: 0,
          centerTitle: true,
          //foregroundColor: Colors.white,
          leading: const Icon(Icons.menu),
          title: const Text('Title'),
          backgroundColor: Colors.indigo,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.notifications_none))
          ],
          // flexibleSpace: Container(
          //   decoration: const BoxDecoration(
          //     image: DecorationImage(
          //       fit: BoxFit.cover,
          //       image: NetworkImage(
          //           'https://th.bing.com/th/id/OIP.HmWwBR3uiBIVBP2wzx6AGAHaEo?pid=ImgDet&w=474&h=296&rs=1'),
          //     ),
          //   ),
          // ),
          // bottom: const TabBar(tabs: [
          //   Tab(
          //     icon: Icon(Icons.home),
          //     text: 'home',
          //   ),
          //   Tab(
          //     icon: Icon(Icons.home),
          //     text: 'abc',
          //   ),
          //   Tab(
          //     icon: Icon(Icons.home),
          //     text: 'def',
          //   ),
          // ]),
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://th.bing.com/th/id/R.6f744baeaded6299ceb6174ca1817de8?rik=9eyUw3B3WRq%2brg&pid=ImgRaw&r=0'))),
        ),
      ),
    );
  }
}
