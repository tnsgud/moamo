import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/features/library/ui/widgets/library_fab.dart';

import 'widgets/create_bookcase.dart';
import 'widgets/library_app_bar.dart';
import 'widgets/bookcase.dart';
import 'widgets/library_chips.dart';

class LibraryHomeScreen extends StatelessWidget {
  const LibraryHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            LibraryAppBar(),
            SizedBox(height: 8),
            LibraryChips(),
            SizedBox(height: 20),
            Flexible(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  if (index == 5) {
                    return CreateBookcase();
                  }
                  return GestureDetector(
                    onTap: () {
                      final url = '/bookcase/${index + 1}/edit';
                      log(url);
                      context.push(url);
                    },
                    child: Bookcase(title: '책장 ${index + 1}'),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 20),
                itemCount: 6,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
        Positioned(right: 0, bottom: 10, child: LibraryFab()),
      ],
    );
  }
}
