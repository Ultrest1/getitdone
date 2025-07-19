# getfit

A simple Flutter fitness app demonstrating GetX state management.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Android build with newer Flutter versions

Recent Flutter releases bundle JDK 17 which requires newer Gradle tooling. If
the build fails with a message similar to:

```
[!] Your project's Gradle version is incompatible with the Java version that Flutter is using for Gradle.
```

update the Gradle plugin and wrapper with the following versions:

```
android/build.gradle:
  ext.kotlin_version = '1.8.10'
  classpath 'com.android.tools.build:gradle:7.4.2'

android/gradle/wrapper/gradle-wrapper.properties:
  distributionUrl=https\://services.gradle.org/distributions/gradle-7.5-all.zip
```

These versions are compatible with the Java runtime shipped with Flutter.
