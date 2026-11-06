import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/app/main_shell.dart';
import 'package:moamo/features/auth/ui/login_screen.dart';
import 'package:moamo/features/book_search/ui/book_search_screen.dart';
import 'package:moamo/features/book_detail/ui/book_detail_screen.dart';
import 'package:moamo/features/book_detail/ui/book_memo_screen.dart';
import 'package:moamo/features/book_detail/ui/book_preview_screen.dart';
import 'package:moamo/shared/api/export.dart';
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

/// 일반 화면. 테마(`AppTheme`)의 전환 애니메이션을 쓴다.
///
/// go_router에 `builder`만 주면 안 된다. go_router는 `material_ui` 패키지의
/// MaterialApp을 찾는데, 이 앱은 Flutter SDK의 MaterialApp을 써서 찾지 못하고
/// 애니메이션 없는 페이지로 만들어 버린다. 그래서 페이지를 직접 만든다.
GoRoute _route(String path, Widget Function(GoRouterState state) build) =>
    GoRoute(
      path: path,
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        name: state.name ?? state.path,
        arguments: state.pathParameters,
        restorationId: state.pageKey.value,
        // 탭 안 화면은 Scaffold가 없어 배경이 투명하다.
        // 밀려 들어오는 동안 뒤 화면이 비치지 않게 배경을 칠한다.
        child: ColoredBox(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: build(state),
        ),
      ),
    );

/// 스플래시·로그인과 메인 화면 사이는 밀지 않고 페이드로 바꾼다.
CustomTransitionPage<void> _fadePage(GoRouterState state, Widget child) =>
    CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
    );

final appRouter = GoRouter(
  initialLocation: SplashScreen.url,
  routes: [
    GoRoute(
      path: SplashScreen.url,
      pageBuilder: (context, state) => _fadePage(state, SplashScreen()),
    ),
    GoRoute(
      path: LoginScreen.url,
      pageBuilder: (context, state) => _fadePage(state, LoginScreen()),
    ),
    StatefulShellRoute.indexedStack(
      pageBuilder: (context, state, navigationShell) =>
          _fadePage(state, MainShell(navigationShell: navigationShell)),
      branches: [
        StatefulShellBranch(
          routes: [
            _route(LibraryHomeScreen.url, (_) => LibraryHomeScreen()),
            _route(BookcaseListScreen.url, (_) => BookcaseListScreen()),
            _route(
              BookSearchScreen.url,
              (state) => BookSearchScreen(
                bookshelfId: state.uri.queryParameters['bookshelfId'],
              ),
            ),
            _route(
              BookDetailScreen.url,
              (state) => BookDetailScreen(
                bookshelfId: state.pathParameters['bookshelfId']!,
                bookId: state.pathParameters['bookId']!,
              ),
            ),
            _route(
              BookPreviewScreen.url,
              (state) => BookPreviewScreen(
                isbn: state.pathParameters['isbn']!,
                bookshelfId: state.uri.queryParameters['bookshelfId'],
                initial: state.extra as BookMetadata?,
              ),
            ),
            _route(
              BookMemoScreen.url,
              (state) => BookMemoScreen(
                bookshelfId: state.pathParameters['bookshelfId']!,
                bookId: state.pathParameters['bookId']!,
                memoId: state.uri.queryParameters['memoId'],
              ),
            ),
            _route(BookcaseFormScreen.createUrl, (_) => BookcaseFormScreen()),
            _route(
              BookcaseFormScreen.editUrl,
              (state) => BookcaseFormScreen(id: state.pathParameters['id']!),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            _route(CommunityMainScreen.url, (_) => CommunityMainScreen()),
            _route(
              BookBoardScreen.url,
              (state) => BookBoardScreen(
                isbn: state.pathParameters['isbn']!,
                initial: state.extra as BookMetadata?,
              ),
            ),
            _route(PostWriteScreen.bookUrl, (_) => PostWriteScreen()),
            _route(
              CommunitySearchScreen.url,
              (state) => CommunitySearchScreen(
                query: state.uri.queryParameters['q'] ?? '',
              ),
            ),
            _route(
              PostDetailScreen.url,
              (state) => PostDetailScreen(
                postId: int.parse(state.pathParameters['id']!),
              ),
            ),
            _route(FreeBoardScreen.url, (_) => FreeBoardScreen()),
            _route(
              PostWriteScreen.freeUrl,
              (_) => PostWriteScreen(
                title: '게시글',
                categories: ['끄적끄적', '책 찾아주세요', '서재 자랑'],
                saveIcon: 'add',
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            _route(CertificationScreen.url, (_) => CertificationScreen()),
          ],
        ),
        StatefulShellBranch(routes: [_route(MyScreen.url, (_) => MyScreen())]),
      ],
    ),

    _route(MyItemsScreen.url, (_) => MyItemsScreen()),
    _route(RandomDrawScreen.url, (_) => RandomDrawScreen()),
    _route(NotificationScreen.url, (_) => NotificationScreen()),
    _route(GuestbookScreen.url, (_) => GuestbookScreen()),
    _route(
      BookcaseDecorateScreen.url,
      (state) => BookcaseDecorateScreen(id: state.pathParameters['id']!),
    ),
  ],
);
