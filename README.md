# Simple Chat with Firestore

A simple real-time chat application built with Flutter and Firebase Firestore.

## Features

- Real-time messaging using Firebase Firestore.
- User authentication (Email/Password).
- Simple UI for displaying messages.

## Getting Started

1.  Create a Firebase project and enable Firestore.
2.  Download `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) and add them to your project.
3.  Update `pubspec.yaml` with the necessary dependencies.
4.  Run `flutter pub get` to install the dependencies.
5.  Configure Firebase in your Flutter app.
6.  Run the app.

## Dependencies

-   `flutter`
-   `firebase_core`
-   `cloud_firestore`
-   `firebase_auth`
-   `provider`
-   `intl`

## Folder Structure


lib/
├── main.dart
├── screens/
│   ├── chat_screen.dart
│   └── login_screen.dart
├── models/
│   └── message.dart
├── services/
│   └── auth_service.dart
│   └── database_service.dart

