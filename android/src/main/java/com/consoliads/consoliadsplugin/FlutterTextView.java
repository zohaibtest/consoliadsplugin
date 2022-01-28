package com.consoliads.consoliadsplugin;

import android.app.Activity;
import android.content.Context;
import android.graphics.Color;
import android.view.View;
import android.widget.TextView;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import static io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import static io.flutter.plugin.common.MethodChannel.Result;

import com.consoliads.mediation.ConsoliAds;
import com.consoliads.mediation.bannerads.CAMediatedBannerView;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.platform.PlatformView;

public class FlutterTextView implements PlatformView, MethodCallHandler  {
    private final CAMediatedBannerView textView;
    private final MethodChannel methodChannel;

    FlutterTextView(Context context, BinaryMessenger messenger, int id) {
        textView = new CAMediatedBannerView(context);
        textView.setBackgroundColor(Color.parseColor("#FFA07A"));
        methodChannel = new MethodChannel(messenger, "ConsoliadsTextViewController/textview_" + id);
        methodChannel.setMethodCallHandler(this);
    }

    @Override
    public View getView() {
        return textView;
    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        switch (methodCall.method) {
            case "setText":
                setText(methodCall, result);
                break;
            case "destory":
                destroy(methodCall, result);
                break;
            default:
                result.notImplemented();
        }

    }

    private void destroy(MethodCall methodCall, Result result) {
        textView.destroyBanner();
        result.success(null);
    }

    private void setText(MethodCall methodCall, Result result) {
        String text = (String) methodCall.arguments;
        //textView.setText(text);
        ConsoliAds.Instance().ShowBanner(ConsoliadspluginPlugin.activity, textView);
        result.success(null);
    }

    @Override
    public void dispose() {}
}