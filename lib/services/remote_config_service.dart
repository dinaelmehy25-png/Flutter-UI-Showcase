import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';

/// MODEL LAYER (data source): the only file that talks to Firebase Remote Config.
class RemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  // Keys must match the parameter names in the Firebase console exactly.
  static const String welcomeMessageKey = 'welcome_message';
  static const String buttonTextKey = 'button_text';

  Future<void> init() async {
    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        // Short interval for testing. Use Duration(hours: 1) in production.
        minimumFetchInterval: const Duration(minutes: 1),
      ),
    );

    // Defaults are used until (or if) the fetch succeeds.
    await _remoteConfig.setDefaults(const {
      welcomeMessageKey: 'Welcome',
      buttonTextKey: 'Sign out',
    });

    try {
      await _remoteConfig.fetchAndActivate();
    } catch (e) {
      debugPrint('Remote Config fetch failed, using defaults: $e');
    }
  }

  String get welcomeMessage => _remoteConfig.getString(welcomeMessageKey);
  String get buttonText => _remoteConfig.getString(buttonTextKey);

  /// Fires whenever you publish new values in the console (real-time updates).
  /// New values are activated before the event reaches the ViewModel.
  Stream<void> get onUpdated => _remoteConfig.onConfigUpdated.asyncMap((_) async {
        await _remoteConfig.activate();
      });
}
