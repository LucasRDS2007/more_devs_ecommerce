import 'package:flutter/widgets.dart';
import 'package:more_devs_ecommerce/shared/services/analytics/app_analytics_service.dart';
 

class AnalyticsEvent {
  static String login = 'login';
  static String loginFailed = 'login_failed';
  static String signup = 'sign_up';
  static String signupFailed = 'sign_up_failed';
  static String viewListName = 'view_list_name';
  static String search = 'search';
}


mixin AnalyticsMixin<T extends StatefulWidget> on State<T> {
 
  String get screenName;
 
  @override
  void initState() {
    super.initState();
    AppAnalyticsService.instance.logScreenView(screenName);
  }
 
  void logButtonClick(String buttonName,Map<String, Object>? parametersEvent) {
    AppAnalyticsService.instance.sendEvent(buttonName, screenName: screenName,parametersEvent: parametersEvent);
  }

  void login(String method,) {
    AppAnalyticsService.instance.sendEvent(AnalyticsEvent.login, screenName: screenName, parametersEvent: {'method': method});
  }

  void loginFailed(String reason){
  AppAnalyticsService.instance.sendEvent(AnalyticsEvent.loginFailed, screenName: screenName, parametersEvent: {'reason': reason});
}
  void signup(String method,) {
    AppAnalyticsService.instance.sendEvent(AnalyticsEvent.signup, screenName: screenName, parametersEvent: {'method': method});
  }

  void signupFailed(String errorType){
  AppAnalyticsService.instance.sendEvent(AnalyticsEvent.signupFailed, screenName: screenName, parametersEvent: {'error_type': errorType});
}

  void viewItemList(String category){
  AppAnalyticsService.instance.sendEvent(AnalyticsEvent.viewListName, screenName: screenName, parametersEvent: {'view_item_list_name': category});
}
void search(String query, String category, String results){
  AppAnalyticsService.instance.sendEvent(AnalyticsEvent.search, screenName: screenName, parametersEvent: {'search_term': query, 'item_list_name': category, 'results_count': results});
}
}
 