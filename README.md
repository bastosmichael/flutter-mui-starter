# Flutter MUI Starter

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A Flutter starter template for SaaS-ready mobile, desktop, and web experiences using Material Design 3. It provides responsive layouts, opinionated theming, and routed navigation so teams can prototype or launch production apps quickly.

## Table of Contents

- [Features](#features)
- [Demo](#demo)
- [Setup](#setup)
  - [Simple Mode Setup](#simple-mode-setup)
  - [Advanced Mode Setup](#advanced-mode-setup)
- [Usage](#usage)
- [Deployment](#deployment)
- [Contributing](#contributing)
- [FAQ](#faq)
- [License](#license)
- [Acknowledgements](#acknowledgements)
- [Contact](#contact)

## Features

- **Material Design 3 theming** with light/dark palettes and typography built on Roboto for consistent brand expression out of the box.
- **Responsive layouts** powered by `responsive_framework`, adapting navigation and content for mobile, tablet, desktop, and 4K breakpoints.
- **Routed navigation** via `go_router`, including menu-aware scaffolding that automatically wires routes to buttons or drawers.
- **Starter home screen** scaffolded with stateful controller patterns for rapid feature extension.
- **Production-friendly package set** including cached images, HTTP utilities, and URL launching for common SaaS workflows.

## Demo

No public demo is available yet. Run locally with the setup steps below to explore the starter.

## Setup

This project targets Flutter 3+ and can be run with the system Flutter SDK or through [FVM](https://fvm.app/) for version management. There are no required API keys by default.

### Simple Mode Setup

1. **Clone the Repository**
   ```bash
   git clone https://gitlab.com/bastosmichael/flutter-mui-starter.git
   cd flutter-mui-starter
   ```

2. **Install Dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the App**

   ```bash
   flutter run
   ```

### Advanced Mode Setup

Use this path if you want pinned Flutter versions, multi-platform builds, or custom environment targeting.

1. **Install FVM and pin Flutter**
   ```bash
   dart pub global activate fvm
   fvm use stable
   ```

2. **Install Dependencies with FVM**
   ```bash
   fvm flutter pub get
   ```

3. **Configure Optional Environment Variables**
   Create a `.env` (or use platform-specific env injection) if you introduce APIs. Typical variables include:
   - `APP_MODE` (e.g., `production`, `staging`)
   - `API_BASE_URL`
   - `SENTRY_DSN`

4. **Run with Target Options**
   ```bash
   fvm flutter run --dart-define=APP_MODE=staging
   ```

## Usage

1. Launch the app to see the responsive scaffold with a demo home screen.
2. Add routes in `lib/config/router.dart` and include them in `AppRoutes.routes` to surface them automatically in the header/drawer navigation.
3. Customize theming through `lib/theme/color_themes.dart` and `lib/theme/text_themes.dart` for brand alignment.
4. Extend the home controller in `lib/screens/home/home_controller.dart` to integrate your SaaS flows (authentication, dashboards, data capture, etc.).
5. Leverage included packages (`http`, `cached_network_image`, `url_launcher`) to connect to backend services and external resources.

## Deployment

Common strategies:

- **Android**: `flutter build apk --release` and distribute via Play Console.
- **iOS**: Archive with Xcode (`xcodebuild archive ...`) and export an IPA for App Store Connect.
- **Web/Desktop**: Use `flutter build web`, `flutter build macos`, `flutter build linux`, or `flutter build windows` and host on your preferred provider (Firebase Hosting, S3/CloudFront, etc.).

[![Deploy with Netlify](https://www.netlify.com/img/deploy/button.svg)](https://www.netlify.com/)

## Contributing

Contributions are welcome! Please fork the repo, create a feature branch, and open a pull request. Refer to `CONTRIBUTING.md` if available, and follow Flutter best practices (format code with `flutter format` and include tests where applicable).

## FAQ

- **Which Flutter version is required?** Any 3.x release is supported; FVM steps above help pin a stable toolchain.
- **Do I need API keys to run locally?** No. The starter has no required external services. Add your own `.env` when integrating third-party APIs.
- **How do I add more pages?** Define new routes in `lib/config/router.dart`, append their names to `AppRoutes.routes`, and wrap them with `MenuScaffold` for responsive navigation.
- **Can I switch themes at runtime?** Both light and dark Material 3 color schemes are defined. Hook into `ThemeMode` or settings logic to toggle based on user preference.

## License

This project is licensed under the MIT license.

## Acknowledgements

- [Flutter](https://flutter.dev/) for the cross-platform framework.
- [Material Design 3](https://m3.material.io/) for UI patterns.
- [responsive_framework](https://pub.dev/packages/responsive_framework) for adaptive layouts.
- [go_router](https://pub.dev/packages/go_router) for declarative routing.
- [google_fonts](https://pub.dev/packages/google_fonts) for typography.

## Contact

For questions or support, please open an issue on the repository or reach the maintainer at `maintainer@example.com`.
