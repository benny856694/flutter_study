import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
        backgroundColor: Colors.white,
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
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.green, Colors.yellow])),
                    child: const Text('Hello World'),
                  ),
                  const Spacer(),
                  Container(
                    //height: 30,
                    width: 250,
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        26,
                      ),
                      border: Border.all(
                        width: 1,
                      ),
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(8),
                        prefixIcon: Icon(
                          Icons.search,
                          size: 20,
                        ),
                        prefixIconConstraints:
                            BoxConstraints(minHeight: 20, minWidth: 25),
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
              SizedBox.square(
                dimension: 50,
                child: GestureDetector(
                  onTapDown: (_) => tapped.value = true,
                  onTapUp: (details) => tapped.value = false,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Colors.white),
                      shape: BoxShape.circle,
                      color: Colors.amber,
                      boxShadow: tapped.value ? null : kElevationToShadow[6],
                    ),
                    child: const Text(
                      '70%',
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    height: 150,
                    width: 250,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: Color(0xff2c315c),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        children: [
                          const Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sales',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 16),
                                ),
                                Text(
                                  'sales statistics',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  'sales statistics',
                                  style: TextStyle(
                                    color: Colors.white38,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: SleekCircularSlider(
                              appearance: CircularSliderAppearance(
                                  startAngle: -90,
                                  angleRange: 360,
                                  customColors: CustomSliderColors(
                                    progressBarColors: [
                                      Colors.red,
                                      Colors.cyan,
                                      Colors.yellow
                                    ],
                                  ),
                                  customWidths: CustomSliderWidths(
                                    progressBarWidth: 10,
                                    trackWidth: 10,
                                  )),
                              min: 0,
                              max: 100,
                              initialValue: 80,
                              innerWidget: (percentage) => Center(
                                  child: Text(
                                '$percentage',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(8),
              SizedBox(
                height: 200,
                //width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 13,
                  itemBuilder: (_, i) {
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          //side: BorderSide(),
                          borderRadius: BorderRadius.circular(12)),
                      elevation: 8,
                      child: Image.network(
                          'https://picsum.photos/seed/${i + 1}/300/200'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
