import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:consoliadsplugin/consoliadsplugin.dart';
import 'package:consoliadsplugin/constants.dart';
import 'package:consoliadsplugin/text_view.dart';
import 'package:consoliadsplugin/ca_icon_view.dart';

void main() {
  // final licenseData = LicenseData(copyrightHolderName: 'Consoliads');
  //print(mit(licenseData));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String keyTv = "banner";
  bool devMode = false;
  bool userConsent = true;
  String userSignature = "567f2188d5d283f6fa4fccec99dc6677";
  TextViewController? textViewController = null;
  ConsoliadsIconAdViewController? iconAdViewController = null;

  @override
  void initState() {
    super.initState();
  }

  void _onTextViewCreated(TextViewController controller) {
    //controller.setText('Hello from Android!');
    textViewController = controller;
  }
  
  void setText(){
    textViewController!.setText("my custom text for textview");
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('CONSOLIADS SAMPLE'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 50.0,
                width: 320.0,
                child: ConsoliadsIconAdView(
                  onIconAdViewCreated: _onIconAdViewCreated,
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 50.0,
                width: 320.0,
                child: TextView(
                  key: Key(keyTv),
                  onTextViewCreated: _onTextViewCreated,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'SAMPLE APP FOR PLUGIN TESTING',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ), //TextStyle
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'DEVMODE  : ',
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ), //Text
                  SizedBox(width: 40), //SizedBox
                  /** Checkbox Widget **/
                  Checkbox(
                      value: this.devMode,
                      onChanged: (value){
                        setState(() {
                          this.devMode = value!;
                        });
                      }
                  ), //Checkbox
                ], //<Widget>[]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'USER CONSENT  : ',
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ), //Text
                  SizedBox(width: 0), //SizedBox
                  /** Checkbox Widget **/
                  Checkbox(
                      value: this.userConsent,
                      onChanged: (value){
                        setState(() {
                          this.userConsent = value!;
                        });
                      }
                  ), //Checkbox
                ], //<Widget>[]
              ),
              MaterialButton(
                height: 40.0,
                minWidth: 200.0,
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: new Text("INT CONSOLIADS PLUGIN"),
                onPressed: () {
                  ConsoliAdsPlugin.instance.initSDK(devMode, userConsent, userSignature);
                },
                splashColor: Colors.redAccent,
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    height: 40.0,
                    minWidth: 160.0,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: new Text("LOAD INTERSTITIAL"),
                    onPressed: () {
                      ConsoliAdsPlugin.instance.loadInterstitial(PlaceholderName.Default);
                    },
                    splashColor: Colors.redAccent,
                  ),
                  MaterialButton(
                    height: 40.0,
                    minWidth: 160.0,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: new Text("SHOW INTERSTITIAL"),
                    onPressed: () {
                      ConsoliAdsPlugin.instance.showInterstitial(PlaceholderName.Default);
                    },
                    splashColor: Colors.redAccent,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    height: 40.0,
                    minWidth: 160.0,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: new Text("LOAD REWARDED"),
                    onPressed: () {
                    },
                    splashColor: Colors.redAccent,
                  ),
                  MaterialButton(
                    height: 40.0,
                    minWidth: 160.0,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: new Text("SHOW REWARDED"),
                    onPressed: () {
                    },
                    splashColor: Colors.redAccent,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    height: 40.0,
                    minWidth: 160.0,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: new Text("SHOW BANNER"),
                    onPressed: () {
                      setText();
                    },
                    splashColor: Colors.redAccent,
                  ),
                  MaterialButton(
                    height: 40.0,
                    minWidth: 160.0,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: new Text("HIDE BANNER"),
                    onPressed: () {
                      textViewController!.destroy();
                    },
                    splashColor: Colors.redAccent,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    height: 40.0,
                    minWidth: 160.0,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: new Text("SHOW ICON"),
                    onPressed: () {
                      iconAdViewController!.showIconAd(PlaceholderName.Default);
                    },
                    splashColor: Colors.redAccent,
                  ),
                  MaterialButton(
                    height: 40.0,
                    minWidth: 160.0,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: new Text("HIDE ICON"),
                    onPressed: () {
                      iconAdViewController!.destroyIconAd();
                    },
                    splashColor: Colors.redAccent,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onIconAdViewCreated(ConsoliadsIconAdViewController controller) {

  }
}
