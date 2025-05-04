import 'package:flutter/material.dart';

class GenericFilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final ValueChanged<bool> onSelected;
  final Color backgroundColor;
  final Color selectedColor;
  final Color labelColor;

  const GenericFilterChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onSelected,
    this.backgroundColor = const Color(0xFFF5F5F5),
    this.selectedColor = const Color(0xFFC8E6C9),
    this.labelColor = Colors.black87,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        onSelected: onSelected,
        selected: selected,
        backgroundColor: backgroundColor,
        selectedColor: selectedColor,
        labelStyle: TextStyle(color: labelColor),
        shape: StadiumBorder(side: BorderSide(color: Colors.grey.shade300)),
      ),
    );
  }
}
