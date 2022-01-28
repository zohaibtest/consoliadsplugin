package com.consoliads.consoliadsplugin;

import android.app.Activity;

import androidx.annotation.NonNull;

import com.consoliads.mediation.ConsoliAds;
import com.consoliads.mediation.constants.PlaceholderName;

import java.util.List;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry;

/** ConsoliadspluginPlugin */
public class ConsoliadspluginPlugin implements FlutterPlugin, MethodCallHandler , ActivityAware {

  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  public static Activity activity;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "consoliadsplugin");
    channel.setMethodCallHandler(this);
    flutterPluginBinding.getPlatformViewRegistry().registerViewFactory("ConsoliadsTextView", new TextViewFactory(flutterPluginBinding.getBinaryMessenger()));
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    }
    else if (call.method.equals("init")) {
      List<Object> arguments = call.arguments();
      boolean devMode = (boolean) arguments.get(0);
      boolean userConsent =  (boolean) arguments.get(1);
      String userSignature =  (String) arguments.get(2);
      ConsoliAds.Instance().initialize(devMode, userConsent ,activity , userSignature);
    }
    else if (call.method.equals("loadInterstitial")) {
      List<Object> arguments = call.arguments();
      int placeholderValue = (int) arguments.get(0);
      PlaceholderName placeholderName = PlaceholderName.fromInteger(placeholderValue);
      ConsoliAds.Instance().LoadInterstitial(placeholderName);
    }
    else if (call.method.equals("showInterstitial")) {
      List<Object> arguments = call.arguments();
      int placeholderValue = (int) arguments.get(0);
      PlaceholderName placeholderName = PlaceholderName.fromInteger(placeholderValue);
      ConsoliAds.Instance().ShowInterstitial(placeholderName,activity);
    }
    else if (call.method.equals("")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    }
    else {
      result.notImplemented();
    }
  }




  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  @Override
  public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
    this.activity = binding.getActivity();
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {

  }

  @Override
  public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {

  }

  @Override
  public void onDetachedFromActivity() {

  }
}
