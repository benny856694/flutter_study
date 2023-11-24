import 'package:flutter/material.dart';

const borderColor = Color.fromARGB(255, 204, 204, 204);
const searchIconBg = Color.fromARGB(255, 248, 248, 248);
const borderRadius = 26.0;

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Container(
        clipBehavior: Clip.antiAlias,
        // padding: const EdgeInsets.only(
        //   left: 16,
        // ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: Colors.white,
            border: Border.all(color: borderColor)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius - 1),
          child: Row(
            children: [
              const Expanded(
                child: Center(
                  child: TextField(
                    //style: TextStyle(color: Colors.white60),
                    decoration: InputDecoration(
                      isDense: true,
                      fillColor: Colors.white,
                      hoverColor: Colors.white,
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
              Container(
                width: 64,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: searchIconBg,
                    border: Border(left: BorderSide(color: borderColor))),
                child: const Center(
                  child: Icon(
                    Icons.search,
                    size: 28,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
