import 'package:flutter/material.dart';
import 'package:moamo/shared/widget/app_chip.dart';

class AppChipList extends StatelessWidget {
  const AppChipList({
    super.key,
    required this.data,
    this.selectedIndex = 0,
    this.onSelected,
    this.padding = EdgeInsets.zero,
  });

  final List<String> data;
  final int selectedIndex;
  final ValueChanged<int>? onSelected;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: padding,
      child: Row(
        children: [
          for (var i = 0; i < data.length; i++) ...[
            if (i > 0) SizedBox(width: 8),
            GestureDetector(
              onTap: () => onSelected?.call(i),
              child: AppChip(name: data[i], isSelected: i == selectedIndex),
            ),
          ],
        ],
      ),
    );
  }
}
