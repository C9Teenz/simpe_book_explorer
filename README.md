# Simple Book Explorer

A Flutter application to explore books using the Open Library API. This app features a clean and modern UI with book listing and details pages.

## Features

- 📚 Browse books from Open Library API
- 🔄 Pull-to-refresh functionality
- 🎨 Modern and beautiful UI design
- ✨ Smooth Hero animations between pages
- 🖼️ Image loading with placeholders
- 📱 Responsive design

## Architecture

This project follows **Clean Architecture** principles with:
- **Domain Layer**: Entities, Repository Interfaces
- **Data Layer**: Models, Repository Implementations, Data Sources
- **Presentation Layer**: BLoC pattern for state management, UI widgets

## Prerequisites

Before running this project, make sure you have:

- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / VS Code with Flutter extensions
- Android SDK (for Android builds)
- Xcode (for iOS builds - Mac only)

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/C9Teenz/simpe_book_explorer.git
cd simple_book_explorer
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Run the Application

#### Run on Emulator/Device

```bash
flutter run
```

#### Run in Debug Mode

```bash
flutter run --debug
```

#### Run in Release Mode

```bash
flutter run --release
```

## Building APK

### Build Debug APK

```bash
flutter build apk --debug
```

The APK will be generated at:
```
build/app/outputs/flutter-apk/app-debug.apk
```

### Build Release APK (Single Universal)

```bash
flutter build apk --release
```

The universal APK will be at:
```
build/app/outputs/flutter-apk/app-release.apk
```

### Build Release APK (Split per ABI)

```bash
flutter build apk --release --split-per-abi
```

This creates multiple APKs for different architectures:
```
build/app/outputs/flutter-apk/app-armeabi-v7a-release.apk
build/app/outputs/flutter-apk/app-arm64-v8a-release.apk
build/app/outputs/flutter-apk/app-x86_64-release.apk
```

### Build App Bundle (For Google Play Store)

```bash
flutter build appbundle --release
```

The AAB file will be at:
```
build/app/outputs/bundle/release/app-release.aab
```

## Project Structure

```
lib/
├── core/
│   ├── di/                 # Dependency Injection
│   ├── error/              # Error handling
│   └── network/            # Network utilities
├── features/
│   └── book/
│       ├── data/           # Data layer
│       │   ├── models/
│       │   ├── repositories/
│       │   └── datasources/
│       ├── domain/         # Domain layer
│       │   ├── entities/
│       │   ├── repositories/
│       │   └── usecases/
│       └── presentation/   # Presentation layer
│           ├── bloc/
│           └── ui/
└── main.dart
```

## Dependencies

Main dependencies used in this project:

- `flutter_bloc` - State management
- `get_it` - Dependency injection
- `dartz` - Functional programming
- `dio` - HTTP client
- `equatable` - Value equality

## API

This app uses the [Open Library API](https://openlibrary.org/developers/api)

## Screenshots

<!-- Add your screenshots here -->

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.



