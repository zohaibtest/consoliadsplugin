import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:consoliadsplugin/consoliadsplugin.dart';
import 'package:consoliadsplugin/constants.dart';

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

  bool devMode = false;
  bool userConsent = true;
  String userSignature = "567f2188d5d283f6fa4fccec99dc6677";

  @override
  void initState() {
    super.initState();
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
}
