import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:moamo/features/library/data/my_bookshelves_provider.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';

import 'widgets/create_bookcase.dart';
import 'widgets/library_app_bar.dart';
import 'widgets/bookcase.dart';
import 'widgets/library_chips.dart';
import 'widgets/library_fab.dart';

class LibraryHomeScreen extends ConsumerWidget {
  const LibraryHomeScreen({super.key});

  static String url = '/library';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookshelves = ref.watch(myBookshelvesProvider);

    return Stack(
      children: [
        Column(
          children: [
            LibraryAppBar(),
            SizedBox(height: 8),
            LibraryChips(),
            SizedBox(height: 20),
            Flexible(
              child: bookshelves.when(
                data: (shelves) => ListView.separated(
                  itemCount: shelves.length + 1,
                  separatorBuilder: (context, index) => SizedBox(height: 20),
                  itemBuilder: (context, index) {
                    if (index == shelves.length) return CreateBookcase();
                    final shelf = shelves[index];
                    return GestureDetector(
                      onTap: () => context.push('/bookcase/${shelf.id}/edit'),
                      child: Bookcase(title: shelf.name),
                    );
                  },
                ),
                loading: () => Center(child: CircularProgressIndicator()),
                error: (error, _) => Center(
                  child: GestureDetector(
                    onTap: () => ref.invalidate(myBookshelvesProvider),
                    child: Text(
                      '책장을 불러오지 못했어요. 탭해서 다시 시도',
                      style: AppTextStyles.body2.copyWith(
                        color: AppColors.neutral50,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
        Positioned(
          right: 0,
          bottom: 10,
          child: GestureDetector(
            onTap: () => context.push('/guestbook'),
            child: LibraryFab(),
          ),
        ),
      ],
    );
  }
}
