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
  initialLocation: '/library',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => SplashScreen()),
    GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          MainShell(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/library',
              builder: (context, state) => LibraryHomeScreen(),
            ),
            GoRoute(
              path: '/bookcases',
              builder: (context, state) => BookcaseListScreen(),
            ),
            GoRoute(
              path: '/book-search',
              builder: (context, state) => BookSearchScreen(),
            ),
            GoRoute(
              path: '/book/:id',
              builder: (context, state) =>
                  BookDetailScreen(id: int.parse(state.pathParameters['id']!)),
            ),
            GoRoute(
              path: '/book/:id/memo',
              builder: (context, state) => BookMemoScreen(
                bookId: int.parse(state.pathParameters['id']!),
              ),
            ),
            GoRoute(
              path: '/bookcase/new',
              builder: (context, state) => BookcaseFormScreen(),
            ),
            GoRoute(
              path: '/bookcase/:id/edit',
              builder: (context, state) {
                return BookcaseFormScreen(
                  id: int.parse(state.pathParameters['id']!),
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/community',
              builder: (context, state) => CommunityMainScreen(),
            ),
            GoRoute(
              path: '/community/book/:id',
              builder: (context, state) => BookBoardScreen(
                bookId: int.parse(state.pathParameters['id']!),
              ),
            ),
            GoRoute(
              path: '/community/book/:id/write',
              builder: (context, state) => PostWriteScreen(),
            ),
            GoRoute(
              path: '/community/search',
              builder: (context, state) => CommunitySearchScreen(
                query: state.uri.queryParameters['q'] ?? '',
              ),
            ),
            GoRoute(
              path: '/community/post/:id',
              builder: (context, state) => PostDetailScreen(
                postId: int.parse(state.pathParameters['id']!),
              ),
            ),
            GoRoute(
              path: '/community/free',
              builder: (context, state) => FreeBoardScreen(),
            ),
            GoRoute(
              path: '/community/free/write',
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
              path: '/certification',
              builder: (context, state) => CertificationScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(path: '/my', builder: (context, state) => MyScreen()),
          ],
        ),
      ],
    ),

    GoRoute(path: '/my/items', builder: (context, state) => MyItemsScreen()),
    GoRoute(path: '/my/draw', builder: (context, state) => RandomDrawScreen()),
    GoRoute(
      path: '/notification',
      builder: (context, state) => NotificationScreen(),
    ),
    GoRoute(path: '/guestbook', builder: (context, state) => GuestbookScreen()),
    GoRoute(
      path: '/bookcase/decorate',
      builder: (context, state) => BookcaseDecorateScreen(),
    ),
  ],
);
