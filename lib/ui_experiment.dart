import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
          // backgroundColor: Colors.black,
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                    gradient:
                        LinearGradient(colors: [Colors.green, Colors.yellow])),
                child: const Text('Hello World'),
              ),
              const Spacer(),
              Container(
                height: 30,
                width: 250,
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    32,
                  ),
                  border: Border.all(
                    width: 1,
                  ),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    //contentPadding: EdgeInsets.symmetric(vertical: 0),
                    icon: Icon(Icons.search),
                    hintText: 'Searching...',
                    border: InputBorder.none,
                  ),
                ),
              ),
              const Gap(8),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_none,
                ),
              ),
              const Gap(8),
              SizedBox.square(
                dimension: 32,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Image.network(
                    'https://th.bing.com/th/id/OIP.OH5utUfV4EFNQ7p9NnpfUAHaLH?w=122&h=183&c=7&r=0&o=5&dpr=1.3&pid=1.7',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Gap(8),
              const Text('Benny'),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_drop_down),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
