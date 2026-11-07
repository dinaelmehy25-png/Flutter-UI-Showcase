# Login with Firebase (MVVM)

Flutter + MVVM + Firebase Authentication + Firebase Remote Config.

## Setup (Windows)
1. Unzip to a short path on drive C:, e.g. C:\dev\loginwithfirebase
2. Copy lib\firebase_options.dart from your old project into lib\
   (or run `flutterfire configure` in this folder).
3. Double-click setup.bat (or run it from cmd in this folder).
4. Start the emulator and run `flutter run`.

## Firebase console
- Authentication > Sign-in method > enable Email/Password
- Remote Config > add String parameters `welcome_message` and `button_text` > Publish

## What setup.bat does
- `flutter create .` adds android/ios/web folders for your Flutter version (keeps existing files)
- sets minSdk 23 and kotlin.incremental=false
- upgrades packages to the latest compatible versions
- cleans old builds
