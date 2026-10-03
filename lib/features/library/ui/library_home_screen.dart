import 'package:flutter/material.dart';
import 'package:moamo/features/library/ui/widgets/library_app_bar.dart';
import 'package:moamo/features/library/ui/widgets/library_bookcase.dart';
import 'package:moamo/features/library/ui/widgets/library_chips.dart';
import 'package:moamo/shared/app_base_sizes.dart';

class LibraryHomeScreen extends StatelessWidget {
  const LibraryHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppBaseSizes.bodyHorizontal,
        MediaQuery.paddingOf(context).top,
        AppBaseSizes.bodyHorizontal,
        0,
      ),
      child: Column(
        children: [
          LibraryAppBar(),
          SizedBox(height: 8),
          LibraryChips(),
          SizedBox(height: 20),
          Flexible(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return LibraryBookcase(title: '책장 ${index + 1}');
              },
              separatorBuilder: (context, index) => SizedBox(height: 20),
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
