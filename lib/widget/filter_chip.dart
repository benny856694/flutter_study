import 'package:flutter/material.dart';

const chipBgColor = Color.fromARGB(255, 242, 242, 242);

typedef OnTap = void Function();

class MyFilterChip extends StatelessWidget {
  final bool isSelected;
  final String title;
  final OnTap? onTap;

  const MyFilterChip({
    super.key,
    required this.title,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        child: Container(
            alignment: Alignment.center,
            color:
                isSelected ? const Color.fromARGB(255, 3, 3, 3) : chipBgColor,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )),
      ),
    );
  }
}
