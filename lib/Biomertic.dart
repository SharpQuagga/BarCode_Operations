import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class Bio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Biome(),
    );
  }
}

class Biome extends StatefulWidget {
  @override
  _BiomeState createState() => _BiomeState();
}

class _BiomeState extends State<Biome> {

  bool _canCheckBiometrics = false;
  String _authOrNot = "Not Authorized";
  List<BiometricType> availableBiometricsType = List<BiometricType>();
  LocalAuthentication _localAuthentication = LocalAuthentication();

  Future<void> _checkBiometric() async{
    bool canCheckBiometric = false;
    try{
    canCheckBiometric = await _localAuthentication.canCheckBiometrics;
    } on PlatformException catch(e){
      print(e);
    }
      
      if(!mounted) return;
      
      _ListOfBiometricType();
          setState(() {
        _canCheckBiometrics=canCheckBiometric;
          });
  }



  Future<void> _ListOfBiometricType() async{
   List<BiometricType> listOfBiometric;

    try{
      listOfBiometric = await _localAuthentication.getAvailableBiometrics();
    } on PlatformException catch(e){
      print(e);
    }
      
      if(!mounted) return;
          setState(() {
            availableBiometricsType = listOfBiometric;
          });
  }




    Future<void> _authorizeNow() async{
      bool _isAuthorized = false;

    try{
      _isAuthorized = await _localAuthentication.authenticateWithBiometrics(
        localizedReason: "Please Authenticate to Log In into the App",
        stickyAuth: false,
        useErrorDialogs: true,
      );
    } on PlatformException catch(e){
      print(e);
    }
      
      if(!mounted) return;
          setState(() {
            if(_isAuthorized){
              _authOrNot = "User Authorized";
              //Navigate to next page
              //Can call a toast with _authOrNot
            }else{ 
              _authOrNot = "Not Authorized"; }
          });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("Do you want to enhance the security of the app by using Biomatric Secuity"),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                 onPressed: () {
                    _checkBiometric();
                 },
                 child: Text("Yes"),
                 colorBrightness: Brightness.dark,
                 color: Colors.blue,
              ),
              RaisedButton(
                 onPressed: () {
                   //Next Page
                 },
                 child: Text("NO"),
                 colorBrightness: Brightness.dark,
                 color: Colors.blue,
              ),
               RaisedButton(
                 onPressed: () {
                   _authorizeNow();
                 },
                 child: Text("Autherize Now"),
                 colorBrightness: Brightness.dark,
                 color: Colors.blue,
              ),
            ],
          ),
          Text("${availableBiometricsType.toString()}"),
          Text("$_authOrNot"),
        ],
      ),
    );
  }
}