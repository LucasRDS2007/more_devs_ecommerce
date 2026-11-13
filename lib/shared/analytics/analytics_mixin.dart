import 'package:flutter/widgets.dart';
import 'package:more_devs_ecommerce/shared/analytics/app_analytics.dart';
 
mixin AnalyticsMixin<T extends StatefulWidget> on State<T> {
 
  String get screenName;
 
  @override
  void initState() {
    super.initState();
    AppAnalytics.instance.logScreenView(screenName);
  }
 
  void logButtonClick(String buttonName) {
    AppAnalytics.instance.logButtonClick(buttonName, screenName: screenName);
  }

  void login(String method,) {
    AppAnalytics.instance.sendEvent('login', screenName: screenName, parametersEvent: {'method': method});
  }

  void loginFailed(String reason){
  AppAnalytics.instance.sendEvent('login_failed', screenName: screenName, parametersEvent: {'reason': reason});
}
}
 