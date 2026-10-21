# moamo

A new Flutter project.

## Setup

`lib/shared/api/`는 git에 올리지 않는 생성 코드입니다. 클론 후, 그리고 `openapi.json`이 바뀔 때마다 생성하세요.

```bash
flutter pub get
dart run swagger_parser
dart run build_runner build --delete-conflicting-outputs
```

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
