import 'package:flutter/material.dart';

const chipBgColor = Color.fromARGB(255, 242, 242, 242);

class MyFilterChip extends StatelessWidget {
  final bool isSelected;
  final String title;
  const MyFilterChip({
    super.key,
    required this.title,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
          alignment: Alignment.center,
          color: isSelected ? const Color.fromARGB(255, 3, 3, 3) : chipBgColor,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}
