
import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';

class RemoteConfigService {
  RemoteConfigService._();
  static final instance = RemoteConfigService._();

  final _rc = FirebaseRemoteConfig.instance;

  static const _kCartEnabled = 'cart_enabled';
  static const _kWelcomeMessage = 'welcome_message';
  static const _kBlackList = 'black_list';

  Future<void> init() async {
    await _rc.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      minimumFetchInterval: kDebugMode
          ? Duration.zero
          : const Duration(hours: 1),
    ));

    await _rc.setDefaults(const {
      _kCartEnabled: false,
      _kWelcomeMessage: 'Seja bem-vindo,',
      _kBlackList: '{"blocked_ips": []}',
    });

    try {
      await _rc.fetchAndActivate();
    } catch (e) {
      debugPrint('Remote Config fetch falhou: $e');
    }
  }

  bool get cartEnabled => _rc.getBool(_kCartEnabled);
  String get welcomeMessage => _rc.getString(_kWelcomeMessage);
  List<String> get blackList {
    final data = jsonDecode(_rc.getString(_kBlackList));
    return List<String>.from(data['blocked_ips'] ?? []);
  }
}
