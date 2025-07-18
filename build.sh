#!/bin/bash

echo "Building FRP Android APK..."
echo

echo "Checking Flutter installation..."
if ! command -v flutter &> /dev/null; then
    echo "Error: Flutter is not installed or not in PATH"
    echo "Please install Flutter SDK first: https://flutter.dev/docs/get-started/install"
    exit 1
fi

flutter --version
echo

echo "Getting dependencies..."
if ! flutter pub get; then
    echo "Error: Failed to get dependencies"
    exit 1
fi

echo
echo "Cleaning previous builds..."
flutter clean
flutter pub get

echo
echo "Building Debug APK..."
if ! flutter build apk --debug; then
    echo "Error: Failed to build debug APK"
    exit 1
fi

echo
echo "Building Release APK..."
if ! flutter build apk --release; then
    echo "Error: Failed to build release APK"
    exit 1
fi

echo
echo "Build completed successfully!"
echo
echo "APK files location:"
echo "Debug APK: build/app/outputs/flutter-apk/app-debug.apk"
echo "Release APK: build/app/outputs/flutter-apk/app-release.apk"
echo
