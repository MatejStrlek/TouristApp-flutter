# Project for Flutter course - Tourist App

First flutter project - Tourist App.

TouristApp is a mobile application designed to help users discover and save their favorite sights. The app is developed in Flutter, supporting both Android and iOS platforms. It features a user-friendly interface that allows users to browse sights and manage favorites. The backend communicates with a REST API for data fetching. The app also stores some information locally for offline access.

## Features

- **User Authentication**: Users can register, log in, and manage their profile.
- **Sight Browsing**: Users can browse and explore various tourist sights.
- **Favorites Management**: Users can save and manage their favorite sights.

## Technology Stack

- **Flutter**: Used for the development of the mobile app, providing support for both Android and iOS platforms.
- **REST API**: Used for communication between the app and the backend, fetching sight data and interacting with the server.
- **Hive Database**: For local storage to cache data such as user preferences and favorite sights.
- **Firebase**: Integrated for user authentication.
- **Retrofit/Dio**: Used for handling asynchronous network requests.

## Functionalities

### Platform Specifics

- The app is designed to take advantage of platform-specific features, such as device hardware management permissions (e.g., location and notifications), and implementing native widgets (Material for Android, Cupertino for iOS).

### Architecture

- The app follows **Clean Architecture** (separating concerns into data, domain, and presentation layers) to maintain code scalability and testability.
- Advanced mobile app architecture principles were considered during the development, ensuring that the app is easy to maintain and extend in the future.

### User Experience

- **Animations**: Custom animations were created to enhance user experience, including smooth screen transitions using Flutter's Hero animation and animated button presses.
- **Graphical Interface**: Advanced GUI elements were developed, such as custom widgets and complex UI elements that react to user interactions, like form validation.

### Data and Asynchronous Communication

- The app leverages asynchronous communication with external services using Retrofit/Dio for networking, ensuring a smooth experience while waiting for tasks to complete.
- The **Hive database** is used for local storage of favorite items and user settings, with advanced object-relational mapping to handle data relationships efficiently.

### Email Verification and Password Reset

- **Email Verification**: Upon registration, users will receive a verification email to confirm their account.
- **Password Reset**: Users can reset their password by receiving a reset link via email, ensuring a secure and convenient recovery process.

### Permissions and Notifications

- The app requests necessary device permissions (location, notifications, etc.) via the Android Manifest and iOS Info.plist files to ensure proper functionality on each platform.

## Installation

### Prerequisites

- Flutter SDK installed.
- Android Studio or Xcode for building the app on Android or iOS respectively.

### Clone the Repository

```bash
git clone https://github.com/MatejStrlek/TouristApp-flutter.git
