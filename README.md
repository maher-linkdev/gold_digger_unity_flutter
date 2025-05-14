# Flutter Unity Integration

This project demonstrates how to integrate a Unity game or scene into a Flutter application. It uses the `flutter_unity_widget` package to embed a Unity view within a Flutter widget.

## Getting Started

### Prerequisites

* Flutter SDK installed.
* Unity Editor installed.
* A Unity project to integrate.

### Installation

1.  **Add the `flutter_unity_widget` package to your Flutter project:**

    ```yaml
    dependencies:
      flutter_unity_widget: ^latest_version # Replace with the latest version
    ```

    Run `flutter pub get` to install the package.

2.  **Set up your Unity project:**

    * Configure your Unity project's build settings for the target platform (Android or iOS).

3.  **Export Unity project:**

    * Export the Unity project for the desired platform (Android or iOS). The output of the export will be integrated into the Flutter project.

4.  **Integrate Unity build into Flutter project:**

    * Follow the instructions in the `flutter_unity_widget` documentation for integrating the exported Unity build into your Flutter project. This typically involves copying the Unity build output into specific directories in your Flutter project and modifying some build configuration files.
