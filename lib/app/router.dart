import 'package:go_router/go_router.dart';
import 'package:moamo/app/main_shell.dart';
import 'package:moamo/features/auth/ui/login_screen.dart';
import 'package:moamo/features/book_search/ui/book_search_screen.dart';
import 'package:moamo/features/book_detail/ui/book_detail_screen.dart';
import 'package:moamo/features/book_detail/ui/book_memo_screen.dart';
import 'package:moamo/features/bookcase_decorate/ui/bookcase_decorate_screen.dart';
import 'package:moamo/features/bookcase_list/ui/bookcase_list_screen.dart';
import 'package:moamo/features/certification/ui/certification_screen.dart';
import 'package:moamo/features/community/ui/book_board_screen.dart';
import 'package:moamo/features/community/ui/community_main_screen.dart';
import 'package:moamo/features/community/ui/community_search_screen.dart';
import 'package:moamo/features/community/ui/free_board_screen.dart';
import 'package:moamo/features/community/ui/post_detail_screen.dart';
import 'package:moamo/features/community/ui/post_write_screen.dart';
import 'package:moamo/features/bookcase_form/ui/bookcase_form_screen.dart';
import 'package:moamo/features/guestbook/ui/guestbook_screen.dart';
import 'package:moamo/features/library/ui/library_home_screen.dart';
import 'package:moamo/features/my/ui/my_items_screen.dart';
import 'package:moamo/features/my/ui/my_screen.dart';
import 'package:moamo/features/my/ui/random_draw_screen.dart';
import 'package:moamo/features/notification/ui/notification_screen.dart';
import 'package:moamo/features/splash/ui/splash_screen.dart';

final appRouter = GoRouter(
  initialLocation: SplashScreen.url,
  routes: [
    GoRoute(
      path: SplashScreen.url,
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(path: LoginScreen.url, builder: (context, state) => LoginScreen()),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          MainShell(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: LibraryHomeScreen.url,
              builder: (context, state) => LibraryHomeScreen(),
            ),
            GoRoute(
              path: BookcaseListScreen.url,
              builder: (context, state) => BookcaseListScreen(),
            ),
            GoRoute(
              path: BookSearchScreen.url,
              builder: (context, state) => BookSearchScreen(),
            ),
            GoRoute(
              path: BookDetailScreen.url,
              builder: (context, state) =>
                  BookDetailScreen(id: int.parse(state.pathParameters['id']!)),
            ),
            GoRoute(
              path: BookMemoScreen.url,
              builder: (context, state) => BookMemoScreen(
                bookId: int.parse(state.pathParameters['id']!),
              ),
            ),
            GoRoute(
              path: BookcaseFormScreen.createUrl,
              builder: (context, state) => BookcaseFormScreen(),
            ),
            GoRoute(
              path: BookcaseFormScreen.editUrl,
              builder: (context, state) => BookcaseFormScreen(
                id: int.parse(state.pathParameters['id']!),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: CommunityMainScreen.url,
              builder: (context, state) => CommunityMainScreen(),
            ),
            GoRoute(
              path: BookBoardScreen.url,
              builder: (context, state) => BookBoardScreen(
                bookId: int.parse(state.pathParameters['id']!),
              ),
            ),
            GoRoute(
              path: PostWriteScreen.bookUrl,
              builder: (context, state) => PostWriteScreen(),
            ),
            GoRoute(
              path: CommunitySearchScreen.url,
              builder: (context, state) => CommunitySearchScreen(
                query: state.uri.queryParameters['q'] ?? '',
              ),
            ),
            GoRoute(
              path: PostDetailScreen.url,
              builder: (context, state) => PostDetailScreen(
                postId: int.parse(state.pathParameters['id']!),
              ),
            ),
            GoRoute(
              path: FreeBoardScreen.url,
              builder: (context, state) => FreeBoardScreen(),
            ),
            GoRoute(
              path: PostWriteScreen.freeUrl,
              builder: (context, state) => PostWriteScreen(
                title: '게시글',
                categories: ['끄적끄적', '책 찾아주세요', '서재 자랑'],
                saveIcon: 'add',
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: CertificationScreen.url,
              builder: (context, state) => CertificationScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: MyScreen.url,
              builder: (context, state) => MyScreen(),
            ),
          ],
        ),
      ],
    ),

    GoRoute(
      path: MyItemsScreen.url,
      builder: (context, state) => MyItemsScreen(),
    ),
    GoRoute(
      path: RandomDrawScreen.url,
      builder: (context, state) => RandomDrawScreen(),
    ),
    GoRoute(
      path: NotificationScreen.url,
      builder: (context, state) => NotificationScreen(),
    ),
    GoRoute(
      path: GuestbookScreen.url,
      builder: (context, state) => GuestbookScreen(),
    ),
    GoRoute(
      path: BookcaseDecorateScreen.url,
      builder: (context, state) => BookcaseDecorateScreen(),
    ),
  ],
);
