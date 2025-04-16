# Intuji Infogrid Mobile App Documentation

```

 _____      _         _ _   _____       __                 _     _ 
|_   _|    | |       (_|_) |_   _|     / _|               (_)   | |
  | | _ __ | |_ _   _ _ _    | | _ __ | |_ ___   __ _ _ __ _  __| |
  | || '_ \| __| | | | | |   | || '_ \|  _/ _ \ / _` | '__| |/ _` |
 _| || | | | |_| |_| | | |  _| || | | | || (_) | (_| | |  | | (_| |
 \___/_| |_|\__|\__,_| |_|  \___/_| |_|_| \___/ \__, |_|  |_|\__,_|
                    _/ |                         __/ |             
                   |__/                         |___/              
```                 

## Overview
This document provides an in-depth overview of the Intuji Infogrid project structure, including its directory organization, purpose of each folder, and best practices for maintaining a scalable and modular application.

## Hardware Requirements
To develop and run this Flutter application efficiently, your system should meet the following hardware requirements:

- **Minimum Requirements:**
  - Processor: Intel Core i3 (8th Gen) or AMD Ryzen 3
  - RAM: 8GB
  - Storage: 40GB available space
  - OS: Windows 10 (64-bit) / macOS Monterey / Linux (Ubuntu 20.04+)
  - GPU: Integrated Graphics

- **Recommended Requirements:**
  - Processor: Intel Core i5/i7 (10th Gen) or AMD Ryzen 5/7
  - RAM: 16GB or more
  - Storage: SSD with at least 40-70GB free space
  - OS: Windows 11 / macOS Ventura / Latest Linux (Ubuntu 22.04+)
  - GPU: Dedicated GPU for better rendering performance

## Software Requirements
Ensure the following software dependencies are installed:

- **Flutter SDK**: Latest stable version ([Download Here](https://flutter.dev/docs/get-started/install))
- **Dart SDK**: Comes with Flutter, ensure it's up to date
- **IDE**: Android Studio / Visual Studio Code / IntelliJ IDEA
- **Android SDK**: Required for Android development
- **Xcode**: Required for iOS development (Mac only)
- **Git**: Version control system

## Installation Process
Follow these steps to set up and run the project:

1. **Clone the Repository**:
   ```sh
   git clone https://github.com/itsmelaxman/intuji-infogrid
   cd intuji-infogrid
   ```
2. **Install Flutter Dependencies**:
   ```sh
   flutter pub get
   ```
3. **Run the Project**:
   ```sh
   flutter run
   ```
4. **Build for Production**:
   ```sh
   flutter build apk   # For Android
   flutter build ios   # For iOS (Mac required)
   ```

## Technical Requirements

### Development Environment
- **Flutter Version**: 3.29.2
- **Dart Version**: 3.7.2

### Architecture & State Management
- **Architecture**: Clean architecture approach with clear separation of concerns.
- **State Management**: Provider with Clean Architecture.
- **Folder Structure**: Organized into logical modules for scalability and maintainability.
- **Code Style**: Follows Dart style guide and consistent naming conventions.

### Backend Integration
- **API Integration**: Simulated REST API integration using JSON-based mock data.
- **Data Fetching**: Fetches data from local JSON files to demonstrate REST-like data flow.
- **Error Handling**: Implements proper error handling, loading states, and retry mechanisms.

## Project Structure
```
- android/             # Native Android code
- assets/              # Static assets (images, fonts, etc.)
- ios/                 # Native iOS code
- lib/                 # Main Dart source code
  - core/              # Core utilities and shared resources
    - constants/       # Application-wide constant values
    - error/           # Error handling classes
    - network/         # Network-related utilities (e.g., API client)
    - usecase/         # Use case classes for business logic
  - data/              # Data layer
    - models/          # Data models (API responses, local data structures)
    - repositories/    # Repository implementations
  - domain/            # Domain layer
    - entities/        # Core entities
    - repositories/    # Abstract repository interfaces
    - usecases/        # Business logic use cases
  - presentation/      # Presentation layer
    - providers/       # State management using Provider
    - screens/         # UI screens (pages)
    - widgets/         # Common reusable UI widgets
  - main.dart          # Application entry point
- linux/               # Linux platform support
- macos/               # macOS platform support
- web/                 # Web platform support
- windows/             # Windows platform support
- pubspec.yaml         # Project metadata and dependencies
```

## Packages Used
The following packages are used in this project:
- **Provider**: State management (`provider: ^6.1.4`)
- **Dio**: HTTP client for API integration (`dio: ^5.8.0+1`)
- **Shared Preferences**: Local storage (`shared_preferences: ^2.5.3`)
- **Syncfusion Flutter Gauges**: Gauge visualization (`syncfusion_flutter_gauges: ^29.1.38`)
- **Chart Sparkline**: Sparkline charts (`chart_sparkline: ^1.1.1`)
- **Flutter Toast**: Toast notifications (`fluttertoast: ^8.2.12`)
- **Flutter SVG**: SVG rendering (`flutter_svg: ^2.0.17`)
- **Intl**: Internationalization (`intl: ^0.20.2`)

## Core Features
### Authentication Module
- Login screen with form validation, "Remember me" functionality, and secure token storage.
- "Forgot password" flow with email validation.
- Redirection to the dashboard upon successful login.

### Dashboard Module
- Real-time updates of metrics with functional charts and interactive visualizations.
- Pull-to-refresh functionality and smooth animations.

### Product Management Module
- Product detail screen with variant selection, pricing details, and order request functionality.
- Efficient handling of product images and scrolling for long content.

### Team Management Module
- Team member listing with search, sorting, and navigation to member details.
- Efficient avatar loading and proper list scrolling.

### Navigation & Routing
- Bottom navigation bar with proper transitions and state preservation.

## Best Practices
1. **Separation of Concerns**: Keep UI, business logic, and data management separate.
2. **State Management**: Use Provider efficiently for state handling.
3. **Consistent Naming Conventions**: Follow Dart and Flutter best practices.
4. **Code Reusability**: Utilize common widgets and utility functions.
5. **Scalability**: Organize code into logical modules.
6. **Error Handling**: Implement robust error handling.
7. **Localization & Theming**: Ensure adaptability for different languages and themes.

## Conclusion
This structured approach ensures maintainability and scalability, making it easier for developers to collaborate and build upon the existing architecture.