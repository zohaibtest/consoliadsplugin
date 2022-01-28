import 'dart:async';
import 'package:consoliadsplugin/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef void ConsoliadsIconAdViewCreatedCallback(ConsoliadsIconAdViewController controller);

class ConsoliadsIconAdView extends StatefulWidget {
  const ConsoliadsIconAdView({
    required this.onIconAdViewCreated,
  }) : super();

  final ConsoliadsIconAdViewCreatedCallback onIconAdViewCreated;

  @override
  State<StatefulWidget> createState() => _IconViewState();
}

class _IconViewState extends State<ConsoliadsIconAdView> {
  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: 'ConsoliadsIconView',
        onPlatformViewCreated: _onPlatformViewCreated,
      );
    }
    return Text(
        '$defaultTargetPlatform is not yet supported by the text_view plugin');
  }

  void _onPlatformViewCreated(int id) {
    if (widget.onIconAdViewCreated == null) {
      return;
    }
    widget.onIconAdViewCreated(new ConsoliadsIconAdViewController._(id));
  }
}

class ConsoliadsIconAdViewController {
  ConsoliadsIconAdViewController._(int id)
      : _channel = new MethodChannel('ConsoliadsIconAdViewController/view_$id');

  final MethodChannel _channel;

  Future<void> showIconAd([PlaceholderName placeholderName = PlaceholderName.Default]) async {
    return _channel.invokeMethod('showIconAd', placeholderName.value);
  }

  Future<void> destroyIconAd() async {
    return _channel.invokeMethod('destoryIconAd');
  }

}