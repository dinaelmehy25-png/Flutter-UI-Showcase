@echo off
cd /d "%~dp0"

echo [1/5] Generating platform folders (existing files are kept)...
call flutter create --org com.example --project-name loginwithfirebase --platforms android,ios,web .
if errorlevel 1 goto fail

echo [2/5] Applying Android settings (minSdk, Kotlin cache fix)...
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0tool\patch_android.ps1"
if errorlevel 1 goto fail

echo [3/5] Updating packages to the latest versions for your Flutter SDK...
call flutter pub upgrade --major-versions
if errorlevel 1 goto fail

echo [4/5] Cleaning old build files...
call flutter clean
call flutter pub get

echo [5/5] Checking Firebase configuration...
if not exist "lib\firebase_options.dart" (
  echo.
  echo   lib\firebase_options.dart is missing.
  echo   Copy it from your old project, or run:  flutterfire configure
  echo.
  goto end
)

echo.
echo Done. Start the emulator, then run:  flutter run
goto end

:fail
echo.
echo Setup stopped because of the error above.

:end
pause
