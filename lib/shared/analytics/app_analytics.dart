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


  Future<void> logButtonClick(String buttonName, {String? screenName}){
    final parameters = <String, Object>{
      'button_name': buttonName,
      if(screenName != null) 'screen_name': screenName,
    };
    _debugLog('button_click', parameters);
    return _firebase.logEvent(name: 'button_click', parameters: parameters);
  }

  Future<void> sendEvent(String event, {String? screenName, Map<String, Object>? parametersEvent}){
    final parameters = <String, Object>{
      'event': event,
      if(screenName != null) 'screen_name': screenName,

    };
    if (parametersEvent != null){
      parameters.addAll(parametersEvent);
    }
    _debugLog('send_event', parameters);
    return _firebase.logEvent(name: 'button_click', parameters: parameters);
  }

  void _debugLog(String eventName, Map<String, Object> parameters){
    assert((){
      developer.log('Analytics event: $eventName, parameters: $parameters');
      return true;
    }());
  }
}