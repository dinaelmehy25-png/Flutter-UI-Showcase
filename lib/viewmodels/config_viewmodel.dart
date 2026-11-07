import 'dart:async';

import 'package:flutter/foundation.dart';

import '../services/remote_config_service.dart';

/// VIEWMODEL: exposes Remote Config values to the Views
/// and rebuilds them when new values are published.
class ConfigViewModel extends ChangeNotifier {
  ConfigViewModel(this._service) {
    _subscription = _service.onUpdated.listen(
      (_) => notifyListeners(),
      onError: (e) => debugPrint('Real-time Remote Config unavailable: $e'),
    );
  }

  final RemoteConfigService _service;
  StreamSubscription<void>? _subscription;

  String get welcomeMessage => _service.welcomeMessage;
  String get buttonText => _service.buttonText;

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
