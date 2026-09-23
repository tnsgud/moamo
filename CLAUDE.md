# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

Moamo — a Flutter app (Android/iOS) for gathering around books ("책으로 모이고, 이야기로 이어지는 곳"). Early stage: design system and app shell are in place, feature screens are stubs. Flutter SDK 3.47.x, Dart `^3.12.2`.

## Commands

```bash
flutter pub get
flutter run
flutter analyze                      # lints: package:flutter_lints/flutter.yaml
dart format lib test
flutter test                         # all tests
flutter test test/widget_test.dart   # single file
flutter test --plain-name "<name>"   # single test by name
dart run flutter_native_splash:create   # regenerate native splash after editing flutter_native_splash.yaml
```

## Architecture

- `lib/main.dart` — entry point. Calls `FlutterNativeSplash.preserve()`; the native splash stays up until `FlutterNativeSplash.remove()` is called in `SplashScreen`.
- `lib/app/` — app-wide wiring only: `Moamo` root widget (`MaterialApp.router`), `AppTheme`, and the single `GoRouter` in `router.dart` (initial route `/splash`). Routes are kept flat, not nested.
- `lib/features/<feature>/ui/<name>_screen.dart` — screens, one folder per feature (`auth`, `splash`).
- `lib/shared/` — design tokens as `abstract final class` with `static const` members: `AppColors`, `AppTextStyles`, `AppRadius`, `AppIconSizes`, `AppBaseSizes`. Use these instead of hard-coded colors, font sizes, or spacing. Text styles apply letter spacing as `fontSize * -0.01`.

## Splash screen

Two stages, because the Android 12+ native splash API can't render the design (it crops the center image to a circle and caps branding at ~200×80dp):

1. Native splash (`flutter_native_splash.yaml`) shows only the background color `#213448` (`AppColors.secondary100`). Android 12 uses `assets/images/transparent.png` so the launcher icon isn't shown.
2. `SplashScreen` (Flutter) is where the actual design (tagline, logo, bottom character image) is drawn and navigation to `/login` happens. It is currently a stub that only removes the native splash.

Files under `android/app/src/main/res/` and `ios/Runner/` related to launch screens are generated — edit the yaml and regenerate instead. iOS caches launch screens; delete the app to see changes.

## Conventions

- Commit messages: `feat:` / `fix:` / `chore:` prefix, description in Korean.
- Assets live in `assets/images/` (whole folder is registered in `pubspec.yaml`); add `2.0x/` and `3.0x/` variants for resolution-aware images.
