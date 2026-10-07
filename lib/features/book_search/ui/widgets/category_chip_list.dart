import 'package:flutter/material.dart';
import 'package:moamo/features/book_search/ui/widgets/category_chip.dart';

class CategoryChipList extends StatelessWidget {
  const CategoryChipList({super.key, required this.data});

  final List<String> data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var i = 0; i < data.length; i++) ...[
            if (i > 0) SizedBox(width: 8),
            CategoryChip(name: data[i], isSelected: i == 0),
          ],
        ],
      ),
    );
  }
}
