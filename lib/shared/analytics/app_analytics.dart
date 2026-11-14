import 'dart:developer' as developer;


import 'package:firebase_analytics/firebase_analytics.dart';

class AppAnalytics {
  AppAnalytics._();

  static final AppAnalytics instance = AppAnalytics._();

  FirebaseAnalytics get _firebase => FirebaseAnalytics.instance;


 Future<void> logScreenView(String screenName){
  _debugLog('screen_view', {'screen_name': screenName});
  return _firebase.logScreenView(screenName: screenName);
 }
  Future<void> sendEvent(String event, {String? screenName, Map<String, Object>? parametersEvent}){
    final parameters = <String, Object>{
      if(screenName != null) 'screen_name': screenName,
    };
    if (parametersEvent != null){
      parameters.addAll(parametersEvent);
    }
    _debugLog(event, parameters);
    return _firebase.logEvent(name: event, parameters: parameters);
  }

  void _debugLog(String eventName, Map<String, Object> parameters){
    assert((){
      developer.log('Analytics event: $eventName, parameters: $parameters');
      return true;
    }());
  }
}