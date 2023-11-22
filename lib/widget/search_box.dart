import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(1),
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 198, 198, 198),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    bottomLeft: Radius.circular(24)),
              ),
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  //color: Color.fromARGB(255, 34, 34, 34),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(23),
                      bottomLeft: Radius.circular(23)),
                ),
                child: const TextField(
                  //style: TextStyle(color: Colors.white60),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: EdgeInsets.only(
                      left: 18,
                    ),
                    border: InputBorder.none,
                    hintText: 'Search',
                    //hintStyle: TextStyle(color: Colors.white60)),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 80,
            padding: const EdgeInsets.only(top: 1, right: 1, bottom: 1),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 198, 198, 198),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(24),
                  bottomRight: Radius.circular(24)),
            ),
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 240, 240, 240),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(24),
                    bottomRight: Radius.circular(24)),
              ),
              child: const Center(
                child: Icon(
                  Icons.search,
                  size: 28,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
