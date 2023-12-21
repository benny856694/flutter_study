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
      child: FilledButton(
        onPressed: onTap,
        clipBehavior: Clip.antiAlias,
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          visualDensity: VisualDensity.compact,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          backgroundColor: isSelected ? Colors.black : Colors.black12,
          foregroundColor: isSelected ? Colors.white : Colors.black,
        ),
        child: Text(title),
      ),
    );
  }
}
