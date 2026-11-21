import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BootstrapService {
  BootstrapService._();

  static final BootstrapService instance = BootstrapService._();

  bool _isReady = false;

  bool get isready => _isReady;

  /// Call once at app start (from splash `initState`).
  Future<void> initialize() async {
    if (_isReady) return;

    // 1. Init Hive (on-device storage)
    await Hive.initFlutter();

    // 2. Open all boxes the app needs.
    await Future.wait([
      Hive.openBox('user_profile'),
      Hive.openBox('splits'),
      Hive.openBox('exercises'),
      Hive.openBox('sessions'),
      Hive.openBox('bodyweights'),
      Hive.openBox('settings'),
    ]);

    await _seedIfEmpty();

    _isReady = true;

    debugPrint('[Bootstrap] Ready');
  }

  Future<void> _seedIfEmpty() async {}
}
