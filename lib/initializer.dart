import 'package:more_devs_ecommerce/features/block/pages/block_page.dart';
import 'package:more_devs_ecommerce/features/login/pages/login_page.dart';
import 'package:more_devs_ecommerce/shared/services/remote_config/remote_config_service.dart';
import 'package:network_info_plus/network_info_plus.dart';

class Initializer {
  Initializer._();
  static final Initializer instance = Initializer._();

  final info = NetworkInfo();

  String initialRoute = LoginPage.route;
  String? message;

  Future<void> getInitialRoute() async {
    final wifiIP = await info.getWifiIP();
    final ips = RemoteConfigService.instance.blackList;

    if (wifiIP != null && ips.contains(wifiIP)) {
      message = 'Sua rede está bloqueada.\nTente novamente mais tarde.';
      initialRoute = BlockPage.route;
    } else {
      message = null;
      initialRoute = LoginPage.route;
    }
  }
}
