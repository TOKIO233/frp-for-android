@echo off
echo Building FRP Android APK...
echo.

echo Checking Flutter installation...
flutter --version
if %errorlevel% neq 0 (
    echo Error: Flutter is not installed or not in PATH
    echo Please install Flutter SDK first: https://flutter.dev/docs/get-started/install
    pause
    exit /b 1
)

echo.
echo Getting dependencies...
flutter pub get
if %errorlevel% neq 0 (
    echo Error: Failed to get dependencies
    pause
    exit /b 1
)

echo.
echo Cleaning previous builds...
flutter clean
flutter pub get

echo.
echo Building Debug APK...
flutter build apk --debug
if %errorlevel% neq 0 (
    echo Error: Failed to build debug APK
    pause
    exit /b 1
)

echo.
echo Building Release APK...
flutter build apk --release
if %errorlevel% neq 0 (
    echo Error: Failed to build release APK
    pause
    exit /b 1
)

echo.
echo Build completed successfully!
echo.
echo APK files location:
echo Debug APK: build\app\outputs\flutter-apk\app-debug.apk
echo Release APK: build\app\outputs\flutter-apk\app-release.apk
echo.
pause
