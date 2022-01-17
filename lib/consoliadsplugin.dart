
import 'dart:async';

import 'package:flutter/services.dart';

class ConsoliAdsPlugin {
  static const MethodChannel _channel = MethodChannel('consoliadsplugin');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static void initSDK(bool devMode , bool userConsent , String userSignature){
    _channel.invokeMethod('init' , [devMode,userConsent,userSignature ]);
    //_channel.invokeMethod('init' , [{"devMode":devMode} , {"userConsent":userConsent}  , {"userSignature":userSignature} ]);
  }

  static void loadInterstitial(){
    _channel.invokeMethod('loadInterstitial');
  }

  static void showInterstitial(){
    _channel.invokeMethod('showInterstitial');
  }

}
