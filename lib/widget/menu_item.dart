import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final bool isSelected;
  final Widget icon;
  final String title;
  const MenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: isSelected,
      selectedColor: Colors.black,
      selectedTileColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      visualDensity: VisualDensity.compact,
      onTap: () {},
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : null,
        ),
      ),
    );
  }
}
