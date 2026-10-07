import 'package:flutter/material.dart';
import 'package:moamo/features/book_search/model/book.dart';
import 'package:moamo/features/book_search/ui/widgets/book_list_item.dart';

class BookList extends StatelessWidget {
  const BookList({super.key, this.title, this.action, required this.data});

  final String? title;
  final Widget? action;
  final List<Book> data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [if (title != null) Text(title!), ?action],
          ),
          SizedBox(height: 12),
          for (var i = 0; i < data.length; i++) ...[
            if (i > 0) SizedBox(height: 20),
            BookListItem(book: data[i]),
          ],
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
