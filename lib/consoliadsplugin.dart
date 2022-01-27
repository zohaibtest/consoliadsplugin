
import 'dart:async';

import 'package:flutter/services.dart';

import 'constants.dart';

class ConsoliAdsPlugin {

  static ConsoliAdsPlugin instance = new ConsoliAdsPlugin();

  static const MethodChannel _channel = MethodChannel('consoliadsplugin');

  void initSDK(bool devMode , bool userConsent , String userSignature){
    _channel.setMethodCallHandler((call) => _handleMethod(call));
    _channel.invokeMethod('init' , [devMode,userConsent,userSignature ]);
    //_channel.invokeMethod('init' , [{"devMode":devMode} , {"userConsent":userConsent}  , {"userSignature":userSignature} ]);
  }

  void loadInterstitial([PlaceholderName placeholderName = PlaceholderName.Default]){
    _channel.invokeMethod('loadInterstitial', [placeholderName.value]);
  }

  void showInterstitial([PlaceholderName placeholderName = PlaceholderName.Default]){
    _channel.invokeMethod('showInterstitial', [placeholderName.value]);
  }

  void loadRewardedVideo([PlaceholderName placeholderName = PlaceholderName.Default]){
    _channel.invokeMethod('loadRewardedVideo', [placeholderName.value]);
  }

  void showRewardedVideo([PlaceholderName placeholderName = PlaceholderName.Default]){
    _channel.invokeMethod('showRewardedVideo' , [placeholderName.value]);
  }

  Future<dynamic> _handleMethod(MethodCall call) async {
    switch(call.method) {
      case "initResult":{
        break;
      }
    }
  }
}
