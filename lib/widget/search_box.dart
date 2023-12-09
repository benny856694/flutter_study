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
        padding: const EdgeInsets.all(1),
        decoration: const ShapeDecoration(
          color: borderColor,
          shape: StadiumBorder(),
        ),
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: const ShapeDecoration(
            shape: StadiumBorder(),
            color: Colors.white,
          ),
          child: Row(
            children: [
              const Expanded(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 2.0),
                    child: TextField(
                      decoration: InputDecoration(
                        isDense: true,
                        fillColor: Colors.white,
                        hoverColor: Colors.white,
                        filled: true,
                        border: InputBorder.none,
                        hintText: 'Search',
                      ),
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
                child: const Icon(
                  Icons.search,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
